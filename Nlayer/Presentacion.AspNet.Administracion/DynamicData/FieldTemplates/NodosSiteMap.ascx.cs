// -----------------------------------------------------------------------
// <copyright file="NodosSiteMap.ascx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Linq;
using System.Web.DynamicData;
using System.Web.UI;
using Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class NodosSiteMap : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return Literal1; }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            using (ModeloAdministracion contexto = new ModeloAdministracion())
            {
                int? siteMapId = (int?) FieldValue;
                var nodoSiteMap = contexto.SiteMap.Where(nodo => nodo.SiteMapId == siteMapId).FirstOrDefault();
                if (nodoSiteMap == null)
                {
                    return;
                }
                Literal1.Text = string.Format("{0} - {1}", nodoSiteMap.AplicacionId, nodoSiteMap.Titulo);
            }
        }
    }
}