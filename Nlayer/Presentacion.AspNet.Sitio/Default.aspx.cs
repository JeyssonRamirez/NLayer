// -----------------------------------------------------------------------
// <copyright file="Default.aspx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.ServiceModel;
using System.Web.UI;
using Sci.Nlayer.Presentacion.AgenteDeServicios;
using Sci.Nlayer.Presentacion.AgenteDeServicios.Proxies.ServicioProviders;

namespace Sci.Nlayer.Presentacion.AspNet.Sitio
{
    public partial class Default : Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            IServicioProviders var = LocalizadorProxy.ServicioProviders;
            try
            {
                var x = var.ObtenerLoginPorEmail("", "");                
            }
            catch (FaultException<ErrorServicio> ex)
            {
            }
        }
    }
}