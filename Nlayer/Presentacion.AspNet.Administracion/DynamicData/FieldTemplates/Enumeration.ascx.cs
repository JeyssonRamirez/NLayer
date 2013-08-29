// -----------------------------------------------------------------------
// <copyright file="Enumeration.ascx.cs" company="Nlayer Software">
//     Copyright (c) Nlayer Software 2011. Todos los derechos reservados.
// </copyright>
// <author>Jhonnys Lopez Celedon</author>
// <date>16/07/2011 12:39 p.m.</date>
// -----------------------------------------------------------------------

using System;
using System.ComponentModel;
using System.Reflection;
using System.Web.DynamicData;
using System.Web.UI;

namespace Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates
{
    public partial class EnumerationField : FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get { return Literal1; }
        }

        public string EnumFieldValueString
        {
            get
            {
                if (FieldValue == null)
                {
                    return FieldValueString;
                }

                Type enumType = Column.GetEnumType();

                if (enumType != null)
                {
                    object enumValue = Enum.ToObject(enumType, FieldValue);
                    string value = GetDescription((Enum) Convert.ChangeType(enumValue, enumType));
                    return FormatFieldValue(value);
                }

                return FieldValueString;
            }
        }

        public static string GetDescription(Enum en)
        {
            Type type = en.GetType();

            MemberInfo[] memInfo = type.GetMember(en.ToString());

            if (memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof (DescriptionAttribute), false);

                if (attrs.Length > 0)
                {
                    return ((DescriptionAttribute) attrs[0]).Description;
                }
            }

            return en.ToString();
        }
    }
}