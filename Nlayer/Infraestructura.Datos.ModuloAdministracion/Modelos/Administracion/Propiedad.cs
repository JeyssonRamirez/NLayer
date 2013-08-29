// -----------------------------------------------------------------------
// <copyright file="Propiedad.Metadata.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (PropiedadMetadata))]
    [DisplayName(@"Propiedades")]
    partial class Propiedad
    {
        #region Nested type: PropiedadMetadata

        internal sealed class PropiedadMetadata
        {
        }

        #endregion
    }
}