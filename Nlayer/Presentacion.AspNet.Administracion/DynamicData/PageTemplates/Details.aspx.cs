// -----------------------------------------------------------------------
// <copyright file="Details.aspx.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.PageTemplates
{
    public partial class Details : Page
    {
        protected MetaTable table;

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

        protected void DetailsViewItemDeleted(object sender,
                                              DetailsViewDeletedEventArgs e)
        {
            if (e.Exception == null || e.ExceptionHandled)
            {
                Response.Redirect(table.ListActionPath);
            }
        }
    }
}