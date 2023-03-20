<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Group_C_Autoshop.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1 class="welcome">Welcome<br /> to D&R's<br /> Autoshop</h1>

    <div class="register-box">
        <h2><%: Title %>.</h2>
        <!--Error Message-->
        <p class="text-danger" style="color:#2779e7;">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>

        <h4>Create a new account</h4>
        <hr />

        <table>
            <tr>
                <td><h4>Name: </h4></td>
                <td><asp:TextBox ID="CNameTxt" runat="server" ForeColor="Black"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="*Name is required." ForeColor="#2779E7"
                    ControlToValidate="CNameTxt"></asp:RequiredFieldValidator></td>
            </tr>




            <tr>
                <td><h4>Address: </h4></td>
                <td><asp:TextBox ID="CAddrTxt" runat="server" ForeColor="Black"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="*Address is required." ForeColor="#2779E7"
                    ControlToValidate="CAddrTxt"></asp:RequiredFieldValidator></td>
            </tr>



            <tr>
                <td><h4>Email: </h4></td>
                <td><asp:TextBox ID="CEmailTxt" runat="server" ForeColor="Black"></asp:TextBox></td>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="*Email is required." ForeColor="#2779E7"
                    ControlToValidate="CEmailTxt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="#2779E7"
                    ErrorMessage="*Must be an email." 
                    ControlToValidate="CEmailTxt" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>




            <tr>
                <td><h4>Phone Number (###)-###-####: </h4></td>
                <td><asp:TextBox ID="CPhoneTxt" runat="server" MaxLength="14" ForeColor="Black"></asp:TextBox></td>
                        
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="*Phone is required." ForeColor="#2779E7"
                    ControlToValidate="CPhoneTxt"></asp:RequiredFieldValidator></td>
            </tr>




            <tr>
                <td><h4>Password: </h4></td>
                <td><asp:TextBox runat="server" ID="Password" TextMode="Password" ForeColor="Black"/></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="*The password field is required." ForeColor="#2779E7"/>
                </td>
            </tr>




            <tr>
                <td><h4>Confirm Password: </h4></td>
                <td><asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" ForeColor="Black"/></td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*Confirm password is required." ForeColor="#2779E7"/>
                </td>
            <tr>
                <td><asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*Password and confirmation do not match." ForeColor="#2779E7"/>
                </td>
            </tr>

        </table>

        <!--Registration Button-->
        <div class="form-group">
            <div class="col-md-offset-9 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="ClientData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT Client.* FROM Client" InsertCommand="Add_Client" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter Name="Name" Type="String" ControlID="CNameTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Address" Type="String" ControlID="CAddrTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Email" Type="String" ControlID="CEmailTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Phone" Type="String" ControlID="CPhoneTxt" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
