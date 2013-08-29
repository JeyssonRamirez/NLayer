// -----------------------------------------------------------------------
// <copyright file="SiteMap.Metadata.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (SiteMapMetadata))]
    [DisplayName(@"Site Map")]
    partial class SiteMap
    {
        #region Nested type: SiteMapMetadata

        internal sealed class SiteMapMetadata
        {
            [Display(Name = "Aplicación")]
            [UIHint("Aplicaciones")]
            public int AplicacionId { get; set; }

            [Display(Name = "Padre")]
            [UIHint("NodosSiteMap")]
            public int PadreId { get; set; }
        }

        #endregion
    }
}