// -----------------------------------------------------------------------
// <copyright file="ForeignKey_Edit.ascx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// <date>03/07/2011 01:09 p.m.</date>
// -----------------------------------------------------------------------

using System;
using System.Collections.Specialized;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class ForeignKey_EditField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return DropDownList1; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (DropDownList1.Items.Count == 0)
            {
                if (Mode == DataBoundControlMode.Insert || !Column.IsRequired)
                {
                    DropDownList1.Items.Add(new ListItem("[SELECCIONE]", ""));
                }
                PopulateListControl(DropDownList1);
            }

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            string selectedValueString = GetSelectedValueString();
            ListItem item = DropDownList1.Items.FindByValue(selectedValueString);
            if (item != null)
            {
                DropDownList1.SelectedValue = selectedValueString;
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            // If it's an empty string, change it to null
            string value = DropDownList1.SelectedValue;
            if (String.IsNullOrEmpty(value))
            {
                value = null;
            }

            ExtractForeignKey(dictionary, value);
        }
    }
}