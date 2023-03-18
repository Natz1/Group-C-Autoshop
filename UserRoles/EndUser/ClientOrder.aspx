<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientOrder.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.ClientOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Order Now!</h1>
    <!--The client can order vehicles, additions for vehicles and schedule repairs for their owned vehicles-->
    <!--Only clients can access this page-->
    <!--Once they click submit it will send their order to the admin to
        add a salesman or mechanic-->

    <!--Form for client information-->
    <h3>Customer Information</h3>
    <br />
    <table>
        <tr>
            <td><h4>Name: </h4></td>
            <td><asp:TextBox ID="CNameTxt" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator runat="server" ErrorMessage=" Name is required." ControlToValidate="CNameTxt"></asp:RequiredFieldValidator></td>

        </tr>
        <tr>
            <td><h4>Home Address: </h4></td>
            <td><asp:TextBox ID="CAddrTxt" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator runat="server" ErrorMessage=" Address is required." ControlToValidate="CAddrTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><h4>Email: </h4></td>
            <td><asp:TextBox ID="CEmailTxt" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator runat="server" ErrorMessage=" Email is required." ControlToValidate="CEmailTxt"></asp:RequiredFieldValidator></td>
            <td>&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must be an email." 
                ControlToValidate="CEmailTxt" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            
        </tr>
        <tr>
            <td><h4>Phone Number (###)-###-####: </h4></td>
            <td><asp:TextBox ID="CPhoneTxt" runat="server" MaxLength="14"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator runat="server" ErrorMessage=" Phone is required." ControlToValidate="CPhoneTxt"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <!--Insert into client and phone number-->
    <asp:SqlDataSource ID="ClientData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Client.* FROM Client" InsertCommand="Add_Client" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter Name="Name" Type="String" ControlID="CNameTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Address" Type="String" ControlID="CAddrTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Email" Type="String" ControlID="CEmailTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Phone" Type="String" ControlID="CPhoneTxt" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>

    <!---Selected Options-->
    <h3>Vehicle Information</h3>
    <br />
    <asp:GridView ID="VehicleList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px">
        <EmptyDataTemplate>You have not selected a vehicle to display.</EmptyDataTemplate>
    </asp:GridView>


    <h3>Work to be done</h3>
    <h4>Additions</h4>
    <br />
    <asp:GridView ID="AdditionList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px">
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
    </asp:GridView>


    <br />
    <h4>Replacement Parts</h4>
    <br />
    <asp:GridView ID="PartsList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px">
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
    </asp:GridView>

    <br /><br />
    <asp:Button ID="Confirm" runat="server" Text="Confirm" OnClick="Confirm_Click" />
    <!--Cancel clears all the data in the order-->
    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />

</asp:Content>
