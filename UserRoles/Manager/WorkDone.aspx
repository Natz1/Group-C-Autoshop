<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkDone.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Admin.WorkDone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains data on all work done by mechanics-->
    <h1>Mechanics' Works Done</h1>
    <table>
        <tr>
            <td><h4>Enter Mechanic ID: </h4></td>
            <td>
                <asp:TextBox ID="MecID" runat="server"></asp:TextBox>

            </td>
        </tr>
    </table>
    <br /><br />

    <h3>Work Performed by This Mechanic</h3>
    <!--Connect to Database-->
    <asp:SqlDataSource ID="WorkData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Repair_Jobs_By_Mechanic" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="MecID" DefaultValue="0" Name="Mechanic_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--Grid View-->
    <asp:GridView ID="WorkList" runat="server" AllowPaging="True" DataSourceID="WorkData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Mechanic_ID" HeaderText="Mechanic_ID" SortExpression="Mechanic_ID" />
            <asp:BoundField DataField="Mechanic" HeaderText="Mechanic" SortExpression="Mechanic" />
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" SortExpression="Job_Number" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Part_ID" HeaderText="Part_ID" SortExpression="Part_ID" />
            <asp:BoundField DataField="Part_Name" HeaderText="Part_Name" SortExpression="Part_Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Repair_Cost" HeaderText="Repair_Cost" SortExpression="Repair_Cost" />
            <asp:BoundField DataField="Parts_Cost" HeaderText="Parts_Cost" SortExpression="Parts_Cost" />
        </Columns>
    </asp:GridView>
</asp:Content>
