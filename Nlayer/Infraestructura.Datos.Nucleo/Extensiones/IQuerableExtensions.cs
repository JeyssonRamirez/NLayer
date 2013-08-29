// -----------------------------------------------------------------------
// <copyright file="IQuerableExtensions.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Data.Objects;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.Linq.Expressions;

namespace Nlayer.Nlayer.Infraestructura.Datos.Nucleo.Extensiones
{
    public static class IQueryableExtensions
    {
        #region Extension Methods

        public static IQueryable<TEntity> Include<TEntity>(this IQueryable<TEntity> queryable, string path) where TEntity : class
        {
            if (String.IsNullOrEmpty(path))
            {
                throw new ArgumentNullException("path");
            }
            var query = queryable as ObjectQuery<TEntity>;

            if (query != null)
            {
                return query.Include(path);
            }

            var fakeQuery = queryable as MemorySet<TEntity>;
            return fakeQuery.Include(path);
        }

        public static IQueryable<TEntity> Include<TEntity>(this IQueryable<TEntity> queryable, Expression<Func<TEntity, object>> path)
            where TEntity : class
        {
            return Include(queryable,
                           AnalyzeExpressionPath(path));
        }

        [SuppressMessage("Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures")]
        public static IQueryable<TEntity> Paginate<TEntity, S>(this IQueryable<TEntity> queryable, Expression<Func<TEntity, S>> orderBy, int pageIndex, int pageCount, bool ascending) where TEntity : class
        {
            var query = queryable as ObjectQuery<TEntity>;

            if (query != null)
            {
                string orderPath = AnalyzeExpressionPath(orderBy);

                return query.Skip(string.Format(CultureInfo.InvariantCulture, "it.{0} {1}", orderPath, (ascending) ? "asc" : "desc"), "@skip", new ObjectParameter("skip", pageIndex)).Top("@limit", new ObjectParameter("limit", pageCount));
            }

            return queryable.OrderBy(orderBy).Skip((pageIndex)).Take(pageCount);
        }

        #endregion

        #region Private Methods

        private static string AnalyzeExpressionPath<TEntity, S>(Expression<Func<TEntity, S>> expression)
            where TEntity : class
        {
            if (expression == null)
            {
                throw new ArgumentNullException("expression");
            }

            var body = expression.Body as MemberExpression;
            if (((body == null) || !body.Member.DeclaringType.IsAssignableFrom(typeof (TEntity))) ||
                (body.Expression.NodeType != ExpressionType.Parameter))
            {
                throw new ArgumentException("expression");
            }
            return body.Member.Name;
        }

        #endregion
    }
}