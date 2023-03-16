<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkDone.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Manager.WorkDone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Work Done</h1>
    <h3>Work Performed by All Mechanics</h3>
    <asp:SqlDataSource ID="RepairData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Repair_Jobs]"></asp:SqlDataSource>
    <asp:GridView ID="RepairList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20"
        AllowPaging="True" DataSourceID="RepairData" AutoGenerateColumns="False" DataKeyNames="Mechanic_ID,Job_Number">
        <Columns>
            <asp:BoundField DataField="Mechanic_ID" HeaderText="Mechanic_ID" ReadOnly="True" SortExpression="Mechanic_ID" />
            <asp:BoundField DataField="Mechanic" HeaderText="Mechanic" SortExpression="Mechanic" />
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" ReadOnly="True" SortExpression="Job_Number" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Number_of_parts_Used" HeaderText="Number_of_parts_Used" SortExpression="Number_of_parts_Used" />
            <asp:BoundField DataField="Parts_Cost" HeaderText="Parts_Cost" SortExpression="Parts_Cost" />
            <asp:BoundField DataField="Repair_Cost" HeaderText="Repair_Cost" SortExpression="Repair_Cost" />
            <asp:BoundField DataField="Repair_Job_Total" HeaderText="Repair_Job_Total" ReadOnly="True" SortExpression="Repair_Job_Total" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
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
    <asp:GridView ID="WorkList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" PageSize="20"
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>    
    <br />
    <br />
</asp:Content>
