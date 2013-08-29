// -----------------------------------------------------------------------
// <copyright file="Aplicacion.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ComponentModel;

namespace Sci.Nlayer.Infraestructura.Transversales.Enumeraciones
{
    public enum Aplicacion
    {
        [Description("ADMINISTRACIÓN")] Admin = 1,
        [Description("SITE CORE")] Core = 2
    }
}