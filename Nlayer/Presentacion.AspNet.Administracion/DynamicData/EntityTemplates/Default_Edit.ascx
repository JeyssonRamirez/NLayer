<%@ Control Language="C#" CodeBehind="Default_Edit.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.EntityTemplates.Default_EditEntityTemplate" %>
<%@ Reference Control="~/DynamicData/EntityTemplates/Default.ascx" %>
<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label runat="server" OnInit="Label_Init" OnPreRender="Label_PreRender" />
            </td>
            <td>
                <asp:DynamicControl runat="server" ID="DynamicControl" Mode="Edit" OnInit="DynamicControl_Init" />
            </td>
        </tr>
    </ItemTemplate>
</asp:EntityTemplate>