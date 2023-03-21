<%@ Page Title="Employee Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EmployeeLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Page welcome-->
    <h1 class="welcome">Welcome<br /> to D&R's<br /> Autoshop</h1>

    <div class="login-box">
        <h2><%: Title %>.</h2>
        <!--Error Message-->
        <p class="text-danger" style="color:#2779e7;">
            <asp:Literal runat="server" ID="Literal1" />
        </p>
        <hr />

        <table>
            <tr>
                <td><h4>Employee ID: </h4></td>
                <td><asp:TextBox ID="EmpIDTxt" runat="server" ForeColor="Black"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="*ID is required." ForeColor="#2779E7"
                    ControlToValidate="EmpIDTxt"></asp:RequiredFieldValidator></td>
            </tr>





            <tr>
                <td><h4>Password: </h4></td>
                <td><asp:TextBox runat="server" ID="PassTxt" TextMode="Password" ForeColor="Black"/></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="PassTxt"
                    CssClass="text-danger" ErrorMessage="*The password field is required." ForeColor="#2779E7"/>
                </td>
            </tr>

        </table>

        <!--Registration Button-->
        <div class="form-group">
            <div class="col-md-offset-7 col-md-10">
                <asp:Button ID="Login" runat="server" Text="Log in" CssClass="btn btn-default" />
            </div>
        </div>
    </div>



   
</asp:Content>
