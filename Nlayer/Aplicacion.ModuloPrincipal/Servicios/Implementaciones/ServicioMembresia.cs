// -----------------------------------------------------------------------
// <copyright file="ServicioModuloPrincipal.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Web.Security;
using SCI.NLayer.Aplicacion.ModuloPrincipal.Servicios.Contratos;
using SCI.NLayer.Dominio.ModuloPrincipal.Repositorios;

namespace SCI.NLayer.Aplicacion.ModuloPrincipal.Servicios.Implementaciones
{
    public class ServicioMembresia : IServicioMembresia
    {
        private readonly IRepositorioMembresia _repositorioMembresia;

        public ServicioMembresia(IRepositorioMembresia repositorioMembresia)
        {
            _repositorioMembresia = repositorioMembresia;
        }

        #region IServicioModuloPrincipal Members

        public MembershipUser RegistrarUsuario(Guid providerUserKey, string aplicacion, string login, string password, string email, string preguntaPassword, string respuestaPassword, string comentario, DateTime ultimaActividad, DateTime ultimaSesion, DateTime ultimoCambioDePassword, int cantidadIntentosFaillidosPassword, DateTime inicioIntentosFallidosPassword, int cantidadIntentosFallidosPregunta, DateTime inicioIntentosFallidosPregunta, bool estaAprobadao, bool estaBloqueado, DateTime ultimoBloqueo, DateTime registrado)
        {
            return _repositorioMembresia.RegistrarUsuario(providerUserKey, aplicacion, login, password, email, preguntaPassword, respuestaPassword, comentario, ultimaActividad, ultimaSesion, ultimoCambioDePassword, cantidadIntentosFaillidosPassword, inicioIntentosFallidosPassword, cantidadIntentosFallidosPregunta, inicioIntentosFallidosPregunta, estaAprobadao, estaBloqueado, ultimoBloqueo, registrado);
        }

        public MembershipUser ObtenerLoginPorEmail(string aplicacion, string email)
        {
            return _repositorioMembresia.ObtenerLoginPorEmail(aplicacion, email);
        }

        #endregion
    }
}