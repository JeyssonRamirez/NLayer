// -----------------------------------------------------------------------
// <copyright file="IServicioProviders.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Data;
using System.ServiceModel;
using Nlayer.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores;

namespace Nlayer.Nlayer.ServiciosDistribuidos.ModuloPrincipal.Providers
{
    [ServiceContract]
    public interface IServicioProviders
    {
        [OperationContract]
        [FaultContract(typeof (ErrorServicio))]
        bool Test();

        [OperationContract]
        [FaultContract(typeof (ErrorServicio))]
        void RegistrarUsuario(Guid providerUserKey, string aplicacion, string login, string password, string email, string preguntaPassword, string respuestaPassword, string comentario, DateTime ultimaActividad, DateTime ultimaSesion, DateTime ultimoCambioDePassword, int cantidadIntentosFaillidosPassword, DateTime inicioIntentosFallidosPassword, int cantidadIntentosFallidosPregunta, DateTime inicioIntentosFallidosPregunta, bool estaAprobadao, bool estaBloqueado, DateTime ultimoBloqueo, DateTime registrado);

        [OperationContract]
        [FaultContract(typeof (ErrorServicio))]
        DataTable ObtenerLoginPorEmail(string aplicacion, string email);
    }
}