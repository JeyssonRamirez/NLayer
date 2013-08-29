// -----------------------------------------------------------------------
// <copyright file="IManejadorDeTrazas.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

namespace Sci.Nlayer.Infraestructura.Transversales.Logging
{
    public interface IManejadorDeTrazas
    {
        void IniciarTrazaDeOperaciónLógica(string nombreDeLaOperación);

        void DetenerTrazaDeOperaciónLógica();

        void IniciarTraza();

        void DetenerTraza();

        void TrazarInformación(string mensaje);

        void TrazarAdvertencia(string mensaje);

        void TrazarError(string mensaje);

        void TrazarCritico(string mensaje);
    }
}