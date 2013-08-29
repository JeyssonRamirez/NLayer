<%@ Control Language="C#" CodeBehind="Text_Edit.ascx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.Text_EditField" %>

<asp:TextBox ID="TextBox1" runat="server" Text='<%#FieldValueEditString%>'></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Static" />