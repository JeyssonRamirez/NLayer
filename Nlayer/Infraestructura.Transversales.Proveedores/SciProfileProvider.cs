#region Signature

//   -----------------------------------------------------------------------
//   <copyright file=SciProfileProvider.cs company="SCI Software">
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
using System.Security.Permissions;
using System.Web;
using System.Web.Hosting;
using System.Web.Profile;
using System.Xml.Linq;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

#endregion

namespace Sci.Nlayer.Infraestructura.Transversales.Proveedores
{
    [AspNetHostingPermission(SecurityAction.Demand, Unrestricted = true, Level = AspNetHostingPermissionLevel.Minimal)]
    public class SciProfileProvider : ProfileProvider
    {
        private string _applicationName;
        private string _connectionString;
        private ConnectionStringSettings _connectionStringSettings;

        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (string.IsNullOrEmpty(name))
            {
                name = "SciProfileProvider";
            }

            if (String.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "SCI Profile Provider");
            }

            base.Initialize(name, config);

            if (config["applicationName"] == null || config["applicationName"].Trim() == "")
            {
                _applicationName = HostingEnvironment.ApplicationVirtualPath;
            }
            else
            {
                _applicationName = config["applicationName"];
            }

            _connectionStringSettings = ConfigurationManager.ConnectionStrings[config["connectionStringName"]];
            if (_connectionStringSettings == null || _connectionStringSettings.ConnectionString.Trim() == "")
            {
                throw new ProviderException("La cadena de conexión no puede ser nula.");
            }

            _connectionString = _connectionStringSettings.ConnectionString;
        }

        private void CheckParameters(int pageIndex, int pageSize)
        {
            if (pageIndex < 0)
            {
                throw new ArgumentException(string.Format("El indice {0} de la página debe ser mayor a cero.", pageIndex));
            }

            if (pageSize < 1)
            {
                throw new ArgumentException(string.Format("El tamaño por página {0} debe ser mayor a cero.", pageSize));
            }
        }

        private ProfileInfo GetProfileInfoFromReader(IDataReader reader)
        {
            string username = reader.GetString(0);
            DateTime lastActivityDate = new DateTime();

            if (reader.GetValue(1) != DBNull.Value)
            {
                lastActivityDate = reader.GetDateTime(1);
            }

            DateTime lastUpdatedDate = new DateTime();

            if (reader.GetValue(2) != DBNull.Value)
            {
                lastUpdatedDate = reader.GetDateTime(2);
            }

            bool isAnonymous = reader.GetBoolean(3);
            ProfileInfo profileInfo = new ProfileInfo(username, isAnonymous, lastActivityDate, lastUpdatedDate, 0);

            return profileInfo;
        }

        #region Overrides of SettingsProvider

        public override string ApplicationName
        {
            get { return _applicationName; }
            set { _applicationName = value; }
        }

        public override SettingsPropertyValueCollection GetPropertyValues(SettingsContext context,
                                                                          SettingsPropertyCollection collection)
        {
            string username = (string) context["UserName"];
            bool isAuthenticated = (bool) context["IsAuthenticated"];
            SettingsPropertyValueCollection settingsPropertyValueCollection = new SettingsPropertyValueCollection();

            foreach (SettingsProperty settingsProperty in collection)
            {
                SettingsPropertyValue settingsPropertyValue = new SettingsPropertyValue(settingsProperty)
                    {PropertyValue = settingsProperty.DefaultValue};
                settingsPropertyValueCollection.Add(settingsPropertyValue);
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerPerfilUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "SoloActividad", DbType.Boolean, true);
            sqlDatabase.AddInParameter(dbCommand, "EstaAutenticado", DbType.Boolean, isAuthenticated);

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    SettingsPropertyValue settingsPropertyValue =
                        settingsPropertyValueCollection[dataReader.GetString(0)];
                    settingsPropertyValue.PropertyValue = dataReader.GetString(1);
                }
            }

            return settingsPropertyValueCollection;
        }

        public override void SetPropertyValues(SettingsContext context, SettingsPropertyValueCollection collection)
        {
            string username = (string) context["UserName"];
            bool isAuthenticated = (bool) context["IsAuthenticated"];

            XElement propiedadesXml = new XElement("Propiedades");
            foreach (SettingsPropertyValue settingsPropertyValue in collection)
            {
                propiedadesXml.Add(new XElement("Propiedad",
                                                new XAttribute("Nombre", settingsPropertyValue.Property.Name.ToUpper()),
                                                new XAttribute("Tipo",
                                                               settingsPropertyValue.Property.PropertyType.Name.ToUpper()),
                                                new XAttribute("ValorPropiedad", settingsPropertyValue.PropertyValue)));
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_RegistrarValorPropiedad");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "Propiedades", DbType.Xml, propiedadesXml.ToString());
            sqlDatabase.AddInParameter(dbCommand, "SoloActividad", DbType.Boolean, false);
            sqlDatabase.AddInParameter(dbCommand, "EstaAutenticado", DbType.Boolean, isAuthenticated);

            sqlDatabase.ExecuteNonQuery(dbCommand);
        }

        #endregion

        #region Overrides of ProfileProvider

        public override int DeleteProfiles(ProfileInfoCollection profiles)
        {
            XElement perfilesXml = new XElement("Perfiles");
            foreach (ProfileInfo profileInfo in profiles)
            {
                perfilesXml.Add(new XElement("Perfil", new XAttribute("Login", profileInfo.UserName)));
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EliminarPerfil");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Perfiles", DbType.Xml, perfilesXml.ToString());

            sqlDatabase.ExecuteNonQuery(dbCommand);

            return profiles.Count;
        }

        public override int DeleteProfiles(string[] usernames)
        {
            XElement perfilesXml = new XElement("Perfiles");
            foreach (string username in usernames)
            {
                perfilesXml.Add(new XElement("Perfil", new XAttribute("Login", username)));
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EliminarPerfil");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Perfiles", DbType.Xml, perfilesXml.ToString());

            sqlDatabase.ExecuteNonQuery(dbCommand);

            return usernames.Length;
        }

        public override int DeleteInactiveProfiles(ProfileAuthenticationOption authenticationOption,
                                                   DateTime userInactiveSinceDate)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EliminarPerfilesInactivos");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "UltimaActividad", DbType.DateTime, userInactiveSinceDate);

            int deleteCount = (int) sqlDatabase.ExecuteScalar(dbCommand);

            return deleteCount;
        }

        public override int GetNumberOfInactiveProfiles(ProfileAuthenticationOption authenticationOption,
                                                        DateTime userInactiveSinceDate)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ActualizarUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "UltimaActividad", DbType.DateTime, userInactiveSinceDate);

            int inactiveProfiles = (int) sqlDatabase.ExecuteScalar(dbCommand);

            return inactiveProfiles;
        }

        public override ProfileInfoCollection GetAllProfiles(ProfileAuthenticationOption authenticationOption,
                                                             int pageIndex, int pageSize, out int totalRecords)
        {
            CheckParameters(pageIndex, pageSize);

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerPerfiles");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            ProfileInfoCollection profileInfoCollection = new ProfileInfoCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();

                while (dataReader.Read())
                {
                    ProfileInfo profileInfo = GetProfileInfoFromReader(dataReader);
                    profileInfoCollection.Add(profileInfo);
                }
            }

            return profileInfoCollection;
        }

        public override ProfileInfoCollection GetAllInactiveProfiles(ProfileAuthenticationOption authenticationOption,
                                                                     DateTime userInactiveSinceDate, int pageIndex,
                                                                     int pageSize, out int totalRecords)
        {
            CheckParameters(pageIndex, pageSize);

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerPerfilesInactivos");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "UltimaActividad", DbType.Date, userInactiveSinceDate);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            ProfileInfoCollection profileInfoCollection = new ProfileInfoCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();

                while (dataReader.Read())
                {
                    ProfileInfo profileInfo = GetProfileInfoFromReader(dataReader);
                    profileInfoCollection.Add(profileInfo);
                }
            }

            return profileInfoCollection;
        }

        public override ProfileInfoCollection FindProfilesByUserName(ProfileAuthenticationOption authenticationOption,
                                                                     string usernameToMatch, int pageIndex, int pageSize,
                                                                     out int totalRecords)
        {
            CheckParameters(pageIndex, pageSize);

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerPerfilesPorUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, usernameToMatch);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            ProfileInfoCollection profileInfoCollection = new ProfileInfoCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();

                while (dataReader.Read())
                {
                    ProfileInfo profileInfo = GetProfileInfoFromReader(dataReader);
                    profileInfoCollection.Add(profileInfo);
                }
            }

            return profileInfoCollection;
        }

        public override ProfileInfoCollection FindInactiveProfilesByUserName(
            ProfileAuthenticationOption authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate,
            int pageIndex, int pageSize, out int totalRecords)
        {
            CheckParameters(pageIndex, pageSize);

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerPerfilesInactivosPorUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, usernameToMatch);
            sqlDatabase.AddInParameter(dbCommand, "UltimaActividad", DbType.Date, userInactiveSinceDate);
            sqlDatabase.AddInParameter(dbCommand, "Inicio", DbType.Int32, pageIndex);
            sqlDatabase.AddInParameter(dbCommand, "Cantidad", DbType.Int32, pageSize);

            ProfileInfoCollection profileInfoCollection = new ProfileInfoCollection();

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                totalRecords = dataReader.GetInt32(0);
                dataReader.NextResult();

                while (dataReader.Read())
                {
                    ProfileInfo profileInfo = GetProfileInfoFromReader(dataReader);
                    profileInfoCollection.Add(profileInfo);
                }
            }

            return profileInfoCollection;
        }

        #endregion
    }
}