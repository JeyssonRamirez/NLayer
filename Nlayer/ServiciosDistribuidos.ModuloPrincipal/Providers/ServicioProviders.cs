// -----------------------------------------------------------------------
// <copyright file="ServicioProviders.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Data;
using System.ServiceModel;
using Sci.Nlayer.Infraestructura.Transversales.IoC;
using Sci.Nlayer.Infraestructura.Transversales.Logging;
using Sci.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores;

namespace Sci.Nlayer.ServiciosDistribuidos.ModuloPrincipal.Providers
{
    public class ServicioProviders : IServicioProviders
    {
        #region IServicioProviders Members

        public bool Test() { return true; }

        public void RegistrarUsuario(Guid providerUserKey, string aplicacion, string login, string password, string email, string preguntaPassword, string respuestaPassword, string comentario, DateTime ultimaActividad, DateTime ultimaSesion, DateTime ultimoCambioDePassword, int cantidadIntentosFaillidosPassword, DateTime inicioIntentosFallidosPassword, int cantidadIntentosFallidosPregunta, DateTime inicioIntentosFallidosPregunta, bool estaAprobadao, bool estaBloqueado, DateTime ultimoBloqueo, DateTime registrado)
        {
            try {}
            catch (Exception exception)
            {
                const string mensajeDeError = "Ha ocurrido un error mientras se trataba de registrar el usuario.";

                IManejadorDeLogs manejadorDeLogs = FabricaIoC.Resolver<IManejadorDeLogs>();
                manejadorDeLogs.PublicarMensajeSql(aplicacion, mensajeDeError, exception);

                ErrorServicio errorServicio = new ErrorServicio(mensajeDeError);
                throw new FaultException<ErrorServicio>(errorServicio);
            }
        }

        public DataTable ObtenerLoginPorEmail(string aplicacion, string email)
        {
            DataTable usuario = new DataTable();
            try
            {
                throw new Exception("Error del sistema");
            }
            catch (Exception exception)
            {
                const string mensajeDeError = "Ha ocurrido un error mientras se trataba de obtener el login del usuario por email.";

                IManejadorDeLogs manejadorDeLogs = FabricaIoC.Resolver<IManejadorDeLogs>();
                manejadorDeLogs.PublicarMensajeSql(aplicacion, mensajeDeError, exception);

                ErrorServicio errorServicio = new ErrorServicio(mensajeDeError);
                throw new FaultException<ErrorServicio>(errorServicio);
            }
            return usuario;
        }

        #endregion
    }
}