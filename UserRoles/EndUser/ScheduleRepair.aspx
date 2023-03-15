<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleRepair.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.ScheduleRepair" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Form for scheduling repairs-->

    <h1>Schedule Repairs</h1>

    <h3>Enter Vehicle Details: </h3>
    <!--Chassis number has to be in vehicles sold-->
    <table>
        <tr>
            <td><h4>Chassis Number: </h4></td>
            <td>
                <asp:TextBox ID="ChassisTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Description of Damage Done: </h4></td>
            <td>
                <asp:TextBox ID="damageTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Select Mechanic: </h4></td>
            <td><asp:DropDownList ID="mechanic" DataValueField="Mechanic_ID" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Schedule" runat="server" Text="Schedule" OnClick="Schedule_Click"/>
            </td>
        </tr>
    </table>
    <!--Will insert data on button click-->
    <asp:SqlDataSource ID="RepairOrder" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" InsertCommand="INSERT INTO Repair(Description) VALUES (@description)" SelectCommand="SELECT FROM Repair_Jobs">
        <InsertParameters>
            <asp:ControlParameter Name="description" ControlID="damageTxt" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
