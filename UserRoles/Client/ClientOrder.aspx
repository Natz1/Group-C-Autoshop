<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientOrder.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.ClientOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Order Now!</h1>
    <!--The client can order vehicles, additions for vehicles and schedule repairs for their owned vehicles-->
    <!--Only clients can access this page-->
    <!--Once they click submit it will send their order to the admin to
        add a salesman or mechanic-->

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
