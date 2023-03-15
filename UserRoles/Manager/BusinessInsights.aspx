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
            <asp:ControlParameter ControlID="SaleID" DefaultValue="0" Name="Salesman_Id" PropertyName="Text" Type="Int32" />
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
<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>




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
    <asp:SqlDataSource ID="ProfitData" runat="server" OnSelecting="SqlDataSource2_Selecting" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Profit_Earned_From_Client_Purchases_By_Year" SelectCommandType="StoredProcedure">
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
<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

    <!--Search mechanic's work done-->
    <h3>Work Performed by Specific Mechanics</h3>
    <table>
        <tr>
            <td><h4>Enter Mechanic ID: </h4></td>
            <td>
                <asp:TextBox ID="MecID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search4" runat="server" Text="Search"/>
            </td>
        </tr>
    </table>
    <br />

    
    <!--Connect to Database-->
    <asp:SqlDataSource ID="WorkData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Repair_Jobs_By_Mechanic" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="MecID" DefaultValue="0" Name="Mechanic_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--Grid View-->
    <asp:GridView ID="WorkList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="700px" 
        AllowPaging="True" DataSourceID="WorkData" AutoGenerateColumns="False" DataKeyNames="Mechanic_ID,Job_Number">
        <Columns>
            <asp:BoundField DataField="Mechanic_ID" HeaderText="Mechanic_ID" SortExpression="Mechanic_ID" ReadOnly="True" />
            <asp:BoundField DataField="Mechanic" HeaderText="Mechanic" SortExpression="Mechanic" />
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" SortExpression="Job_Number" ReadOnly="True" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Number_of_parts_Used" HeaderText="Number_of_parts_Used" SortExpression="Number_of_parts_Used" />
            <asp:BoundField DataField="Parts_Cost" HeaderText="Parts_Cost" SortExpression="Parts_Cost" />
            <asp:BoundField DataField="Repair_Cost" HeaderText="Repair_Cost" SortExpression="Repair_Cost" />
            <asp:BoundField DataField="Repair_Job_Total" HeaderText="Repair_Job_Total" SortExpression="Repair_Job_Total" ReadOnly="True" />
        </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>    
    <br />
    <br />





    <h3></h3>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
    <asp:GridView ID="GridView4" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20" runat="server"></asp:GridView>
    <br />
    <br />





    <h3></h3>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
    <asp:GridView ID="GridView5" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="700px" PageSize="20" runat="server"></asp:GridView>
    <br />
    <br />

</asp:Content>
