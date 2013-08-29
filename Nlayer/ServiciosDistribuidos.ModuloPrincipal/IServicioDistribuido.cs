// -----------------------------------------------------------------------
// <copyright file="IServicioDistribuido.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ServiceModel;
using Nlayer.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores;

namespace Nlayer.Nlayer.ServiciosDistribuidos.ModuloPrincipal
{
    [ServiceContract]
    public interface IServicioDistribuido
    {
        [OperationContract]
        [FaultContract(typeof (ErrorServicio))]
        bool Test();
    }
}