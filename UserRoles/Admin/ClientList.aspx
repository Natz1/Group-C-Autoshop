<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientList.aspx.cs" Inherits="Group_C_Autoshop.Admin.ClientList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all previous clients
        Once new client orders this list will be updated-->
    <!--Client List-->
    <h1>D&R Autoshop's Client List</h1>
    <!--Link to database-->
    <asp:SqlDataSource ID="ClientData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT C.Client_ID, C.Name, C.Residential_Address, C.Email, CP.Phone_Number FROM Client AS C INNER JOIN Client_Phone AS CP ON CP.Client_ID = C.Client_ID"></asp:SqlDataSource>

    <!--Grid View of client list-->
    <asp:GridView ID="ClientsList" runat="server" AllowPaging="True" DataSourceID="ClientData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Residential_Address" HeaderText="Residential_Address" SortExpression="Residential_Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
        </Columns>
</asp:GridView>

</asp:Content>
