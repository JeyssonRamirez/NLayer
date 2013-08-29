﻿<%@ Control Language="C#" CodeBehind="Decimal_Edit.ascx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.Decimal_EditField" %>
<asp:TextBox ID="TextBox1" runat="server" Text='<%#FieldValueEditString%>' Columns="10"></asp:TextBox>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="TextBox1" Display="Static" Operator="DataTypeCheck" Type="Double" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:RangeValidator runat="server" ID="RangeValidator1" ControlToValidate="TextBox1" Type="Double" Enabled="false" EnableClientScript="true" MinimumValue="0" MaximumValue="100" Display="Static" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" />