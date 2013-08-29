// -----------------------------------------------------------------------
// <copyright file="IServicioMembresia.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Web.Security;

namespace SCI.NLayer.Aplicacion.ModuloPrincipal.Servicios.Contratos
{
    public interface IServicioMembresia
    {
        MembershipUser RegistrarUsuario(Guid providerUserKey, string aplicacion, string login, string password, string email, string preguntaPassword, string respuestaPassword, string comentario, DateTime ultimaActividad, DateTime ultimaSesion, DateTime ultimoCambioDePassword, int cantidadIntentosFaillidosPassword, DateTime inicioIntentosFallidosPassword, int cantidadIntentosFallidosPregunta, DateTime inicioIntentosFallidosPregunta, bool estaAprobadao, bool estaBloqueado, DateTime ultimoBloqueo, DateTime registrado);

        MembershipUser ObtenerLoginPorEmail(string aplicacion, string email);
    }
}