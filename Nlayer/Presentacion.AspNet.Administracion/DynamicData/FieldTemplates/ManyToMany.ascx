<%@ Control Language="C#" CodeBehind="ManyToMany.ascx.cs" Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.FieldTemplates.ManyToManyField" %>

<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <asp:DynamicHyperLink runat="server"></asp:DynamicHyperLink>
    </ItemTemplate>
</asp:Repeater>