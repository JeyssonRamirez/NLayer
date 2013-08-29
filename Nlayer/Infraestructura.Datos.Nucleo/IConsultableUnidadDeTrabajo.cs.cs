//   -----------------------------------------------------------------------
//   <copyright file=IConsultableUnidadDeTrabajo.cs.cs company="Banlinea">
//       Copyright (c) Banlinea Todos los derechos reservados.
//   </copyright>
//   <author>Jeysson Stevens  Ramirez </author>
//   <Date>  2013 -08-29  - 11:16 a.m.</Date>
//   <Update> 2013-08-29 - 11:42 a.m.</Update>
//   -----------------------------------------------------------------------

#region

using System.Data.Objects;
using Nlayer.Nlayer.Dominio.ModuloPrincipal.Entidades;
using Nlayer.Nlayer.Dominio.Nucleo;

#endregion

namespace Nlayer.Nlayer.Infraestructura.Datos.Nucleo
{
    public interface IConsultableUnidadDeTrabajo : IUnidadDeTrabajo
    {
        IObjectSet<TEntidad> CrearSet<TEntidad>() where TEntidad : class, IObjectWithChangeTracker;
    }
}