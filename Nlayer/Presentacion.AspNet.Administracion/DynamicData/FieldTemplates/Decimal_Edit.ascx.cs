// -----------------------------------------------------------------------
// <copyright file="Decimal_Edit.ascx.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Collections.Specialized;
using System.Web.DynamicData;
using System.Web.UI;

namespace Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class Decimal_EditField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return TextBox1; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(CompareValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(RangeValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(TextBox1.Text);
        }
    }
}