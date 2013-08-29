// -----------------------------------------------------------------------
// <copyright file="Global.asax.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Web;
using System.Web.DynamicData;
using System.Web.Routing;
using Nlayer.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion;

namespace Nlayer.Nlayer.Presentacion.AspNet.Administracion
{
    public class Global : HttpApplication
    {
        private static readonly MetaModel SDefaultModel = new MetaModel();

        public static MetaModel DefaultModel
        {
            get { return SDefaultModel; }
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            DefaultModel.RegisterContext(typeof (ModeloAdministracion), new ContextConfiguration {ScaffoldAllTables = true});

            routes.Add(new DynamicDataRoute("{table}/{action}.aspx")
                           {
                               Constraints = new RouteValueDictionary(new {action = "List|Details|Edit|Insert"}),
                               Model = DefaultModel
                           });

            //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx")
            //{
            //    Action = PageAction.List,
            //    ViewName = "ListDetails",
            //    Model = DefaultModel
            //});

            //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx")
            //{
            //    Action = PageAction.Details,
            //    ViewName = "ListDetails",
            //    Model = DefaultModel
            //});
        }

        private void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        private void Session_Start(object sender, EventArgs e)
        {
        }
    }
}