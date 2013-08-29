// -----------------------------------------------------------------------
// <copyright file="DateTime_Edit.ascx.cs" company="SCI Software">
//     Copyright (c) SCI Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys López Celedon</author>
//  -----------------------------------------------------------------------

using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class DateTime_EditField : FieldTemplateUserControl
    {
        private static readonly DataTypeAttribute DefaultDateAttribute = new DataTypeAttribute(DataType.DateTime);

        public override Control DataControl
        {
            get { return TextBox1; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
            SetUpCustomValidator(DateValidator);

            const string jQueryDateTimePicker = "<script type=\"text/javascript\" language=\"javascript\">$(document).ready(function () { $(\".fecha\").datepicker({changeMonth: true, changeYear: true, showButtonPanel: true}) });</script>";

            if (!Page.ClientScript.IsStartupScriptRegistered(GetType(), "SetDateTimePicker"))
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "SetDateTimePicker", jQueryDateTimePicker);
            }
        }

        private void SetUpCustomValidator(CustomValidator validator)
        {
            if (Column.DataTypeAttribute != null)
            {
                switch (Column.DataTypeAttribute.DataType)
                {
                    case DataType.Date:
                    case DataType.DateTime:
                    case DataType.Time:
                        validator.Enabled = true;
                        DateValidator.ErrorMessage = HttpUtility.HtmlEncode(Column.DataTypeAttribute.FormatErrorMessage(Column.DisplayName));
                        break;
                }
            }
            else if (Column.ColumnType.Equals(typeof (DateTime)))
            {
                validator.Enabled = true;
                DateValidator.ErrorMessage = HttpUtility.HtmlEncode(DefaultDateAttribute.FormatErrorMessage(Column.DisplayName));
            }
        }

        protected void DateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dummyResult;
            args.IsValid = DateTime.TryParse(args.Value, out dummyResult);
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(TextBox1.Text);
        }
    }
}