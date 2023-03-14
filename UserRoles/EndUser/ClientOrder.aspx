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
    <asp:SqlDataSource ID="ClientData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Add_Client" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="Client_Id" Type="Int32" />
            <asp:ControlParameter ControlID="CNameTxt" DefaultValue="&quot;&quot;" Name="Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CAddrTxt" DefaultValue="&quot;&quot;" Name="Address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CEmailTxt" DefaultValue="&quot;&quot;" Name="Email" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="PhoneData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" InsertCommand="SELECT Phone_Number FROM Client_Phone" SelectCommand="SELECT Client_Phone.* FROM Client_Phone"></asp:SqlDataSource>

    <!---Selected Options-->
    <h3>Vehicle Information</h3>
    <br />
    <asp:GridView ID="VehicleList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"></asp:GridView>


    <!--Fix this*************************-->
    <h3>Additions</h3>
    <br />
    <asp:GridView
        ID="AdditionList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px">
    </asp:GridView>

    <h3>Spare Parts</h3>
    <br />
    <asp:GridView ID="PartsList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px">
    </asp:GridView>

    <br /><br />
    <asp:Button ID="Confirm" runat="server" Text="Confirm" OnClick="Confirm_Click" />
    <!--Cancel runs a deletion operation from the Additions and Parts Changed tables-->
    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />

</asp:Content>
