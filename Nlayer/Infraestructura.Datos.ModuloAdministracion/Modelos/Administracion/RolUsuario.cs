﻿// -----------------------------------------------------------------------
// <copyright file="RolUsuario.Metadata.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (RolUsuarioMetadata))]
    [DisplayName(@"Usuarios por Rol")]
    partial class RolUsuario
    {
        #region Nested type: RolUsuarioMetadata

        internal sealed class RolUsuarioMetadata
        {
        }

        #endregion
    }
}