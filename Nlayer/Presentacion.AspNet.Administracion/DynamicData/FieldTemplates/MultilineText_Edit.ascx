<%@ Control Language="C#" CodeBehind="MultilineText_Edit.ascx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.MultilineText_EditField" %>

<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Text='<%#FieldValueEditString%>' Columns="80" Rows="5"></asp:TextBox>

<asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"  ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" id="DynamicValidator1"  ControlToValidate="TextBox1" Display="Static" />