// -----------------------------------------------------------------------
// <copyright file="TipoIdentificacion.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
// -----------------------------------------------------------------------

using System.ComponentModel;

namespace Sci.Nlayer.Infraestructura.Transversales.Enumeraciones
{
    public enum TipoIdentificacion
    {
        [Description("CÉDULA DE CIUDADANÍA")] CedulaCiudadania = 1,
        [Description("CÉDULA DE EXTRANGERÍA")] CedulaExtrangeria = 2,
        [Description("N.I.T.")] Nit = 3,
        [Description("REGISTRO CIVIL")] RegistroCivil = 4,
        [Description("TARJETA DE IDENTIDAD")] TarjetaIdentidad = 5
    }
}