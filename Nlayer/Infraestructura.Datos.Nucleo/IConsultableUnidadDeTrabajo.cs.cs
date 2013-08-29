// -----------------------------------------------------------------------
// <copyright file="IConsultableUnidadDeTrabajo.cs.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.Data.Objects;
using Sci.Nlayer.Dominio.ModuloPrincipal.Entidades;
using Sci.Nlayer.Dominio.Nucleo;

namespace Sci.Nlayer.Infraestructura.Datos.Nucleo
{
    public interface IConsultableUnidadDeTrabajo : IUnidadDeTrabajo
    {
        IObjectSet<TEntidad> CrearSet<TEntidad>() where TEntidad : class, IObjectWithChangeTracker;
    }
}