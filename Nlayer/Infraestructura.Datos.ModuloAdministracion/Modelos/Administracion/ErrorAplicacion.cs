// -----------------------------------------------------------------------
// <copyright file="ErrorAplicacion.Metadata.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (ErrorAplicacionMetadata))]
    [DisplayName(@"Errores de la Aplicación")]
    partial class ErrorAplicacion
    {
        #region Nested type: ErrorAplicacionMetadata

        internal sealed class ErrorAplicacionMetadata
        {
        }

        #endregion
    }
}