<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Group_C_Autoshop.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1 class="welcome">Welcome<br /> to D&R's<br /> Autoshop</h1>

    <div class="register-box">
        <div class="col-md-12">
            <h2><%: Title %>.</h2>
            <!--Error Message-->
            <p class="text-danger" style="color:#2779e7;">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>

            <div class="form-horizontal">
                <h4>Create a new account</h4>
                <hr />

                <!--Email-->
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                    <div class="col-md-11">
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." ForeColor="#2779E7"/>
                    </div>
                </div>

                <!--Password-->
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-11">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="The password field is required." ForeColor="#2779E7"/>
                    </div>
                </div>

                <!--Password Confirmation-->
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-7 confirm">Confirm Password</asp:Label>
                    <div class="col-md-11">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." ForeColor="#2779E7"/>
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ForeColor="#2779E7"/>
                    </div>
                </div>
                <!--Registration Button-->
                <div class="form-group">
                    <div class="col-md-offset-9 col-md-10">
                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
