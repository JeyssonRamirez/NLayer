// -----------------------------------------------------------------------
// <copyright file="Rol.Metadata.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (RolMetadata))]
    [DisplayName(@"Roles del Sistema")]
    [DisplayColumn("Nombre", "Nombre")]
    partial class Rol
    {
        #region Nested type: RolMetadata

        internal sealed class RolMetadata
        {
            [UIHint("Aplicaciones")]
            public int AplicacionId { get; set; }
        }

        #endregion
    }
}