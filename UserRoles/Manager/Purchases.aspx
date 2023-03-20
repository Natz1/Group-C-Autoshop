<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Manager.Purchases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains data on vehicles purchased by autoshop-->
    <h1>Vehicles Purchased by Autoshop</h1>
    <!--connect to db-->
    <asp:SqlDataSource ID="PurchaseData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT Purchase_ID, Date, Value, Cost, Salesman_ID, Chassis_Number FROM Purchase" 
        InsertCommand="Add_Vehicle" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter Name="Chassis_Number" Type="String" ControlID="ChassisTxt"/>
            <asp:ControlParameter Name="Year" Type="String" ControlID="YrTxt"/>
            <asp:ControlParameter Name="Colour" Type="String" ControlID="ColourTxt"/>
            <asp:ControlParameter Name="Make" Type="String" ControlID="MakeTxt"/>
            <asp:ControlParameter Name="Model" Type="String" ControlID="ModTxt"/>
            <asp:ControlParameter Name="Type" Type="String" ControlID="TypeTxt"/>
            <asp:ControlParameter Name="Condition" Type="String" ControlID="ConTxt"/>
            <asp:ControlParameter Name="Import_Price" Type="Decimal" ControlID="ImportTxt"/>
            <asp:ControlParameter Name="Mark_Up_Percent" Type="Int32" ControlID="MarkUpTxt"/>
            <asp:ControlParameter Name="Engine_Number" Type="String" ControlID="EngineTxt"/>
            <asp:ControlParameter Name="CC_Ratings" Type="String" ControlID="CCTxt"/>
            <asp:ControlParameter Name="Mileage" Type="Int32" ControlID="MileTxt"/>
            <asp:ControlParameter Name="Sold" Type="String" ControlID="SoldTxt"/>
        </InsertParameters>
    </asp:SqlDataSource>
    <!--Grid View-->
    <asp:GridView ID="PurchaseList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="800px" PageSize="20" 
        AllowPaging="True" DataSourceID="PurchaseData" AutoGenerateColumns="False" DataKeyNames="Purchase_ID">
        <Columns>
            <asp:BoundField DataField="Purchase_ID" HeaderText="Purchase_ID" InsertVisible="False" ReadOnly="True" SortExpression="Purchase_ID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman_ID" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br /><br />
</asp:Content>
