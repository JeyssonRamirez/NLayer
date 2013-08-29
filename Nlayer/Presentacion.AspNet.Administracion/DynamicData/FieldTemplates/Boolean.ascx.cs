// -----------------------------------------------------------------------
// <copyright company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// -----------------------------------------------------------------------

using System;
using System.Web.DynamicData;
using System.Web.UI;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class BooleanField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return CheckBox1; }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            object val = FieldValue;
            if (val != null)
            {
                CheckBox1.Checked = (bool) val;
            }
        }
    }
}