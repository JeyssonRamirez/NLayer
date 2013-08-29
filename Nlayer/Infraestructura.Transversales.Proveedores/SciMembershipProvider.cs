#region Signature

//   -----------------------------------------------------------------------
//   <copyright file=SciMembershipProvider.cs company="SCI Software">
//       Copyright (c) SCI Software Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2012 -02-25  - 01:48 p.m.</Date>
//   <Update> 2012-12-06 - 10:40 a.m.</Update>
//   -----------------------------------------------------------------------

#endregion

#region

using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Configuration.Provider;
using System.Data;
using System.Data.Common;
using System.Security.Cryptography;
using System.Security.Permissions;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Hosting;
using System.Web.Security;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

#endregion

namespace Nlayer.Infraestructura.Transversales.Proveedores
{
    [AspNetHostingPermission(SecurityAction.Demand, Unrestricted = true, Level = AspNetHostingPermissionLevel.Minimal)]
    public sealed class SciMembershipProvider : MembershipProvider
    {
        private const int NewPasswordLength = 6;
        private string _applicationName;
        private string _connectionString;
        private bool _enablePasswordReset;
        private bool _enablePasswordRetrieval;
        private MachineKeySection _machineKey;
        private int _maxInvalidPasswordAttempts;
        private int _minRequiredNonAlphanumericCharacters;
        private int _minRequiredPasswordLength;
        private int _passwordAttemptWindow;
        private MembershipPasswordFormat _passwordFormat;
        private string _passwordStrengthRegularExpression;
        private bool _requiresQuestionAndAnswer;
        private bool _requiresUniqueEmail;
        private bool _writeExceptionsToEventLog;

        public override string ApplicationName
        {
            get { return _applicationName; }
            set { _applicationName = value; }
        }

        public override bool EnablePasswordReset
        {
            get { return _enablePasswordReset; }
        }

        public bool WriteExceptionsToEventLog
        {
            get { return _writeExceptionsToEventLog; }
            set { _writeExceptionsToEventLog = value; }
        }

        public override bool EnablePasswordRetrieval
        {
            get { return _enablePasswordRetrieval; }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get { return _requiresQuestionAndAnswer; }
        }

        public override bool RequiresUniqueEmail
        {
            get { return _requiresUniqueEmail; }
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return _maxInvalidPasswordAttempts; }
        }

        public override int PasswordAttemptWindow
        {
            get { return _passwordAttemptWindow; }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { return _passwordFormat; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return _minRequiredNonAlphanumericCharacters; }
        }

        public override int MinRequiredPasswordLength
        {
            get { return _minRequiredPasswordLength; }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { return _passwordStrengthRegularExpression; }
        }

        private static string GetConfigValue(string configValue, string defaultValue)
        {
            return String.IsNullOrEmpty(configValue) ? defaultValue : configValue;
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException();
            }

            if (string.IsNullOrEmpty(name))
            {
                name = "SciMembershipProvider";
            }

            if (String.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Sci Membership Provider");
            }

            base.Initialize(name, config);

            string aplicacion = HostingEnvironment.ApplicationVirtualPath;

            _applicationName = GetConfigValue(config["applicationName"], aplicacion);
            _maxInvalidPasswordAttempts = Convert.ToInt32(GetConfigValue(config["maxInvalidPasswordAttempts"], "3"));
            _passwordAttemptWindow = Convert.ToInt32(GetConfigValue(config["passwordAttemptWindow"], "10"));
            _minRequiredNonAlphanumericCharacters =
                Convert.ToInt32(GetConfigValue(config["minRequiredNonAlphanumericCharacters"], "1"));
            _minRequiredPasswordLength = Convert.ToInt32(GetConfigValue(config["minRequiredPasswordLength"], "6"));
            _passwordStrengthRegularExpression =
                Convert.ToString(GetConfigValue(config["passwordStrengthRegularExpression"], ""));
            _enablePasswordReset = Convert.ToBoolean(GetConfigValue(config["enablePasswordReset"], "true"));
            _enablePasswordRetrieval = Convert.ToBoolean(GetConfigValue(config["enablePasswordRetrieval"], "true"));
            _requiresQuestionAndAnswer = Convert.ToBoolean(GetConfigValue(config["requiresQuestionAndAnswer"], "false"));
            _requiresUniqueEmail = Convert.ToBoolean(GetConfigValue(config["requiresUniqueEmail"], "true"));
            _writeExceptionsToEventLog = Convert.ToBoolean(GetConfigValue(config["writeExceptionsToEventLog"], "false"));

            string tempFormat = config["passwordFormat"] ?? "Hashed";

            switch (tempFormat)
            {
                case "Hashed":
                    _passwordFormat = MembershipPasswordFormat.Hashed;
                    break;
                default:
                    throw new ProviderException("Formato de password no soportado.");
            }

            ConnectionStringSettings connectionStringSettings =
                ConfigurationManager.ConnectionStrings[config["connectionStringName"]];

            if (connectionStringSettings == null || connectionStringSettings.ConnectionString.Trim() == "")
            {
                throw new ProviderException("La cadena de conexión no puede nula o en blanco.");
            }

            _connectionString = connectionStringSettings.ConnectionString;

            Configuration cfg = WebConfigurationManager.OpenWebConfiguration(HostingEnvironment.ApplicationVirtualPath);
            _machineKey = (MachineKeySection) cfg.GetSection("system.web/machineKey");

            if (_machineKey.ValidationKey.Contains("AutoGenerate"))
            {
                if (PasswordFormat != MembershipPasswordFormat.Clear)
                {
                    throw new ProviderException(
                        "Los passwords Hashed o Encrypted no son soportados con claves autogeneradas.");
                }
            }
        }

        public override MembershipUser CreateUser(string username, string password, string email,
                                                  string passwordQuestion, string passwordAnswer, bool isApproved,
                                                  object providerUserKey, out MembershipCreateStatus status)
        {
            ValidatePasswordEventArgs args = new ValidatePasswordEventArgs(username, password, true);

            OnValidatingPassword(args);

            if (args.Cancel)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            if (_requiresUniqueEmail && GetUserNameByEmail(email) != string.Empty)
            {
                status = MembershipCreateStatus.DuplicateEmail;
                return null;
            }

            MembershipUser membershipUser = GetUser(username, false);

            if (membershipUser == null)
            {
                DateTime registrado = DateTime.Now;

                if (providerUserKey == null)
                {
                    providerUserKey = Guid.NewGuid();
                }
                else
                {
                    if (!(providerUserKey is Guid))
                    {
                        status = MembershipCreateStatus.InvalidProviderUserKey;
                        return null;
                    }
                }

                SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
                DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_RegistrarUsuario");

                sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
                sqlDatabase.AddInParameter(dbCommand, "ProviderUserKey", DbType.Guid, providerUserKey);
                sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
                sqlDatabase.AddInParameter(dbCommand, "Password", DbType.String, Encode(password));
                sqlDatabase.AddInParameter(dbCommand, "Email", DbType.String, email);
                sqlDatabase.AddInParameter(dbCommand, "PreguntaPassword", DbType.String, passwordQuestion);
                sqlDatabase.AddInParameter(dbCommand, "RespuestaPassword", DbType.String, Encode(passwordAnswer));
                sqlDatabase.AddInParameter(dbCommand, "Comentario", DbType.String, null);
                sqlDatabase.AddInParameter(dbCommand, "UltimaActividad", DbType.DateTime, registrado);
                sqlDatabase.AddInParameter(dbCommand, "UltimaSesion", DbType.DateTime, registrado);
                sqlDatabase.AddInParameter(dbCommand, "UltimoCambioDePassword", DbType.DateTime, registrado);
                sqlDatabase.AddInParameter(dbCommand, "CantidadIntentosFallidosPassword", DbType.Int32, 0);
                sqlDatabase.AddInParameter(dbCommand, "InicioIntentosFallidosPassword", DbType.DateTime, registrado);
                sqlDatabase.AddInParameter(dbCommand, "CantidadIntentosFallidosPregunta", DbType.Int32, 0);
                sqlDatabase.AddInParameter(dbCommand, "InicioIntentosFallidosPregunta", DbType.DateTime, registrado);
                sqlDatabase.AddInParameter(dbCommand, "EstaAprobado", DbType.Boolean, isApproved);
                sqlDatabase.AddInParameter(dbCommand, "EstaBloqueado", DbType.Boolean, false);
                sqlDatabase.AddInParameter(dbCommand, "UltimoBloqueo", DbType.DateTime, registrado);
                sqlDatabase.AddInParameter(dbCommand, "Registrado", DbType.DateTime, registrado);

                using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
                {
                    dataReader.Read();
                    membershipUser = GetUserFromDataReader(dataReader);
                }

                status = MembershipCreateStatus.Success;

                return membershipUser;
            }

            status = MembershipCreateStatus.DuplicateUserName;

            return null;
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password,
                                                             string newPasswordQuestion, string newPasswordAnswer)
        {
            if (!ValidateUser(username, password))
            {
                return false;
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ActualizarPreguntaYRespuesta");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.Guid, username);
            sqlDatabase.AddInParameter(dbCommand, "NuevaPregunta", DbType.String, newPasswordQuestion);
            sqlDatabase.AddInParameter(dbCommand, "NuevaRespuesta", DbType.String, newPasswordAnswer);

            int registrosAfectados = sqlDatabase.ExecuteNonQuery(dbCommand);

            if (registrosAfectados > 0)
            {
                return true;
            }

            return false;
        }

        public override string GetPassword(string username, string answer)
        {
            if (!EnablePasswordRetrieval)
            {
                throw new ProviderException("Recuperación del password no permitida.");
            }

            if (PasswordFormat == MembershipPasswordFormat.Hashed)
            {
                throw new ProviderException("No se puede obtener el Hashed password.");
            }

            return null;
        }

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            ValidatePasswordEventArgs args = new ValidatePasswordEventArgs(username, newPassword, true);
            OnValidatingPassword(args);

            if (args.Cancel)
            {
                if (args.FailureInformation != null)
                {
                    throw args.FailureInformation;
                }
                throw new MembershipPasswordException(
                    "El cambio de password se ha cancelado debido a que la validación del nuevo password falló.");
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ActualizarPasswordUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "Password", DbType.String, Encode(oldPassword));
            sqlDatabase.AddInParameter(dbCommand, "NuevoPassword", DbType.String, Encode(newPassword));

            bool actualizado = (bool) sqlDatabase.ExecuteScalar(dbCommand);

            return actualizado;
        }

        public override string ResetPassword(string username, string answer)
        {
            if (!EnablePasswordReset)
            {
                throw new NotSupportedException("El reseteo de password no está disponible.");
            }

            if (answer == null && RequiresQuestionAndAnswer)
            {
                throw new ProviderException("La pregunta de seguridad es obligatoria.");
            }

            string newPassword = Membership.GeneratePassword(NewPasswordLength, _minRequiredNonAlphanumericCharacters);

            ValidatePasswordEventArgs args = new ValidatePasswordEventArgs(username, newPassword, true);

            OnValidatingPassword(args);

            if (args.Cancel)
            {
                if (args.FailureInformation != null)
                {
                    throw args.FailureInformation;
                }
                throw new MembershipPasswordException(
                    "El reseteo del password ha sido cancelado debido a un error en la validación del usuario..");
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ResetearPasswordUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "NuevoPassword", DbType.String, Encode(newPassword));
            sqlDatabase.AddInParameter(dbCommand, "Respuesta", DbType.String, Encode(answer));
            sqlDatabase.AddInParameter(dbCommand, "IntentosPassword", DbType.Int32, _passwordAttemptWindow);
            sqlDatabase.AddInParameter(dbCommand, "MaximoIntentosFallidos", DbType.Int32, _maxInvalidPasswordAttempts);

            int resultado = (int) sqlDatabase.ExecuteScalar(dbCommand);

            switch (resultado)
            {
                case 0:
                    return newPassword;
                case 1:
                    throw new MembershipPasswordException("El usuario no existe.");
                case 2:
                    throw new MembershipPasswordException("El usuario se encuentra bloqueado.");
                case 3:
                    throw new MembershipPasswordException("El usuario no tiene una respuesta establecida.");
                case 4:
                    throw new MembershipPasswordException("Respuesta incorrecta.");
            }

            throw new MembershipPasswordException(
                "Usuario no existe, o el usuario está bloqueado. El password no ha sido reseteado.");
        }

        public override void UpdateUser(MembershipUser user)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ActualizarUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Email", DbType.String, user.Email);
            sqlDatabase.AddInParameter(dbCommand, "Comentario", DbType.String, user.Comment);
            sqlDatabase.AddInParameter(dbCommand, "EstaBloqueado", DbType.Boolean, user.IsApproved);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, user.UserName);

            sqlDatabase.ExecuteNonQuery(dbCommand);
        }

        public override bool ValidateUser(string username, string password)
        {
            bool esValido;

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ValidarUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "Password", DbType.String, Encode(password));
            sqlDatabase.AddInParameter(dbCommand, "IntentosPassword", DbType.Int32, _passwordAttemptWindow);
            sqlDatabase.AddInParameter(dbCommand, "MaximoIntentosFallidos", DbType.Int32, _maxInvalidPasswordAttempts);

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                esValido = dataReader.GetBoolean(0);
            }

            return esValido;
        }

        private byte[] HexToByte(string hexString)
        {
            byte[] returnBytes = new byte[hexString.Length/2];
            for (int i = 0; i < returnBytes.Length; i++)
            {
                returnBytes[i] = Convert.ToByte(hexString.Substring(i*2, 2), 16);
            }
            return returnBytes;
        }

        private string Encode(string valor)
        {
            string encoded;

            switch (PasswordFormat)
            {
                case MembershipPasswordFormat.Hashed:
                    using (HMACSHA1 hash = new HMACSHA1
                        {
                            Key = HexToByte(_machineKey.ValidationKey)
                        })
                    {
                        encoded = Convert.ToBase64String(hash.ComputeHash(Encoding.Unicode.GetBytes(valor)));
                    }
                    break;
                default:
                    throw new ProviderException("Formato de password no soportado.");
            }

            return encoded;
        }

        public override bool UnlockUser(string userName)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_BloquearUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Bloquear", DbType.Boolean, false);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, userName);

            int registrosAfectados = sqlDatabase.ExecuteNonQuery(dbCommand);

            if (registrosAfectados > 0)
            {
                return true;
            }

            return false;
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuarioPorProviderUserKey");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "ProviderUserKey", DbType.Guid, providerUserKey);
            sqlDatabase.AddInParameter(dbCommand, "EstaEnLinea", DbType.Boolean, userIsOnline);

            MembershipUser membershipUser;

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                membershipUser = GetUserFromDataReader(dataReader);
            }

            return membershipUser;
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuarioPorLogin");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "EstaEnLinea", DbType.Boolean, userIsOnline);

            MembershipUser membershipUser;

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                membershipUser = GetUserFromDataReader(dataReader);
            }

            return membershipUser;
        }

        private MembershipUser GetUserFromDataReader(IDataReader dataReader)
        {
            MembershipUser membershipUser = null;

            try
            {
                Guid providerUserKey = dataReader.GetGuid(1);
                string username = dataReader.GetString(3);
                string email = dataReader.GetString(5);
                string passwordQuestion = dataReader.GetValue(6) is DBNull ? null : dataReader.GetString(6);
                string comment = dataReader.GetValue(8) is DBNull ? null : dataReader.GetString(8);
                DateTime lastActivityDate = dataReader.GetDateTime(9);
                DateTime lastLoginDate = dataReader.GetDateTime(10);
                DateTime lastPasswordChangedDate = dataReader.GetDateTime(11);
                bool isApproved = dataReader.GetBoolean(16);
                bool isLockedOut = dataReader.GetBoolean(17);
                DateTime lastLockedOutDate = dataReader.GetDateTime(18);
                DateTime creationDate = dataReader.GetDateTime(19);

                membershipUser = new MembershipUser(Name, username, providerUserKey, email, passwordQuestion, comment,
                                                    isApproved, isLockedOut, creationDate, lastLoginDate,
                                                    lastActivityDate, lastPasswordChangedDate, lastLockedOutDate);
            }
            catch (Exception)
            {
            }

            return membershipUser;
        }

        public override string GetUserNameByEmail(string email)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuarioPorEmail");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Email", DbType.String, email);

            MembershipUser membershipUser;

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                membershipUser = GetUserFromDataReader(dataReader);
            }

            return membershipUser == null ? string.Empty : membershipUser.UserName;
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EliminarUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);

            int registrosAfectados = sqlDatabase.ExecuteNonQuery(dbCommand);

            return registrosAfectados > 0;
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuarios");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            MembershipUserCollection users = new MembershipUserCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();
                while (dataReader.Read())
                {
                    users.Add(GetUserFromDataReader(dataReader));
                }
            }

            return users;
        }

        public override int GetNumberOfUsersOnline()
        {
            TimeSpan onlineSpan = new TimeSpan(0, Membership.UserIsOnlineTimeWindow, 0);
            DateTime compareTime = DateTime.Now.Subtract(onlineSpan);

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerTotalUsuariosEnLinea");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "FechaComparacion", DbType.DateTime, compareTime);

            int totalUsuariosEnLinea = (int) sqlDatabase.ExecuteScalar(dbCommand);

            return totalUsuariosEnLinea;
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize,
                                                                 out int totalRecords)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuariosPorLogin");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, usernameToMatch);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            MembershipUserCollection users = new MembershipUserCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();
                while (dataReader.Read())
                {
                    users.Add(GetUserFromDataReader(dataReader));
                }
            }

            return users;
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize,
                                                                  out int totalRecords)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuariosPorEmail");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Email", DbType.String, emailToMatch);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            MembershipUserCollection users = new MembershipUserCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                dataReader.Read();
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();
                while (dataReader.Read())
                {
                    users.Add(GetUserFromDataReader(dataReader));
                }
            }

            return users;
        }
    }
}