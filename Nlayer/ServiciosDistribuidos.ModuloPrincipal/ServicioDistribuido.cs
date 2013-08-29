// -----------------------------------------------------------------------
// <copyright file="ServicioDistribuido.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

namespace Nlayer.Nlayer.ServiciosDistribuidos.ModuloPrincipal
{
    public class ServicioDistribuido : IServicioDistribuido
    {
        #region IServicioDistribuido Members

        public bool Test()
        {
            return true;
        }

        #endregion
    }
}