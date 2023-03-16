<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BusinessInsights.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Manager.GenerateReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Business Insights</h1>
    <h2>View different business reports: </h2>

    <h3>Best Selling Cars</h3>
    <table>
        <tr>
            <td><h4>Enter Start Date (YYYY/MM/DD): </h4></td>
            <td>
                <asp:TextBox ID="Start" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td><h4>Enter End Date (YYYY/MM/DD): </h4></td>
            <td>
                <asp:TextBox ID="End" runat="server"></asp:TextBox>

            </td>
            <td>
                <asp:Button ID="Search1" runat="server" Text="Search" />
            </td>
        </tr>
    </table>

    <br />
    <asp:SqlDataSource ID="BestData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Best_Selling_Car" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Start" DbType="Date" Name="Start_Date" PropertyName="Text" />
            <asp:ControlParameter ControlID="End" DbType="Date" Name="End_Date" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="BestList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="BestData">
        <Columns>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Profit_Made" HeaderText="Profit_Made" ReadOnly="True" SortExpression="Profit_Made" />
            <asp:BoundField DataField="Number_Of_Units_Sold" HeaderText="Number_Of_Units_Sold" ReadOnly="True" SortExpression="Number_Of_Units_Sold" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />





    




    <!--Profit Earned-->
    <h3>Profit Earned From Client Purchases</h3>
    <table>
        <tr>
            <td>Year: </td>
            <td>
                <asp:TextBox ID="Yr" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search3" runat="server" Text="Search" />
            </td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="ProfitData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Profit_Earned_From_Client_Purchases_By_Year" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Yr" Name="Year" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="ProfitList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" runat="server" AutoGenerateColumns="False" DataSourceID="ProfitData">
        <Columns>
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Total_Earned_from_Client_Purchases" HeaderText="Total_Earned_from_Client_Purchases" SortExpression="Total_Earned_from_Client_Purchases" />
            <asp:BoundField DataField="Total_Spent" HeaderText="Total_Spent" SortExpression="Total_Spent" />
            <asp:BoundField DataField="Net_Profit" HeaderText="Net_Profit" ReadOnly="True" SortExpression="Net_Profit" />
            <asp:BoundField DataField="Total_Commission_to_be_Paid" HeaderText="Total_Commission_to_be_Paid" SortExpression="Total_Commission_to_be_Paid" />
            <asp:BoundField DataField="Gross_Profit" HeaderText="Gross_Profit" ReadOnly="True" SortExpression="Gross_Profit" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

    





</asp:Content>
