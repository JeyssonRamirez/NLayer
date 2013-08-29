<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="Insert.aspx.cs"
    Inherits="Nlayer.Nlayer.Presentacion.AspNet.Administracion.DynamicData.PageTemplates.Insert" %>

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
        Agregar un nuevo registro a la Tabla:&nbsp;
        <%=table.DisplayName%>
    </fieldset>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="Listado de errores de validación" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="detailsView"
                Display="None" />
            <fieldset>
                <asp:DetailsView ID="detailsView" runat="server" DataSourceID="detailsDataSource"
                    DefaultMode="Insert" OnItemCommand="DetailsViewItemCommand" OnItemInserted="DetailsViewItemInserted"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle HorizontalAlign="Right" BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton CommandName="Insert"  runat="server" Text="Insertar" />
                                <asp:LinkButton CommandName="Cancel" CausesValidation="false"  runat="server" Text="Cancelar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#EFF3FB" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <InsertRowStyle BackColor="White" />
                </asp:DetailsView>
            </fieldset>
            <asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableInsert="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
