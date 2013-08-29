// -----------------------------------------------------------------------
// <copyright file="IUnidadDeTrabajo.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using Sci.Nlayer.Dominio.ModuloPrincipal.Entidades;

namespace Sci.Nlayer.Dominio.Nucleo
{
    public interface IUnidadDeTrabajo : IDisposable
    {
        int RealizarCambios();

        void RealizarYRefrescarCambios();

        void RegresarCambios();

        void RegistrarCambios<TEntidad>(TEntidad entidad) where TEntidad : class, IObjectWithChangeTracker;
    }
}