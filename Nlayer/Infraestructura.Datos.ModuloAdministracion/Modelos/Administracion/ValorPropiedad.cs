// -----------------------------------------------------------------------
// <copyright file="ValorPropiedad.Metadata.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (ValorPropiedadMetadata))]
    [DisplayName(@"Valores y Propiedades")]
    partial class ValorPropiedad
    {
        #region Nested type: ValorPropiedadMetadata

        internal sealed class ValorPropiedadMetadata
        {
        }

        #endregion
    }
}