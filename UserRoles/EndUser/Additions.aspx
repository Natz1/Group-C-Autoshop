<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Additions.aspx.cs" Inherits="Group_C_Autoshop.EndUser.Additions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all vehicle additions-->
    <h1>Available Vehicle Additions</h1>
    <img src="/Images/track.jpg" width="300" height="250"/>
    <h4>Tracking Device</h4>
    <table>
        <tr>
            <td>Price: $</td>
            <td><asp:TextBox Id="Price1" runat="server" ReadOnly="True" Text="12000"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="TrackBuy" OnClick="TrackBuy_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/alarm.jpg" width="300" height="250""/>
    <h4>Car Alarm</h4>
    <table>
        <tr>
            <td>Price: $</td>
            <td><asp:TextBox Id="Price2" runat="server" ReadOnly="True" Text="22000"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="AlarmBuy" OnClick="AlarmBuy_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <img src="/Images/radio.jpg" width="300" height="250"/>
    <h4>Radio Installation</h4>
    <table>
        <tr>
            <td>Price: $</td>
            <td><asp:TextBox Id="Price3" runat="server" ReadOnly="True" Text="5000"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="RadioBuy" OnClick="RadioBuy_Click"></asp:Button></td>
        </tr>
    </table>
</asp:Content>
