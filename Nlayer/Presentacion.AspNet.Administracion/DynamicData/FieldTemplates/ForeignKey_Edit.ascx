<%@ Control Language="C#" CodeBehind="ForeignKey_Edit.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.ForeignKey_EditField" %>
<asp:DropDownList ID="DropDownList1" runat="server">
</asp:DropDownList>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DropDownList1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DropDownList1" Display="Static" />