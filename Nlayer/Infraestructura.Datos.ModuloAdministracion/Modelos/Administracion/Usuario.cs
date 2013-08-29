// -----------------------------------------------------------------------
// <copyright file="Usuario.Metadata.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (UsuarioMetadata))]
    [DisplayName(@"Usuarios del Sistema")]
    [DisplayColumn("Login", "Login")]
    partial class Usuario
    {
        public Usuario()
        {
            _ProviderUserKey = new Guid();
        }

        #region Nested type: UsuarioMetadata

        internal sealed class UsuarioMetadata
        {
        }

        #endregion
    }
}