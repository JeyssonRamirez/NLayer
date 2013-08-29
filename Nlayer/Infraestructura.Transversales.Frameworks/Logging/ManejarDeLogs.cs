// -----------------------------------------------------------------------
// <copyright file="ManejarDeLogs.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Nlayer.Nlayer.Infraestructura.Transversales.Logging;

namespace Nlayer.Nlayer.Infraestructura.Transversales.Frameworks.Logging
{
    public class ManejadorDeLogs : IManejadorDeLogs
    {
        #region "Metodos Publicos"

        public void PublicarMensajeSql(string aplicacion, string error, Exception excepcion)
        {
            try
            {
                SqlDatabase baseDedatos = new SqlDatabase(ConfigurationManager.ConnectionStrings["AccesoDual"].ConnectionString);
                DbCommand comando = baseDedatos.GetStoredProcCommand("adm.NlayerSP_RegistrarErrorAplicativo");

                comando.CommandType = CommandType.StoredProcedure;

                string interna = null;

                if (excepcion.InnerException != null)
                {
                    interna = excepcion.InnerException.Message;
                }

                baseDedatos.AddInParameter(comando, "Aplicacion", SqlDbType.NVarChar, aplicacion);
                baseDedatos.AddInParameter(comando, "Error", SqlDbType.NVarChar, error);
                baseDedatos.AddInParameter(comando, "Excepcion", SqlDbType.NText, excepcion.Message);
                baseDedatos.AddInParameter(comando, "Interna", SqlDbType.NText, interna);

                baseDedatos.ExecuteNonQuery(comando);
            }
            catch {}
        }

        #endregion
    }
}