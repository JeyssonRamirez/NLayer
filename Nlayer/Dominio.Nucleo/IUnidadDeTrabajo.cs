// -----------------------------------------------------------------------
// <copyright file="IUnidadDeTrabajo.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using Nlayer.Nlayer.Dominio.ModuloPrincipal.Entidades;

namespace Nlayer.Nlayer.Dominio.Nucleo
{
    public interface IUnidadDeTrabajo : IDisposable
    {
        int RealizarCambios();

        void RealizarYRefrescarCambios();

        void RegresarCambios();

        void RegistrarCambios<TEntidad>(TEntidad entidad) where TEntidad : class, IObjectWithChangeTracker;
    }
}