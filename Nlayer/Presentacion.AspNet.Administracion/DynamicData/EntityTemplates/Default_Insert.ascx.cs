// -----------------------------------------------------------------------
// <copyright company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.EntityTemplates
{
    public partial class Default_InsertEntityTemplate : EntityTemplateUserControl
    {
        private MetaColumn currentColumn;

        protected override void OnLoad(EventArgs e)
        {
            foreach (MetaColumn column in Table.GetScaffoldColumns(Mode, ContainerType))
            {
                currentColumn = column;
                using (Control item = new DefaultEntityTemplate._NamingContainer())
                {
                    EntityTemplate1.ItemTemplate.InstantiateIn(item);
                    EntityTemplate1.Controls.Add(item);
                }
            }
        }

        protected void Label_Init(object sender, EventArgs e)
        {
            var label = (Label) sender;
            label.Text = currentColumn.DisplayName;
        }

        protected void Label_PreRender(object sender, EventArgs e)
        {
            var label = (Label) sender;
            var dynamicControl = (DynamicControl) label.FindControl("DynamicControl");
            var ftuc = dynamicControl.FieldTemplate as FieldTemplateUserControl;
            if (ftuc != null && ftuc.DataControl != null)
            {
                label.AssociatedControlID = ftuc.DataControl.GetUniqueIDRelativeTo(label);
            }
        }

        protected void DynamicControl_Init(object sender, EventArgs e)
        {
            var dynamicControl = (DynamicControl) sender;
            dynamicControl.DataField = currentColumn.Name;
        }
    }
}