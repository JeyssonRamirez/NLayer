<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="List.aspx.cs" Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.PageTemplates.List" %>

<%@ Register Src="~/DynamicData/Content/GridViewPager.ascx" TagName="GridViewPager"
    TagPrefix="asp" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="GridView1" />
        </DataControls>
    </asp:DynamicDataManager>
    <fieldset>
        Tabla:&nbsp;<%=table.DisplayName%>&nbsp;(<asp:Label ID="totalRowsLabel" runat="server"></asp:Label>)&nbsp;Registros
    </fieldset>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                    HeaderText="List of validation errors" />
                <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1"
                    Display="None" />
                <fieldset>
                    <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="min-width: 80px;">
                                        <asp:Label ID="lblDisplayName" runat="server" Text='<%#Eval("DisplayName")%>' OnPreRender="Label_PreRender" />
                                    </td>
                                    <td>
                                        <asp:DynamicFilter runat="server" ID="DynamicFilter" OnFilterChanged="DynamicFilter_FilterChanged" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:QueryableFilterRepeater>
                </fieldset>
            </div>
            <fieldset>
                <div>
                    <asp:DynamicHyperLink ID="InsertHyperLink" runat="server" Action="Insert">Agregar un nuevo registro.</asp:DynamicHyperLink></div>
                <br />
                <div style="overflow-x: scroll;">
                    <asp:GridView AllowPaging="True" AllowSorting="True" DataSourceID="GridDataSource"
                        EnablePersistedSelection="True" ID="GridView1" PageSize="25" runat="server" CssClass="listView"
                        GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:DynamicHyperLink ID="dlnkEdit" ToolTip="Editar" runat="server" Action="Edit"
                                        Text="Editar" ImageUrl="~/DynamicData/Content/Images/editar.png" />
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClientClick='return confirm("¿Está seguro que desea borrar el registro actual?");'>
                                        <asp:Image ID="imgEliminar" ToolTip="Eliminar" runat="server" ImageUrl="~/DynamicData/Content/Images/eliminar.png" /></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:DynamicHyperLink ID="dlnkDetalles" ToolTip="Detalles" runat="server" Action="Details"
                                        Text="Detalles" ImageUrl="~/DynamicData/Content/Images/aceptar.png" />
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                            <asp:GridViewPager ID="GridViewPager1" runat="server" />
                        </PagerTemplate>
                        <EmptyDataTemplate>
                            Acualmente no existen registros en la tabla.
                        </EmptyDataTemplate>
                        <AlternatingRowStyle BackColor="White" CssClass="rowStyle" />
                        <FooterStyle BackColor="White" Font-Bold="True" ForeColor="#004E92" />
                        <HeaderStyle BackColor="#004E92" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="#004E92" HorizontalAlign="Left" />
                        <EditRowStyle BackColor="#2461BF" />
                        <RowStyle BackColor="#EFF3FB" CssClass="rowStyle" />
                    </asp:GridView>
                    <br />
                </div>
            </fieldset>
            <asp:EntityDataSource ID="GridDataSource" runat="server" EnableDelete="true" OnSelected="ConsultaFinalizada" />
            <asp:QueryExtender TargetControlID="GridDataSource" ID="GridQueryExtender" runat="server">
                <asp:DynamicFilterExpression ControlID="FilterRepeater" />
            </asp:QueryExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>