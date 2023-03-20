<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PartsChanges.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Mechanic.PartsChanges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>View Parts to be Changed</h1>
    <h3>Search</h3>
    <table>
        <tr>
            <td><h4>My ID:</h4></td>
            <td>
                <asp:TextBox ID="ID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search1" runat="server" Text="Search"/>
            </td>
        </tr>
        
    </table>
    <br />


    <asp:SqlDataSource ID="PartsData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT Work_Done.Mechanic_ID, Client.Client_ID, Client.Name, Sale.Chassis_Number, Part_Changed.Job_Number, Part_Changed.Part_Id, Part_Changed.Part_Name, Part_Changed.Quantity FROM Client INNER JOIN Sale ON Client.Client_ID = Sale.Client_ID INNER JOIN Work_Done ON Sale.Sale_ID = Work_Done.Sale_ID INNER JOIN Part_Changed ON Work_Done.Job_Number = Part_Changed.Job_Number WHERE (Work_Done.Mechanic_ID = @mechanic)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" Name="mechanic" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="PartsList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"
        AllowPaging="True" AutoGenerateColumns="False" DataSourceID="PartsData">
        <Columns>
            <asp:BoundField DataField="Mechanic_ID" HeaderText="Mechanic_ID" SortExpression="Mechanic_ID" />
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" SortExpression="Job_Number" />
            <asp:BoundField DataField="Part_Id" HeaderText="Part_Id" SortExpression="Part_Id" />
            <asp:BoundField DataField="Part_Name" HeaderText="Part_Name" SortExpression="Part_Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />
</asp:Content>
