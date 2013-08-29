// -----------------------------------------------------------------------
// <copyright file="IManejadorDeLogs.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;

namespace Sci.Nlayer.Infraestructura.Transversales.Logging
{
    public interface IManejadorDeLogs
    {
        void PublicarMensajeSql(string aplicacion, string error, Exception excepcion);
    }
}