// -----------------------------------------------------------------------
// <copyright company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class UrlField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return HyperLinkUrl; }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            HyperLinkUrl.NavigateUrl = ProcessUrl(FieldValueString);
        }

        private string ProcessUrl(string url)
        {
            if (url.StartsWith("http://", StringComparison.OrdinalIgnoreCase) || url.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
            {
                return url;
            }

            return "http://" + url;
        }
    }
}