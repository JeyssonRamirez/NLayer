﻿<%@ Control Language="C#" CodeBehind="DateTime_Edit.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.DateTime_EditField" %>
<asp:TextBox ID="TextBox1" CssClass="fecha" runat="server" Text='<%#FieldValueEditString%>' Columns="20"></asp:TextBox>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" />
<asp:CustomValidator runat="server" ID="DateValidator" ControlToValidate="TextBox1" Display="Static" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />