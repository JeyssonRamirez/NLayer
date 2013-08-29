// -----------------------------------------------------------------------
// <copyright file="IManejadorDeCorreos.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.Collections.Generic;

namespace Sci.Nlayer.Infraestructura.Transversales.Correos
{
    public interface IManejadorDeCorreos
    {
        List<string> Destinos { get; set; }

        List<string> Adjuntos { get; set; }

        string Mensaje { get; set; }

        string Asunto { get; set; }

        void Enviar();
    }
}