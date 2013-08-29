// -----------------------------------------------------------------------
// <copyright file="Membresia.Metadata.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (MembresiaMetadata))]
    [DisplayName(@"Membresías")]
    partial class Membresia
    {
        #region Nested type: MembresiaMetadata

        internal sealed class MembresiaMetadata
        {
        }

        #endregion
    }
}