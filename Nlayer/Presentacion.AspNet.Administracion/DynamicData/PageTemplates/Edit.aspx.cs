// -----------------------------------------------------------------------
// <copyright file="Edit.aspx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// <date>03/07/2011 12:32 p.m.</date>
// -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.PageTemplates
{
    public partial class Edit : Page
    {
        protected MetaTable table;

        protected void DetailsViewItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == DataControlCommands.CancelCommandName)
            {
                Response.Redirect(table.ListActionPath);
            }
        }

        protected void DetailsViewItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception == null || e.ExceptionHandled)
            {
                Response.Redirect(table.ListActionPath);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
            detailsView.SetMetaTable(table);
            DetailsDataSource.EntityTypeFilter = table.EntityType.Name;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = table.DisplayName;
            DetailsDataSource.Include = table.ForeignKeyColumnsNames;
        }
    }
}