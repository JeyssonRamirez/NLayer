<%@ Control Language="C#" CodeBehind="Default.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.EntityTemplates.DefaultEntityTemplate" %>
<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label runat="server" OnInit="Label_Init" />
            </td>
            <td>
                <asp:DynamicControl runat="server" OnInit="DynamicControl_Init" />
            </td>
        </tr>
    </ItemTemplate>
</asp:EntityTemplate>