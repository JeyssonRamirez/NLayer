#region Signature

//   -----------------------------------------------------------------------
//   <copyright file=SciRoleProvider.cs company="SCI Software">
//       Copyright (c) SCI Software Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2012 -02-25  - 01:48 p.m.</Date>
//   <Update> 2012-12-06 - 10:39 a.m.</Update>
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
using System.Web.Security;
using System.Xml.Linq;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

#endregion

namespace Nlayer.Infraestructura.Transversales.Proveedores
{
    [AspNetHostingPermission(SecurityAction.Demand, Unrestricted = true, Level = AspNetHostingPermissionLevel.Minimal)]
    public class SciRoleProvider : RoleProvider
    {
        private string _applicationName;
        private string _connectionString;
        private ConnectionStringSettings _connectionStringSettings;

        public override string ApplicationName
        {
            get { return _applicationName; }
            set { _applicationName = value; }
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (string.IsNullOrEmpty(name))
            {
                name = "SciRoleProvider";
            }

            if (String.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "SCI Role Provider");
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

        #region Overrides of RoleProvider

        public override bool IsUserInRole(string username, string roleName)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EstaElUsuarioEnElRol");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);
            sqlDatabase.AddInParameter(dbCommand, "Rol", DbType.String, roleName);

            return (bool) sqlDatabase.ExecuteScalar(dbCommand);
        }

        public override string[] GetRolesForUser(string username)
        {
            string roles = string.Empty;

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerRolesUsuario");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, username);

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    roles += string.Format("{0},", dataReader.GetString(0));
                }
            }

            if (roles.Length > 0)
            {
                roles = roles.Substring(0, roles.Length - 1);
                string[] r = roles.Split(',');
                return r;
            }

            return new string[0];
        }

        public override void CreateRole(string roleName)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_RegistrarRol");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Nombre", DbType.String, roleName);
            sqlDatabase.AddInParameter(dbCommand, "Activo", DbType.Boolean, true);

            sqlDatabase.ExecuteNonQuery(dbCommand);
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EliminarRol");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Nombre", DbType.String, roleName);

            sqlDatabase.ExecuteNonQuery(dbCommand);

            return true;
        }

        public override bool RoleExists(string roleName)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ExisteRol");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Nombre", DbType.String, roleName);

            bool existeRol = (bool) sqlDatabase.ExecuteScalar(dbCommand);

            return existeRol;
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            XElement usuariosXml = new XElement("Usuarios");
            foreach (string username in usernames)
            {
                usuariosXml.Add(new XElement("Usuario", new XAttribute("Login", username)));
            }

            XElement rolesXml = new XElement("Roles");
            foreach (string role in roleNames)
            {
                rolesXml.Add(new XElement("Rol", new XAttribute("Nombre", role)));
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_RegistrarUsuariosEnRoles");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Usuarios", DbType.Xml, usuariosXml.ToString());
            sqlDatabase.AddInParameter(dbCommand, "Roles", DbType.Xml, rolesXml.ToString());

            sqlDatabase.ExecuteNonQuery(dbCommand);
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            XElement usuariosXml = new XElement("Usuarios");
            foreach (string username in usernames)
            {
                usuariosXml.Add(new XElement("Usuario", new XAttribute("Login", username)));
            }

            XElement rolesXml = new XElement("Roles");
            foreach (string role in roleNames)
            {
                rolesXml.Add(new XElement("Rol", new XAttribute("Nombre", role)));
            }

            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_EliminarUsuariosDeRoles");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Usuarios", DbType.Xml, usuariosXml.ToString());
            sqlDatabase.AddInParameter(dbCommand, "Roles", DbType.Xml, rolesXml.ToString());
            sqlDatabase.AddInParameter(dbCommand, "Activo", DbType.Boolean, true);

            sqlDatabase.ExecuteNonQuery(dbCommand);
        }

        public override string[] GetUsersInRole(string roleName)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuariosPorRol");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Rol", DbType.String, roleName);

            string usuarios = "";

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    usuarios += dataReader.GetString(0) + ",";
                }
            }

            if (usuarios.Length > 0)
            {
                usuarios = usuarios.Substring(0, usuarios.Length - 1);
                return usuarios.Split(',');
            }

            return new string[0];
        }

        public override string[] GetAllRoles()
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerRoles");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);

            string roles = "";

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    roles += dataReader.GetString(0) + ",";
                }
            }

            if (roles.Length > 0)
            {
                roles = roles.Substring(0, roles.Length - 1);
                return roles.Split(',');
            }

            return new string[0];
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
            DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerUsuariosEnRol");

            sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);
            sqlDatabase.AddInParameter(dbCommand, "Rol", DbType.String, roleName);
            sqlDatabase.AddInParameter(dbCommand, "Login", DbType.String, usernameToMatch);

            string usuarios = "";

            using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    usuarios += dataReader.GetString(0) + ",";
                }
            }

            if (usuarios.Length > 0)
            {
                usuarios = usuarios.Substring(0, usuarios.Length - 1);
                return usuarios.Split(',');
            }

            return new string[0];
        }

        #endregion
    }
}