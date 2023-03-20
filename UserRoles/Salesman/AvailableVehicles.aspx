<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AvailableVehicles.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Salesman.AvailableVehicles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Available Vehicles</h1>
    <asp:SqlDataSource ID="AvailData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Available_Vehicles]"></asp:SqlDataSource>
    <asp:GridView ID="AvailList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" 
        runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AvailData">
        <Columns>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
