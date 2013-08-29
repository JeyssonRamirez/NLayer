// -----------------------------------------------------------------------
// <copyright file="ServicioDistribuido.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

namespace Sci.Nlayer.ServiciosDistribuidos.ModuloPrincipal
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