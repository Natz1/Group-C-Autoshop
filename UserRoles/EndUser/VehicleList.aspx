<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleList.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.VehicleList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Vehicles for Sale</h1>
    <img src="/Images/toyotatacoma.jpg" width="300" height="250"/>
    <h3>2020 Toyoto Tacoma</h3>
    <table>
        <tr>
            <td>Type: </td>
            <td><asp:TextBox Id="TextBox3" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Colour: </td>
            <td><asp:TextBox Id="TextBox1" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Condition: </td>
            <td><asp:TextBox Id="TextBox2" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>CC Rating: </td>
            <td><asp:TextBox Id="TextBox4" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Mileage: </td>
            <td><asp:TextBox Id="TextBox5" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Price: $</td>
            <td><asp:TextBox Id="Price1" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Buy"></asp:Button></td>
        </tr>
    </table>
    <br />
    <br />

    <img src="/Images/hondacity.jpg" width="300" height="250"/>
    <h3>2020 Honda City</h3>
    <table>
        <tr>
            <td>Type: </td>
            <td><asp:TextBox Id="TextBox6" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Colour: </td>
            <td><asp:TextBox Id="TextBox7" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Condition: </td>
            <td><asp:TextBox Id="TextBox8" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>CC Rating: </td>
            <td><asp:TextBox Id="TextBox9" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Mileage: </td>
            <td><asp:TextBox Id="TextBox10" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Price: $</td>
            <td><asp:TextBox Id="TextBox11" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Buy1"></asp:Button></td>
        </tr>
    </table>
    <br />
    <br />

    <img src="/Images/subaruwrx.jpg" width="300" height="250"/>
    <h3>2020 Subaru WRX</h3>
    <table>
        <tr>
            <td>Type: </td>
            <td><asp:TextBox Id="TextBox12" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Colour: </td>
            <td><asp:TextBox Id="TextBox13" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Condition: </td>
            <td><asp:TextBox Id="TextBox14" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>CC Rating: </td>
            <td><asp:TextBox Id="TextBox15" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Mileage: </td>
            <td><asp:TextBox Id="TextBox16" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Price: $</td>
            <td><asp:TextBox Id="TextBox17" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Buy2"></asp:Button></td>
        </tr>
    </table>
    <br />
    <br />

</asp:Content>
