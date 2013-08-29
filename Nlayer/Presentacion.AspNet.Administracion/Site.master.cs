// -----------------------------------------------------------------------
// <copyright file="Site.master.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
// -----------------------------------------------------------------------

using System.Web.UI;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion
{
    public partial class SiteMaster : MasterPage
    {
        protected string ResolverUrl(object path)
        {
            string url = path.ToString();
            if (url.StartsWith("#"))
            {
                return "#";
            }
            return ResolveClientUrl(url);
        }

        protected void ScriptManagerAsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
        {
            string exceptionMessge = e.Exception.InnerException != null ? e.Exception.InnerException.Message : e.Exception.Message;
            string userMessage = string.Empty;

            if (string.IsNullOrEmpty(userMessage))
            {
                userMessage = "Ha ocurrido un error mientras se realizaba la petición al servidor.";
            }

            scriptManager.AsyncPostBackErrorMessage = userMessage;
        }
    }
}