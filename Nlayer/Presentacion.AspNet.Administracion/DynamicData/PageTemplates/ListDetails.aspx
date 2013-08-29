﻿<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeBehind="ListDetails.aspx.cs"
    Inherits="Sci.Nlayer.Presentacion.AspNet.Administracion.DynamicData.PageTemplates.ListDetails" %>

<%@ Register Src="~/DynamicData/Content/GridViewPager.ascx" TagName="GridViewPager"
    TagPrefix="asp" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManagerProxy ID="scriptManagerProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
            <asp:DataControlReference ControlID="GridView1" />
        </DataControls>
    </asp:DynamicDataManager>
    <%=table.DisplayName%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                    HeaderText="List of validation errors" />
                <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1"
                    Display="None" />
                <asp:DynamicValidator runat="server" ID="FormViewValidator" ControlToValidate="FormView1"
                    Display="None" />
                <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("DisplayName")%>' OnPreRender="Label_PreRender" />
                        <asp:DynamicFilter runat="server" ID="DynamicFilter" OnFilterChanged="DynamicFilter_FilterChanged" />
                        <br />
                    </ItemTemplate>
                </asp:QueryableFilterRepeater>
                <br />
            </div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="GridDataSource" EnablePersistedSelection="True"
                AutoGenerateSelectButton="True" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True"
                AllowPaging="True" AllowSorting="True" OnDataBound="GridView1_DataBound" OnRowEditing="GridView1_RowEditing"
                OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowDeleted="GridView1_RowDeleted"
                OnRowUpdated="GridView1_RowUpdated" OnRowCreated="GridView1_RowCreated" CellPadding="4"
                ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerTemplate>
                    <asp:GridViewPager runat="server" />
                </PagerTemplate>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    There are currently no items in this table.
                </EmptyDataTemplate>
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:EntityDataSource ID="GridDataSource" runat="server" EnableDelete="true" EnableUpdate="true" />
            <asp:QueryExtender ID="GridQueryExtender" TargetControlID="GridDataSource" runat="server">
                <asp:DynamicFilterExpression ControlID="FilterRepeater" />
            </asp:QueryExtender>
            <asp:Panel ID="DetailsPanel" runat="server">
                <br />
                <br />
                <asp:FormView ID="FormView1" runat="server" DataSourceID="DetailsDataSource" OnPreRender="FormView1_PreRender"
                    OnModeChanging="FormView1_ModeChanging" OnItemUpdated="FormView1_ItemUpdated"
                    OnItemInserted="FormView1_ItemInserted" OnItemDeleted="FormView1_ItemDeleted"
                    CellPadding="4" ForeColor="#333333">
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DynamicEntity runat="server" />
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton runat="server" CommandName="Edit" Text="Edit" />
                                <asp:LinkButton runat="server" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this item?");' />
                                <asp:LinkButton runat="server" CommandName="New" Text="New" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DynamicEntity runat="server" Mode="Edit" />
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton runat="server" CommandName="Update" Text="Update" />
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DynamicEntity runat="server" Mode="Insert" />
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton runat="server" CommandName="Insert" Text="Insert" />
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:FormView>
                <asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" EnableInsert="true"
                    EnableUpdate="true" />
                <asp:QueryExtender TargetControlID="DetailsDataSource" runat="server">
                    <asp:ControlFilterExpression ControlID="GridView1" />
                </asp:QueryExtender>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
