<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Group_C_Autoshop.Account.Login" Async="true" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <!--Page welcome-->
        <h1 class="welcome">Welcome<br /> to D&R's<br /> Autoshop</h1>

   

    <!--putting login form here-->
        <div class="login-box">
            <!--Heading-->
            <h2><%: Title %></h2>
            <hr />
            <!--Error Message-->
            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                <p class="text-danger" style="color:#2779e7;">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
            <!--Email-->
            <table>
                <tr>
                    <td>
                        <h4>Email:</h4>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Email" TextMode="Email" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <!--Prompt user to enter-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." ForeColor="#2779E7"/>
                    </td>
                </tr>




                <tr>
                    <td>
                        <h4>Password: </h4>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <!--Prompt user to enter-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" 
                        ErrorMessage="The password field is required." ForeColor="#2779E7"/>
                    </td>
                </tr>
            </table>

            <!--Remember user identity-->
            <div class="form-group">
                <div class="col-md-offset-4 col-md-10">
                    <div class="checkbox">
                        <asp:CheckBox runat="server" ID="RememberMe" />
                        <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                    </div>
                </div>
            </div>
            <!--Prompt user to enter-->
            <div class="form-group">
                <div class="col-md-offset-8 col-md-9">
                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                </div>
            </div>
        <p class="col-md-offset-4">
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" ForeColor="#d8ddde">Create a new account</asp:HyperLink>
        </p>
    </div>
</asp:Content>
