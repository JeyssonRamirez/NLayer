// -----------------------------------------------------------------------
// <copyright file="IRepositorio.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Nlayer.Nlayer.Dominio.Nucleo
{
    /// <summary>
    ///   Contrato base para todos los repositorios de la aplicación.
    /// </summary>
    public interface IRepositorio<TEntidad> where TEntidad : class
    {
        /// <summary>
        ///   Implementación de la Unidad de Trabajo.
        /// </summary>
        IUnidadDeTrabajo UnidadDeTrabajo { get; }

        /// <summary>
        ///   Agregar una nueva entidad al modelo.
        /// </summary>
        /// <param name = "entidad">Entidad que desea agregar.</param>
        void Agregar(TEntidad entidad);

        /// <summary>
        ///   Eliminar una entidad del modelo.
        /// </summary>
        /// <param name = "entidad">Entidad que desea eliminar.</param>
        void Remover(TEntidad entidad);

        void Registrar(TEntidad entidad);

        /// <summary>
        ///   Modifica una entidad del modelo.
        /// </summary>
        /// <param name = "entidad">Entidad que desea modificar.</param>
        void Modificar(TEntidad entidad);

        /// <summary>
        ///   Obtiene todas las entidades del modelo.
        /// </summary>
        IEnumerable<TEntidad> Obtener();

        /// <summary>
        ///   Obtiene todas las entidades que cumplan con el filtro.
        /// </summary>
        /// <param name = "filtro">Expresión de filtración</param>
        IEnumerable<TEntidad> ObtenerPorFiltro(Expression<Func<TEntidad, bool>> filtro);

        IEnumerable<TEntidad> ObtenerPorPagina<TOrdenamiento>(int indexInicio, int cantidadRegistro, Expression<Func<TEntidad, TOrdenamiento>> expresionOrden, bool ascendente);
    }
}