// -----------------------------------------------------------------------
// <copyright company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Linq;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.Filters
{
    public partial class BooleanFilter : QueryableFilterUserControl
    {
        private const string NullValueString = "[null]";

        public override Control FilterControl
        {
            get { return DropDownList1; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Column.ColumnType.Equals(typeof (bool)))
            {
                throw new InvalidOperationException(String.Format("A boolean filter was loaded for column '{0}' but the column has an incompatible type '{1}'.", Column.Name, Column.ColumnType));
            }

            if (!Page.IsPostBack)
            {
                DropDownList1.Items.Add(new ListItem("[TODOS]", String.Empty));
                if (!Column.IsRequired)
                {
                    DropDownList1.Items.Add(new ListItem("[SELECCIONE]", NullValueString));
                }
                DropDownList1.Items.Add(new ListItem("SI", Boolean.TrueString));
                DropDownList1.Items.Add(new ListItem("NO", Boolean.FalseString));
                // Set the initial value if there is one
                string initialValue = DefaultValue;
                if (!String.IsNullOrEmpty(initialValue))
                {
                    DropDownList1.SelectedValue = initialValue;
                }
            }
        }

        public override IQueryable GetQueryable(IQueryable source)
        {
            string selectedValue = DropDownList1.SelectedValue;
            if (String.IsNullOrEmpty(selectedValue))
            {
                return source;
            }

            object value = selectedValue;
            if (selectedValue == NullValueString)
            {
                value = null;
            }
            if (DefaultValues != null)
            {
                DefaultValues[Column.Name] = value;
            }
            return ApplyEqualityFilter(source, Column.Name, value);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnFilterChanged();
        }
    }
}