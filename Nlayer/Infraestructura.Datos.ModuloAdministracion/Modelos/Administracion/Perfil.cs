﻿// -----------------------------------------------------------------------
// <copyright file="Perfil.Metadata.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion
{
    [MetadataType(typeof (PerfilMetada))]
    [DisplayName(@"Perfiles")]
    partial class Perfil
    {
        #region Nested type: PerfilMetada

        internal sealed class PerfilMetada
        {
        }

        #endregion
    }
}