<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientOrder.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.ClientOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Order Now!</h1>
    <!--The client can order vehicles, additions for vehicles and schedule repairs for their owned vehicles-->
    <!--Only clients can access this page-->
    <!--Once they click submit it will redirect to invoice page-->

    <!--Form for client information-->
    <h3>Customer Information</h3>
    <br />
    <table>
        <tr>
            <td><h4>Name: </h4></td>
            <td><asp:TextBox ID="CNameTxt" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h4>Home Address: </h4></td>
            <td><asp:TextBox ID="CAddrTxt" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h4>Email: </h4></td>
            <td><asp:TextBox ID="CEmailTxt" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h4>Phone Number(s): </h4></td>
            <td><asp:TextBox ID="CPhoneTxt" runat="server"></asp:TextBox></td>
        </tr>
    </table>

    <h3>Vehicle Information</h3>
    <br />

    <h3>Additions</h3>
    <br />

    <h3>Repair Parts</h3>
    <br />


    <!--Form for scheduling repairs-->
</asp:Content>
