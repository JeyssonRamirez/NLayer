#region Signature

//   -----------------------------------------------------------------------
//   <copyright file=SciSiteMapProvider.cs company="SCI Software">
//       Copyright (c) SCI Software Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2012 -02-25  - 01:48 p.m.</Date>
//   <Update> 2012-12-06 - 10:39 a.m.</Update>
//   -----------------------------------------------------------------------

#endregion

#region

using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Configuration.Provider;
using System.Data;
using System.Data.Common;
using System.Globalization;
using System.Security.Permissions;
using System.Web;
using System.Web.Hosting;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

#endregion

namespace Nlayer.Infraestructura.Transversales.Proveedores
{
    [AspNetHostingPermission(SecurityAction.Demand, Unrestricted = true, Level = AspNetHostingPermissionLevel.Minimal)]
    public class SciSiteMapProvider : StaticSiteMapProvider
    {
        private readonly IDictionary<int, SiteMapNode> _nodos = new Dictionary<int, SiteMapNode>();
        private string _applicationName;
        private string _connectionString;
        private bool _initialized;
        private SiteMapNode _nodoRaiz;

        public string ApplicationName
        {
            get { return _applicationName; }
            set { _applicationName = value; }
        }

        public override SiteMapNode RootNode
        {
            get { return BuildSiteMap(); }
        }

        public virtual bool IsInitialized
        {
            get { return _initialized; }
        }

        protected override SiteMapNode GetRootNodeCore()
        {
            return RootNode;
        }

        protected override void Clear()
        {
            lock (this)
            {
                _nodos.Clear();
                _nodoRaiz = null;
                base.Clear();
            }
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            if (IsInitialized)
            {
                return;
            }

            base.Initialize(name, config);

            if (config == null)
            {
                throw new Exception("El proveedor de SiteMap no tiene argumentos");
            }

            if (config["applicationName"] == null || config["applicationName"].Trim() == "")
            {
                _applicationName = HostingEnvironment.ApplicationVirtualPath;
            }
            else
            {
                _applicationName = config["applicationName"];
            }

            if (string.IsNullOrEmpty(config["connectionStringName"]))
            {
                throw new Exception("La cadena de conexión no ha sido encontrada.");
            }

            ConnectionStringSettings connectionStringSettings =
                ConfigurationManager.ConnectionStrings[config["connectionStringName"]];

            if (connectionStringSettings == null || connectionStringSettings.ConnectionString.Trim() == "")
            {
                throw new ProviderException("La cadena de conexión no puede nula o en blanco.");
            }

            _connectionString = connectionStringSettings.ConnectionString;
            _initialized = true;
        }

        public override SiteMapNode BuildSiteMap()
        {
            lock (this)
            {
                if (!IsInitialized)
                {
                    throw new Exception("El proveedor de SiteMap no ha sido inicializado.");
                }

                // TODO: _nodoRaiz == null
                if (true)
                {
                    Clear();

                    SqlDatabase sqlDatabase = new SqlDatabase(_connectionString);
                    DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("adm.SCISP_ObtenerSiteMap");

                    sqlDatabase.AddInParameter(dbCommand, "Aplicacion", DbType.String, _applicationName);

                    using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
                    {
                        dataReader.Read();

                        int siteMapId = dataReader.IsDBNull(0) ? 0 : dataReader.GetInt32(0);
                        string titulo = dataReader.IsDBNull(1) ? string.Empty : dataReader.GetString(1);
                        string descripcion = dataReader.IsDBNull(2) ? string.Empty : dataReader.GetString(2);
                        string roles = dataReader.IsDBNull(4) ? "NULL" : dataReader.GetString(4);
                        string url = dataReader.IsDBNull(3) ? null : dataReader.GetString(3);
                        string[] rolList = roles.Split(',');

                        _nodoRaiz = new SiteMapNode(this, siteMapId.ToString(CultureInfo.InvariantCulture), url, titulo,
                                                    descripcion, rolList, null, null, null);

                        _nodos.Add(siteMapId, _nodoRaiz);
                        AddNode(_nodoRaiz);

                        while (dataReader.Read())
                        {
                            siteMapId = dataReader.GetInt32(0);
                            titulo = dataReader.IsDBNull(1) ? string.Empty : dataReader.GetString(1);
                            descripcion = dataReader.IsDBNull(2) ? string.Empty : dataReader.GetString(2);
                            url = dataReader.IsDBNull(3) ? null : dataReader.GetString(3);
                            roles = dataReader.IsDBNull(4) ? "NULL" : dataReader.GetString(4);
                            int padreId = dataReader.IsDBNull(5) ? 0 : dataReader.GetInt32(5);

                            rolList = roles.Split(',');

                            SiteMapNode nodoHijo = new SiteMapNode(this,
                                                                   siteMapId.ToString(CultureInfo.InvariantCulture), url,
                                                                   titulo, descripcion, rolList, null, null, null);

                            _nodos.Add(siteMapId, nodoHijo);

                            if (_nodos.ContainsKey(padreId))
                            {
                                AddNode(nodoHijo, _nodos[padreId]);
                            }
                            else
                            {
                                AddNode(nodoHijo);
                            }
                        }
                    }
                }

                return _nodoRaiz;
            }
        }
    }
}