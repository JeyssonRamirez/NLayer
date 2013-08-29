// -----------------------------------------------------------------------
// <copyright file="IManejadorDeTrazas.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

namespace Nlayer.Nlayer.Infraestructura.Transversales.Logging
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