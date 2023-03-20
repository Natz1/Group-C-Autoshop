<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Manager.Clients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all previous clients
        Once new client orders this list will be updated-->
    <!--Client List-->
    <h1>D&R Autoshop's Client List</h1>
    <!--Link to database-->
    <asp:SqlDataSource ID="ClientData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT C.Client_ID, C.Name, C.Residential_Address, C.Email, CP.Phone_Number FROM Client AS C INNER JOIN Client_Phone AS CP ON CP.Client_ID = C.Client_ID"></asp:SqlDataSource>

    <!--Grid View of client list-->
    <asp:GridView ID="ClientsList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="700px" PageSize="20" 
        AllowPaging="True" DataSourceID="ClientData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Residential_Address" HeaderText="Residential_Address" SortExpression="Residential_Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>

        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
</asp:GridView>

    <!--Search-->
    <h3>Client Search</h3>
    <table>
        <tr>
            <td>Client ID: </td>
            <td>
                <asp:TextBox ID="ID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search" runat="server" Text="Search" />
            </td>
        </tr>
    </table>

    <br />
    <asp:SqlDataSource ID="SearchData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Client.Client_ID, Client.Name, Client.Residential_Address, Client.Email, Client_Phone.Phone_Number FROM Client INNER JOIN Client_Phone ON Client.Client_ID = Client_Phone.Client_ID WHERE (Client.Client_ID = @Client_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" DefaultValue="0" Name="Client_ID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="SearchList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="700px" 
        DataSourceID="SearchData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Residential_Address" HeaderText="Residential_Address" SortExpression="Residential_Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
</asp:Content>
