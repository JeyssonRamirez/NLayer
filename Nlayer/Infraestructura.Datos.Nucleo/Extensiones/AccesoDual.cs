// -----------------------------------------------------------------------
// <copyright file="AccesoDual.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
// -----------------------------------------------------------------------

using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;

namespace Sci.Nlayer.Infraestructura.Datos.Nucleo.Extensiones
{
    public class AccesoDual
    {
        public DataSet ObtenerDataSet(string conexion, string procedimiento, List<DbParameter> parametros)
        {
            var bd = new SqlDatabase(conexion);
            DbCommand cmd = bd.GetStoredProcCommand(procedimiento);

            EstablecerParametros(parametros, bd, cmd);

            DataSet ds = bd.ExecuteDataSet(cmd);

            ObtenerParametrosOut(parametros, cmd);

            return ds;
        }

        public DataTable ObtenerDataTable(string conexion, string procedimiento, List<DbParameter> parametros)
        {
            DataTable dt = null;

            var bd = new SqlDatabase(conexion);
            DbCommand cmd = bd.GetStoredProcCommand(procedimiento);

            EstablecerParametros(parametros, bd, cmd);

            DataSet ds = bd.ExecuteDataSet(cmd);

            ObtenerParametrosOut(parametros, cmd);

            if (ds != null && ds.Tables.Count > 0)
            {
                dt = ds.Tables[0];
            }

            return dt;
        }

        public int ObtenerRowCount(string conexion, string procedimiento, List<DbParameter> parametros)
        {
            var bd = new SqlDatabase(conexion);
            DbCommand cmd = bd.GetStoredProcCommand(procedimiento);

            EstablecerParametros(parametros, bd, cmd);

            int filasAfectadas = bd.ExecuteNonQuery(cmd);

            ObtenerParametrosOut(parametros, cmd);

            return filasAfectadas;
        }

        public object ObtenerScalar(string conexion, string procedimiento, List<DbParameter> parametros)
        {
            var bd = new SqlDatabase(conexion);
            DbCommand cmd = bd.GetStoredProcCommand(procedimiento);

            EstablecerParametros(parametros, bd, cmd);

            object resultado = bd.ExecuteScalar(cmd);

            ObtenerParametrosOut(parametros, cmd);

            return resultado;
        }

        public IDataReader ObtenerDataReader(string conexion, string procedimiento, List<DbParameter> parametros)
        {
            var bd = new SqlDatabase(conexion);
            DbCommand cmd = bd.GetStoredProcCommand(procedimiento);

            EstablecerParametros(parametros, bd, cmd);

            IDataReader resultado = bd.ExecuteReader(cmd);

            ObtenerParametrosOut(parametros, cmd);

            return resultado;
        }

        private static void EstablecerParametros(List<DbParameter> parametros, Database sqlDatabase, DbCommand comando)
        {
            foreach (DbParameter parametro in parametros)
            {
                if (parametro.Direction == ParameterDirection.Input)
                {
                    sqlDatabase.AddInParameter(comando, parametro.ParameterName, parametro.DbType, parametro.Value);
                }
                else
                {
                    sqlDatabase.AddOutParameter(comando, parametro.ParameterName, parametro.DbType, parametro.Size);
                }
            }
        }

        private static void ObtenerParametrosOut(List<DbParameter> parametros, DbCommand comando)
        {
            parametros.Clear();
            parametros.AddRange(comando.Parameters.Cast<DbParameter>());
        }
    }
}