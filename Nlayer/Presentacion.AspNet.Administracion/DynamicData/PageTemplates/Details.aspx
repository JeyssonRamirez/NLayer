<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Details.aspx.cs"
    Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.PageTemplates.Details" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="detailsView" />
        </DataControls>
    </asp:DynamicDataManager>
    <fieldset>
        Registro de la Tabla:&nbsp;
        <%=table.DisplayName%>
    </fieldset>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="Listado de errores de validación" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="detailsView"
                Display="None" />
            <fieldset>
                <div><asp:DynamicHyperLink ID="ListHyperLink" runat="server" Action="List">Mostar todos los registros</asp:DynamicHyperLink></div>
                <br />
                <asp:DetailsView ID="detailsView" runat="server" DataSourceID="DetailsDataSource"
                    OnItemDeleted="DetailsViewItemDeleted" CellPadding="4" ForeColor="#333333" GridLines="None"
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle HorizontalAlign="Right" BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%#table.GetActionPath(PageAction.Edit, GetDataItem())%>'
                                    Text="Editar" />
                                <asp:LinkButton runat="server"  CommandName="Delete" CausesValidation="false" OnClientClick='return confirm("¿Está seguro que desea eliminar el registro actual?");'
                                    Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#EFF3FB" ForeColor="Black" VerticalAlign="Bottom" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                </asp:DetailsView>
            </fieldset>
            <asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" />
            <asp:QueryExtender TargetControlID="DetailsDataSource" ID="DetailsQueryExtender"
                runat="server">
                <asp:DynamicRouteExpression />
            </asp:QueryExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>