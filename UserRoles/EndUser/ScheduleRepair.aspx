<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleRepair.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.ScheduleRepair" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Form for scheduling repairs-->

    <h1>Schedule Repairs</h1>

    <h3>Enter Vehicle Details: </h3>
    <table>
        <tr>
            <td><h4>Chassis Number: </h4></td>
            <td>
                <asp:TextBox ID="ChassisTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Year: </h4></td>
            <td>
                <asp:TextBox ID="YrTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Colour: </h4></td>
            <td>
                <asp:TextBox ID="ColourTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Make: </h4></td>
            <td>
                <asp:TextBox ID="MakeTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Model: </h4></td>
            <td>
                <asp:TextBox ID="ModTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Condition: </h4></td>
            <td>
                <asp:TextBox ID="ConTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Description of Damage Done: </h4></td>
            <td>
                <asp:TextBox ID="damageTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>When it will be brought in (Repair Date): </h4></td>
            <td>
                <asp:TextBox ID="dateTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Schedule" runat="server" Text="Schedule"/>
            </td>
        </tr>
    </table>
</asp:Content>
