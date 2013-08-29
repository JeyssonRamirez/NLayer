// -----------------------------------------------------------------------
// <copyright file="Repositorio.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Globalization;
using System.Linq;
using System.Linq.Expressions;
using Sci.Nlayer.Infraestructura.Datos.Nucleo.Extensiones;
using Sci.Nlayer.Dominio.ModuloPrincipal.Entidades;
using Sci.Nlayer.Dominio.Nucleo;
using Sci.Nlayer.Infraestructura.Datos.Nucleo.Recursos;
using Sci.Nlayer.Infraestructura.Transversales.Logging;

namespace Sci.Nlayer.Infraestructura.Datos.Nucleo
{
    public class Repositorio<TEntidad> : IRepositorio<TEntidad> where TEntidad : class, IObjectWithChangeTracker
    {
        #region Miembros

        private readonly IManejadorDeTrazas _manejadorDeTrazas;
        private readonly IConsultableUnidadDeTrabajo _unidadDeTrabajo;

        #endregion

        #region Constructor

        public Repositorio(IConsultableUnidadDeTrabajo unidadDeTrabajo, IManejadorDeTrazas manejadorDeTrazas)
        {
            if (unidadDeTrabajo == null)
            {
                throw new ArgumentNullException("unidadDeTrabajo", Mensajes.ContenedorNulo);
            }

            if (manejadorDeTrazas == null)
            {
                throw new ArgumentNullException("manejadorDeTrazas", Mensajes.ManejadorDeTrazasNulo);
            }

            _unidadDeTrabajo = unidadDeTrabajo;
            _manejadorDeTrazas = manejadorDeTrazas;

            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioCreado, typeof (TEntidad).Name));
        }

        #endregion

        #region Miembros IRepositorio<TEntidad>

        public IUnidadDeTrabajo UnidadDeTrabajo
        {
            get { return _unidadDeTrabajo; }
        }

        public void Agregar(TEntidad entidad)
        {
            if (entidad == null)
            {
                throw new ArgumentNullException("entidad", Mensajes.EntidadNula);
            }

            if (entidad.ChangeTracker != null && entidad.ChangeTracker.State == ObjectState.Added)
            {
                _unidadDeTrabajo.RegistrarCambios(entidad);
            }

            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioAgregar, typeof (TEntidad).Name));
        }

        public void Remover(TEntidad entidad)
        {
            if (entidad == null)
            {
                throw new ArgumentNullException("entidad", Mensajes.EntidadNula);
            }

            IObjectSet<TEntidad> objectSet = _unidadDeTrabajo.CrearSet<TEntidad>();

            objectSet.Attach(entidad);
            objectSet.DeleteObject(entidad);

            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioRemover, typeof (TEntidad).Name));
        }

        public void Registrar(TEntidad entidad)
        {
            if (entidad == null)
            {
                throw new ArgumentNullException("entidad", Mensajes.EntidadNula);
            }

            IObjectSet<TEntidad> objectSet = _unidadDeTrabajo.CrearSet<TEntidad>();

            objectSet.Attach(entidad);
            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioRegistrar, typeof (TEntidad).Name));
        }

        public void Modificar(TEntidad entidad)
        {
            if (entidad == null)
            {
                throw new ArgumentNullException("entidad", Mensajes.EntidadNula);
            }

            if (entidad.ChangeTracker != null && (entidad.ChangeTracker.State & ObjectState.Deleted) != ObjectState.Deleted)
            {
                entidad.MarkAsModified();
            }

            _unidadDeTrabajo.RegistrarCambios(entidad);
            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioModificar, typeof (TEntidad).Name));
        }

        public IEnumerable<TEntidad> Obtener()
        {
            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioObtener, typeof (TEntidad).Name));
            return _unidadDeTrabajo.CrearSet<TEntidad>().AsEnumerable();
        }

        public IEnumerable<TEntidad> ObtenerPorFiltro(Expression<Func<TEntidad, bool>> filtro)
        {
            _manejadorDeTrazas.TrazarInformación(string.Format(CultureInfo.InvariantCulture, Mensajes.TrazaRepositorioObtenerPorFiltro, typeof (TEntidad).Name, filtro));
            return _unidadDeTrabajo.CrearSet<TEntidad>().Where(filtro).AsEnumerable();
        }

        public IEnumerable<TEntidad> ObtenerPorPagina<TOrdenamiento>(int indexInicio, int cantidadRegistro, Expression<Func<TEntidad, TOrdenamiento>> expresionOrden, bool ascendente)
        {
            return _unidadDeTrabajo.CrearSet<TEntidad>().Paginate(expresionOrden, indexInicio, cantidadRegistro, ascendente);
        }

        #endregion
    }
}