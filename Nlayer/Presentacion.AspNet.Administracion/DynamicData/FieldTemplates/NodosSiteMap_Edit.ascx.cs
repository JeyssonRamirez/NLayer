// -----------------------------------------------------------------------
// <copyright file="NodosSiteMap_Edit.ascx.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Collections.Specialized;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion;

namespace Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class NodosSiteMap_EditField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return DropDownList1; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ModeloAdministracion contexto = new ModeloAdministracion())
                {
                    var nodosSiteMap = contexto.SiteMap;
                    if (nodosSiteMap == null)
                    {
                        return;
                    }
                    DropDownList1.Items.Add(new ListItem("[SELECCIONE]", ""));

                    foreach (SiteMap siteMapNodo in nodosSiteMap  )
                    {
                        DropDownList1.Items.Add(new ListItem(string.Format("{0} - {1}", siteMapNodo.AplicacionId, siteMapNodo.Titulo), siteMapNodo.SiteMapId.ToString()));
                    }
                    DropDownList1.DataTextField = "Titulo";
                    DropDownList1.DataValueField = "SiteMapId";
                    DropDownList1.DataBind();
                }
            }

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            if(!string.IsNullOrEmpty(FieldValueString))
            {
                DropDownList1.SelectedValue = FieldValueString;
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(DropDownList1.SelectedValue);
        }
    }
}