// -----------------------------------------------------------------------
// <copyright file="IManejadorDeLogs.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;

namespace Nlayer.Nlayer.Infraestructura.Transversales.Logging
{
    public interface IManejadorDeLogs
    {
        void PublicarMensajeSql(string aplicacion, string error, Exception excepcion);
    }
}