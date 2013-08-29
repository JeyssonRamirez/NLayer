// -----------------------------------------------------------------------
// <copyright file="IManejadorDeCorreos.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.Collections.Generic;

namespace Nlayer.Nlayer.Infraestructura.Transversales.Correos
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