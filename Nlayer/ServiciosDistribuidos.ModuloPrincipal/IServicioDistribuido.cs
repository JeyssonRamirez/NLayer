// -----------------------------------------------------------------------
// <copyright file="IServicioDistribuido.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System.ServiceModel;
using Sci.Nlayer.ServiciosDistribuidos.Nucleo.ManejoDeErrores;

namespace Sci.Nlayer.ServiciosDistribuidos.ModuloPrincipal
{
    [ServiceContract]
    public interface IServicioDistribuido
    {
        [OperationContract]
        [FaultContract(typeof (ErrorServicio))]
        bool Test();
    }
}