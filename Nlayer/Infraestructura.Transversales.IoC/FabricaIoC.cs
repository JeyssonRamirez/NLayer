#region Signature

//   -----------------------------------------------------------------------
//   <copyright file=FabricaIoC.cs company="Nlayer Software">
//       Copyright (c) Nlayer Software Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2012 -02-25  - 01:48 p.m.</Date>
//   <Update> 2012-12-06 - 10:41 a.m.</Update>
//   -----------------------------------------------------------------------

#endregion

#region

using Microsoft.Practices.Unity;
using Nlayer.Nlayer.Infraestructura.Datos.ModuloPrincipal.UnidadDeTrabajo;
using Nlayer.Nlayer.Infraestructura.Transversales.Correos;
using Nlayer.Nlayer.Infraestructura.Transversales.Frameworks.Correos;
using Nlayer.Nlayer.Infraestructura.Transversales.Frameworks.Logging;
using Nlayer.Nlayer.Infraestructura.Transversales.Logging;

#endregion

namespace Nlayer.Nlayer.Infraestructura.Transversales.IoC
{
    public static class FabricaIoC
    {
        private static readonly IUnityContainer Contenedor;

        static FabricaIoC()
        {
            Contenedor = new UnityContainer();

            Contenedor.RegisterType<IModeloPrincipalUnidadDeTrabajo, ModeloPrincipal>(new PerResolveLifetimeManager());

            Contenedor.RegisterType<IManejadorDeLogs, ManejadorDeLogs>();
            Contenedor.RegisterType<IManejadorDeTrazas, ManejadorDeTrazas>();
            Contenedor.RegisterType<IManejadorDeCorreos, ManejadorDeCorreos>();
        }

        public static TServicio Resolver<TServicio>()
        {
            return Contenedor.Resolve<TServicio>();
        }
    }
}