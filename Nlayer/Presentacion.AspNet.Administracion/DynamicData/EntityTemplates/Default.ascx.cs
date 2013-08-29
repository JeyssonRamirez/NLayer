// -----------------------------------------------------------------------
// <copyright file="Default.ascx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.EntityTemplates
{
    public partial class DefaultEntityTemplate : EntityTemplateUserControl
    {
        private MetaColumn currentColumn;

        protected override void OnLoad(EventArgs e)
        {
            foreach (MetaColumn column in Table.GetScaffoldColumns(Mode, ContainerType))
            {
                currentColumn = column;
                using (Control item = new _NamingContainer())
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

        protected void DynamicControl_Init(object sender, EventArgs e)
        {
            var dynamicControl = (DynamicControl) sender;
            dynamicControl.DataField = currentColumn.Name;
        }

        #region Nested type: _NamingContainer

        public class _NamingContainer : Control, INamingContainer
        {
        }

        #endregion
    }
}