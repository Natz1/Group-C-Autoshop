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
            <td><h4>ID Number: </h4></td>
            <td><asp:GridView ID="IDTxt" runat="server"></asp:GridView></td>
        </tr>
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

    <!---Set this up-->
    <h3>Vehicle Information</h3>
    <br />
    <asp:SqlDataSource ID="VehicleData" runat="server"></asp:SqlDataSource>
    <asp:GridView ID="VehicleList" runat="server"></asp:GridView>

    <h3>Additions</h3>
    <br />
    <asp:SqlDataSource ID="AdditionData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Job_Number, Radio_Installation, Car_Alarm, Tracking_Device, Addition_Cost FROM dbo.Last_Job() AS Last_Job_1"></asp:SqlDataSource>
    <asp:GridView ID="AdditionList" runat="server" DataSourceID="AdditionData" AutoGenerateColumns="False" DataKeyNames="Job_Number">
        <Columns>
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" ReadOnly="True" SortExpression="Job_Number" />
            <asp:BoundField DataField="Radio_Installation" HeaderText="Radio_Installation" SortExpression="Radio_Installation" />
            <asp:BoundField DataField="Car_Alarm" HeaderText="Car_Alarm" SortExpression="Car_Alarm" />
            <asp:BoundField DataField="Tracking_Device" HeaderText="Tracking_Device" SortExpression="Tracking_Device" />
            <asp:BoundField DataField="Addition_Cost" HeaderText="Addition_Cost" SortExpression="Addition_Cost" />
        </Columns>
    </asp:GridView>

    <h3>Spare Parts</h3>
    <br />
    <asp:SqlDataSource ID="PartsData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Job_Number, Part_Id, Part_Name, Quantity, Parts_Cost FROM dbo.Last_Job() AS Last_Job_1"></asp:SqlDataSource>
    <asp:GridView ID="PartsList" runat="server" AutoGenerateColumns="False" DataSourceID="PartsData">
        <Columns>
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" SortExpression="Job_Number" />
            <asp:BoundField DataField="Part_Id" HeaderText="Part_Id" SortExpression="Part_Id" />
            <asp:BoundField DataField="Part_Name" HeaderText="Part_Name" SortExpression="Part_Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Parts_Cost" HeaderText="Parts_Cost" SortExpression="Parts_Cost" />
        </Columns>
    </asp:GridView>

    <br /><br />
    <asp:Button ID="Confirm" runat="server" Text="Confirm" OnClick="Confirm_Click" />
    <!--Cancel runs a deletion operation from the Additions and Parts Changed tables-->
    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />

</asp:Content>
