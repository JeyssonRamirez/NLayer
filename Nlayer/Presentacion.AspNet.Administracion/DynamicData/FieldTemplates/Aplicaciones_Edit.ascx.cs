// -----------------------------------------------------------------------
// <copyright file="Aplicaciones_Edit.ascx.cs" company="Nlayer Software">
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
    public partial class Aplicaciones_EditField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return aplicacionesDropDownList; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ModeloAdministracion contexto = new ModeloAdministracion())
                {
                    var aplicaciones = contexto.Aplicacion;

                    if (aplicaciones == null)
                    {
                        return;
                    }

                    aplicacionesDropDownList.Items.Add(new ListItem("[SELECCIONE]", ""));

                    foreach (Aplicacion aplicacion in aplicaciones)
                    {
                        aplicacionesDropDownList.Items.Add(new ListItem(aplicacion.Nombre, aplicacion.AplicacionId.ToString()));
                    }

                    aplicacionesDropDownList.DataTextField = "Nombre";
                    aplicacionesDropDownList.DataValueField = "AplicacionId";
                    aplicacionesDropDownList.DataBind();
                }
            }

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            if (!string.IsNullOrEmpty(FieldValueString))
            {
                aplicacionesDropDownList.SelectedValue = FieldValueString;
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(aplicacionesDropDownList.SelectedValue);
        }
    }
}