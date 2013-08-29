// -----------------------------------------------------------------------
// <copyright file="MemorySet.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Linq.Expressions;

namespace Nlayer.Nlayer.Infraestructura.Datos.Nucleo
{
    public sealed class MemorySet<TEntity> : IObjectSet<TEntity> where TEntity : class
    {
        private readonly List<string> _includePaths;
        private readonly List<TEntity> _innerList;

        public MemorySet(List<TEntity> innerList)
        {
            if (innerList == null)
            {
                throw new ArgumentNullException("innerList");
            }

            _innerList = innerList;
            _includePaths = new List<string>();
        }

        #region IObjectSet<TEntity> Members

        public Type ElementType
        {
            get { return typeof (TEntity); }
        }

        public Expression Expression
        {
            get { return _innerList.AsQueryable().Expression; }
        }

        public IQueryProvider Provider
        {
            get { return _innerList.AsQueryable().Provider; }
        }

        public void AddObject(TEntity entity)
        {
            if (entity != null)
            {
                _innerList.Add(entity);
            }
        }

        public void Attach(TEntity entity)
        {
            if (entity != null && !_innerList.Contains(entity))
            {
                _innerList.Add(entity);
            }
        }

        public void Detach(TEntity entity)
        {
            if (entity != null)
            {
                _innerList.Remove(entity);
            }
        }

        public void DeleteObject(TEntity entity)
        {
            if (entity != null)
            {
                _innerList.Remove(entity);
            }
        }

        public IEnumerator<TEntity> GetEnumerator()
        {
            return (_innerList).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        #endregion

        public MemorySet<TEntity> Include(string path)
        {
            if (String.IsNullOrEmpty(path))
            {
                throw new ArgumentNullException("path");
            }

            _includePaths.Add(path);

            return this;
        }
    }
}