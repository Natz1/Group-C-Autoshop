<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Change Password</h1>

    <table>
        <tr>
            <td><h3>New Password:</h3></td>
            <td>
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Password is Required" ControlToValidate="Password" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><h3>Confirm Password:</h3></td>
            <td><asp:TextBox ID="Confirm" runat="server" TextMode="Password"></asp:TextBox>

            </td>
            <td>
                <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" ValidationGroup="Val1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Confirm Password is Required" ControlToValidate="Confirm" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>

    <br />
    <asp:Label ID="Result" runat="server" Text=""></asp:Label>
</asp:Content>
