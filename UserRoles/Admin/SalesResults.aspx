<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesResults.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Admin.SalesResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains all the data related to vehicles sold to clients-->
    <h1>Sales Results</h1>
    <h3>Vehicles Sold to Clients</h3>
    <!--Link to database!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
    <asp:SqlDataSource ID="VecSaleData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Vehicle.* FROM Vehicle INNER JOIN Sales_Done ON Vehicle.Chassis_Number = Sales_Done.Chassis_Number"></asp:SqlDataSource>
    <!--Grid View of supervisor list-->
    <asp:GridView ID="VecSaleList" runat="server" AllowPaging="True" DataSourceID="VecSaleData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Import_Price" HeaderText="Import_Price" SortExpression="Import_Price" />
            <asp:BoundField DataField="Mark_Up_Percent" HeaderText="Mark_Up_Percent" SortExpression="Mark_Up_Percent" />
            <asp:BoundField DataField="Engine_Number" HeaderText="Engine_Number" SortExpression="Engine_Number" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
            <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
        </Columns>
    </asp:GridView>
    <br />

    <!--Salesmen who earned commissions-->


</asp:Content>
