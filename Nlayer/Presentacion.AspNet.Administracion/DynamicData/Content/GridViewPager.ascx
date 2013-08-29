<%@ Control Language="C#" CodeBehind="GridViewPager.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.Content.GridViewPager" %>
<table cellpadding="3px;">
    <tr>
        <td>
            <asp:ImageButton AlternateText="Primera Página" ToolTip="Primera Página" ID="ImageButtonFirst" runat="server" ImageUrl="~/DynamicData/Content/Images/PgFirst.png" CommandName="Page" CommandArgument="First" />
        </td>
        <td>
            <asp:ImageButton AlternateText="Página Anterior" ToolTip="Página Anterior" ID="ImageButtonPrev" runat="server" ImageUrl="~/DynamicData/Content/Images/PgPrev.png" CommandName="Page" CommandArgument="Prev" />
        </td>
        <td>
            <asp:Label ID="LabelPage" runat="server" Text="Página " AssociatedControlID="TextBoxPage" />
            <asp:TextBox ID="TextBoxPage" Style="text-align: center;" runat="server" Columns="5" AutoPostBack="true" OnTextChanged="TextBoxPage_TextChanged" Width="20px" />
            &nbsp;de:
            <asp:Label ID="LabelNumberOfPages" runat="server" />
        </td>
        <td>
            <asp:ImageButton AlternateText="Página Siguiente" ToolTip="Página Siguiente" ID="ImageButtonNext" ImageUrl="~/DynamicData/Content/Images/PgNext.png" runat="server" CommandName="Page" CommandArgument="Next" />
        </td>
        <td>
            <asp:ImageButton AlternateText="Última Página" ToolTip="Última Página" ID="ImageButtonLast" ImageUrl="~/DynamicData/Content/Images/PgLast.png" runat="server" CommandName="Page" CommandArgument="Last" />
        </td>
        <td>
            <asp:Label ID="LabelRows" runat="server" Text="Resultados por página:" AssociatedControlID="DropDownListPageSize" />
            <asp:DropDownList ID="DropDownListPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListPageSize_SelectedIndexChanged">
                <asp:ListItem Value="5" />
                <asp:ListItem Value="10" />
                <asp:ListItem Value="15" />
                <asp:ListItem Value="20" />
                <asp:ListItem Value="25" />
                <asp:ListItem Value="50" />
                <asp:ListItem Value="100" />
                <asp:ListItem Value="150" />
                <asp:ListItem Value="200" />
            </asp:DropDownList>
        </td>
    </tr>
</table>