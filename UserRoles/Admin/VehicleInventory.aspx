<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleInventory.aspx.cs" Inherits="Group_C_Autoshop.EndUser.VehicleInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all vehicles available-->
    <h1>D&R Autoshop Vehicles</h1>
    <h3>Vehicles Left In Stock</h3>
    <!--Link to database!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
    <asp:SqlDataSource ID="OwnedData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Available_Vehicles]"></asp:SqlDataSource>
    <!--Grid View of supervisor list-->
    <asp:GridView ID="OwnedList" runat="server" AllowPaging="True" DataSourceID="OwnedData" AutoGenerateColumns="False">
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
    </asp:GridView>
    <br />
</asp:Content>
