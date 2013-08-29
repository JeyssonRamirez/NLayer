// -----------------------------------------------------------------------
// <copyright file="Children.ascx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// <date>13/07/2011 01:54 p.m.</date>
// -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class ChildrenField : FieldTemplateUserControl
    {
        private bool _allowNavigation = true;

        public string NavigateUrl { get; set; }

        public bool AllowNavigation
        {
            get { return _allowNavigation; }
            set { _allowNavigation = value; }
        }

        public override Control DataControl
        {
            get { return HyperLink1; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink1.Text = "Ver " + ChildrenColumn.ChildTable.DisplayName;
        }

        protected string GetChildrenPath()
        {
            if (!AllowNavigation)
            {
                return null;
            }

            if (String.IsNullOrEmpty(NavigateUrl))
            {
                return ChildrenPath;
            }
            else
            {
                return BuildChildrenPath(NavigateUrl);
            }
        }
    }
}