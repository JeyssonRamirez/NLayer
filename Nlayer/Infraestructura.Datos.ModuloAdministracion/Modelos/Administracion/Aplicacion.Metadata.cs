// -----------------------------------------------------------------------
// <copyright file="Aplicacion.Metadata.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (AplicacionMetadata))]
    [DisplayName(@"Aplicaciones")]
    partial class Aplicacion
    {
        #region Nested type: AplicacionMetadata

        internal sealed class AplicacionMetadata
        {
        }

        #endregion
    }
}