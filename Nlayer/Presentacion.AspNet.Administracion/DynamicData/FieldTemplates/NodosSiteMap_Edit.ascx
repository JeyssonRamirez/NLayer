<%@ Control Language="C#" CodeBehind="NodosSiteMap_Edit.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.NodosSiteMap_EditField" %>
<asp:DropDownList ID="DropDownList1" runat="server">
</asp:DropDownList>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="DropDownList1"
    Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="DropDownList1"
    Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="DropDownList1"
    Display="Dynamic" />