// -----------------------------------------------------------------------
// <copyright file="LocalizadorProxy.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using Sci.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioDistribuido;
using Sci.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders;

namespace Sci.Nlayer.Presentacion.AgenteDeServicios
{
    public static class LocalizadorProxy
    {
        public static IServicioDistribuido ServicioDistribuido
        {
            get
            {
                IServicioDistribuido servicioDistribuido = new ServicioDistribuidoClient();
                return servicioDistribuido;
            }
        }

        public static IServicioProviders ServicioProviders
        {
            get
            {
                IServicioProviders servicioProviders = new ServicioProvidersClient();
                return servicioProviders;
            }
        }
    }
}