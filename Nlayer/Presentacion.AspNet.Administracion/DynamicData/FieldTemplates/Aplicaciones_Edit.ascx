<%@ Control Language="C#" CodeBehind="Aplicaciones_Edit.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.Aplicaciones_EditField" %>
<asp:DropDownList ID="aplicacionesDropDownList" runat="server">
</asp:DropDownList>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="aplicacionesDropDownList"
    Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="aplicacionesDropDownList"
    Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="aplicacionesDropDownList"
    Display="Dynamic" />