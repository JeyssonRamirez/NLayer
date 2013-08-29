<%@ Control Language="C#" CodeBehind="Enumeration_Edit.ascx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.Enumeration_EditField" %>
<asp:DropDownList ID="DropDownList1" runat="server" />
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DropDownList1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DropDownList1" Display="Static" />