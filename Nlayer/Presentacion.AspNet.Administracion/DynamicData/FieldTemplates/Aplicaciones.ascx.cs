// -----------------------------------------------------------------------
// <copyright file="Aplicaciones.ascx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Linq;
using System.Web.DynamicData;
using System.Web.UI;
using Sci.Nlayer.Infraestructura.Datos.ModuloAdministracion.Modelos.Administracion;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class Aplicaciones : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return Literal1; }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            using (ModeloAdministracion contexto = new ModeloAdministracion())
            {
                int aplicacionId = (int) FieldValue;
                var aplicacion = contexto.Aplicacion.Where(app => app.AplicacionId == aplicacionId).FirstOrDefault();
                if (aplicacion == null)
                {
                    return;
                }
                Literal1.Text = aplicacion.Nombre;
            }
        }
    }
}