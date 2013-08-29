//   -----------------------------------------------------------------------
//   <copyright file=LocalizadorProxy.cs company="Banlinea">
//       Copyright (c) Banlinea Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2013 -08-29  - 11:16 a.m.</Date>
//   <Update> 2013-08-29 - 01:01 p.m.</Update>
//   -----------------------------------------------------------------------

#region

using Nlayer.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders;

#endregion

namespace Nlayer.Nlayer.Presentacion.AgenteDeServicios
{
    public static class LocalizadorProxy
    {
        /*public static IServicioDistribuido ServicioDistribuido
        {
            get
            {
                IServicioDistribuido servicioDistribuido = new ServicioDistribuidoClient();
                return servicioDistribuido;
            }
        }*/


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