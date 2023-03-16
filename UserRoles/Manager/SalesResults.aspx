<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesResults.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Admin.SalesResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains all the data related to vehicles sold to clients-->
    <h1>Sales Results</h1>
    <h3>All Sales that were Performed</h3>
    <asp:SqlDataSource ID="SalesData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Sales_Done]"></asp:SqlDataSource>
    <asp:GridView ID="SalesList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" 
        AllowPaging="True" DataSourceID="SalesData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman_ID" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Salesman" HeaderText="Salesman" SortExpression="Salesman" />
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" SortExpression="Client_ID" />
            <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Date_Purchased" HeaderText="Date_Purchased" SortExpression="Date_Purchased" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>

    </asp:GridView>
    <br />


    <h3>Sales Performed by Specific Salesmen</h3>
    <table>
        <tr>
            <td>Salesman ID: </td>
            <td>
                <asp:TextBox ID="Specific" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search" runat="server" Text="Search" />
            </td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="SaleSearchData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Sales_Done_By_Salesman" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Specific" Name="Salesman_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="SaleSearchList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" 
        runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SaleSearchData">
        <Columns>
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman_ID" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Salesman" HeaderText="Salesman" SortExpression="Salesman" />
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" SortExpression="Client_ID" />
            <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Date_Purchased" HeaderText="Date_Purchased" SortExpression="Date_Purchased" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>

        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

    <h3>Vehicles Sold to Clients</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="VecSaleData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Vehicle.* FROM Vehicle INNER JOIN Sales_Done ON Vehicle.Chassis_Number = Sales_Done.Chassis_Number"></asp:SqlDataSource>
    <!--Grid View of vehicle sales list-->
    <asp:GridView ID="VecSaleList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" 
        AllowPaging="True" DataSourceID="VecSaleData" AutoGenerateColumns="False">
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
    </asp:GridView>
    <br />




    <!--Salesmen who earned commissions-->
    <h3>Commission Earned By All Salesmen</h3>
    <asp:SqlDataSource ID="ComData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Commission_Earned]"></asp:SqlDataSource>
    <asp:GridView ID="ComList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" 
        AllowPaging="True" runat="server" AutoGenerateColumns="False" DataSourceID="ComData">
        <Columns>
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman_ID" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Travel_Subsistence" HeaderText="Travel_Subsistence" SortExpression="Travel_Subsistence" />
            <asp:BoundField DataField="Commission" HeaderText="Commission" SortExpression="Commission" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />



    <!--Search Salesmen who earned commissions-->
    <h3>Commissions Earned By Specific Salesmen</h3>
    <table>
        <tr>
            <td>Salesman ID: </td>
            <td>
                <asp:TextBox ID="SaleID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search2" runat="server" Text="Search" />
            </td>
        </tr>
    </table>

    <br />
    <asp:SqlDataSource ID="SearchData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Commission_Earned_By_Salesman" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="SaleID" Name="Salesman_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="SearchList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" 
        AllowPaging="True" runat="server" AutoGenerateColumns="False" DataSourceID="SearchData">
        <Columns>
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman_ID" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Travel_Subsistence" HeaderText="Travel_Subsistence" SortExpression="Travel_Subsistence" />
            <asp:BoundField DataField="Commission" HeaderText="Commission" SortExpression="Commission" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
