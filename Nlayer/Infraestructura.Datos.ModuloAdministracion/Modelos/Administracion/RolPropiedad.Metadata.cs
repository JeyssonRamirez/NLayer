// -----------------------------------------------------------------------
// <copyright file="RolPropiedad.Metadata.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (RolPropiedadMetadata))]
    [DisplayName(@"Roles y Propiedades")]
    partial class RolPropiedad
    {
        #region Nested type: RolPropiedadMetadata

        internal sealed class RolPropiedadMetadata
        {
        }

        #endregion
    }
}