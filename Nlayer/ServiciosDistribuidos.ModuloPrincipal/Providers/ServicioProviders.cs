//   -----------------------------------------------------------------------
//   <copyright file=ServicioProviders.cs company="Banlinea">
//       Copyright (c) Banlinea Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2013 -08-29  - 11:16 a.m.</Date>
//   <Update> 2013-08-29 - 11:53 a.m.</Update>
//   -----------------------------------------------------------------------

#region

using System;
using System.Data;
using System.ServiceModel;
using Nlayer.Nlayer.Infraestructura.Transversales.IoC;
using Nlayer.Nlayer.Infraestructura.Transversales.Logging;
using Nlayer.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores;

#endregion

namespace Nlayer.Nlayer.ServiciosDistribuidos.ModuloPrincipal.Providers
{
    public class ServicioProviders : IServicioProviders
    {
        #region IServicioProviders Members

        public bool Test()
        {
            return true;
        }

        public void RegistrarUsuario(Guid providerUserKey, string aplicacion, string login, string password,
                                     string email, string preguntaPassword, string respuestaPassword, string comentario,
                                     DateTime ultimaActividad, DateTime ultimaSesion, DateTime ultimoCambioDePassword,
                                     int cantidadIntentosFaillidosPassword, DateTime inicioIntentosFallidosPassword,
                                     int cantidadIntentosFallidosPregunta, DateTime inicioIntentosFallidosPregunta,
                                     bool estaAprobadao, bool estaBloqueado, DateTime ultimoBloqueo, DateTime registrado)
        {
            try
            {
            }
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
                const string mensajeDeError =
                    "Ha ocurrido un error mientras se trataba de obtener el login del usuario por email.";

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