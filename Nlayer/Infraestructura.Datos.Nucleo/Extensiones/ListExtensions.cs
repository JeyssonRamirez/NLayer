// -----------------------------------------------------------------------
// <copyright file="ListExtensions.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;

namespace Nlayer.Nlayer.Infraestructura.Datos.Nucleo.Extensiones
{
    public static class ListExtensions
    {
        [SuppressMessage("Microsoft.Design", "CA1002:DoNotExposeGenericLists")]
        public static MemorySet<T> ToMemorySet<T>(this List<T> list) where T : class
        {
            return new MemorySet<T>(list);
        }
    }
}