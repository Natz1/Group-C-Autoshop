<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientInvoice.aspx.cs" Inherits="Group_C_Autoshop.EndUser.ClientInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Generates invoice of client's purchases-->
    <h1>Invoice</h1>
    <asp:SqlDataSource ID="InvoiceData" runat="server"></asp:SqlDataSource>
    <asp:GridView ID="InvoiceList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" runat="server" DataSourceID="InvoiceData"></asp:GridView>
</asp:Content>
