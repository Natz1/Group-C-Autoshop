<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientInvoice.aspx.cs" Inherits="Group_C_Autoshop.EndUser.ClientInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Generates invoice of client's purchases-->
    <h1>Invoice</h1>
    <asp:SqlDataSource ID="InvoiceData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Client_Invoice_1.* FROM dbo.Client_Invoice(@id) AS Client_Invoice_1">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="InvoiceData">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Car_Alarm:
                <asp:Label ID="Car_AlarmLabel" runat="server" Text='<%# Eval("Car_Alarm") %>' />
                <br />
                Radio_Installation:
                <asp:Label ID="Radio_InstallationLabel" runat="server" Text='<%# Eval("Radio_Installation") %>' />
                <br />
                Tracking_Device:
                <asp:Label ID="Tracking_DeviceLabel" runat="server" Text='<%# Eval("Tracking_Device") %>' />
                <br />
                Car_Price:
                <asp:Label ID="Car_PriceLabel" runat="server" Text='<%# Eval("Car_Price") %>' />
                <br />
                Number_of_Parts_Purchased:
                <asp:Label ID="Number_of_Parts_PurchasedLabel" runat="server" Text='<%# Eval("Number_of_Parts_Purchased") %>' />
                <br />
                Parts_Cost_Total:
                <asp:Label ID="Parts_Cost_TotalLabel" runat="server" Text='<%# Eval("Parts_Cost_Total") %>' />
                <br />
                Repair_Cost_Total:
                <asp:Label ID="Repair_Cost_TotalLabel" runat="server" Text='<%# Eval("Repair_Cost_Total") %>' />
                <br />
                Add_On_Cost_Total:
                <asp:Label ID="Add_On_Cost_TotalLabel" runat="server" Text='<%# Eval("Add_On_Cost_Total") %>' />
                <br />
                Invoice_Total:
                <asp:Label ID="Invoice_TotalLabel" runat="server" Text='<%# Eval("Invoice_Total") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Make:
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />
                Model:
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />
                Car_Alarm:
                <asp:TextBox ID="Car_AlarmTextBox" runat="server" Text='<%# Bind("Car_Alarm") %>' />
                <br />
                Radio_Installation:
                <asp:TextBox ID="Radio_InstallationTextBox" runat="server" Text='<%# Bind("Radio_Installation") %>' />
                <br />
                Tracking_Device:
                <asp:TextBox ID="Tracking_DeviceTextBox" runat="server" Text='<%# Bind("Tracking_Device") %>' />
                <br />
                Car_Price:
                <asp:TextBox ID="Car_PriceTextBox" runat="server" Text='<%# Bind("Car_Price") %>' />
                <br />
                Number_of_Parts_Purchased:
                <asp:TextBox ID="Number_of_Parts_PurchasedTextBox" runat="server" Text='<%# Bind("Number_of_Parts_Purchased") %>' />
                <br />
                Parts_Cost_Total:
                <asp:TextBox ID="Parts_Cost_TotalTextBox" runat="server" Text='<%# Bind("Parts_Cost_Total") %>' />
                <br />
                Repair_Cost_Total:
                <asp:TextBox ID="Repair_Cost_TotalTextBox" runat="server" Text='<%# Bind("Repair_Cost_Total") %>' />
                <br />
                Add_On_Cost_Total:
                <asp:TextBox ID="Add_On_Cost_TotalTextBox" runat="server" Text='<%# Bind("Add_On_Cost_Total") %>' />
                <br />
                Invoice_Total:
                <asp:TextBox ID="Invoice_TotalTextBox" runat="server" Text='<%# Bind("Invoice_Total") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Make:
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />
                Model:
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />
                Car_Alarm:
                <asp:TextBox ID="Car_AlarmTextBox" runat="server" Text='<%# Bind("Car_Alarm") %>' />
                <br />
                Radio_Installation:
                <asp:TextBox ID="Radio_InstallationTextBox" runat="server" Text='<%# Bind("Radio_Installation") %>' />
                <br />
                Tracking_Device:
                <asp:TextBox ID="Tracking_DeviceTextBox" runat="server" Text='<%# Bind("Tracking_Device") %>' />
                <br />
                Car_Price:
                <asp:TextBox ID="Car_PriceTextBox" runat="server" Text='<%# Bind("Car_Price") %>' />
                <br />
                Number_of_Parts_Purchased:
                <asp:TextBox ID="Number_of_Parts_PurchasedTextBox" runat="server" Text='<%# Bind("Number_of_Parts_Purchased") %>' />
                <br />
                Parts_Cost_Total:
                <asp:TextBox ID="Parts_Cost_TotalTextBox" runat="server" Text='<%# Bind("Parts_Cost_Total") %>' />
                <br />
                Repair_Cost_Total:
                <asp:TextBox ID="Repair_Cost_TotalTextBox" runat="server" Text='<%# Bind("Repair_Cost_Total") %>' />
                <br />
                Add_On_Cost_Total:
                <asp:TextBox ID="Add_On_Cost_TotalTextBox" runat="server" Text='<%# Bind("Add_On_Cost_Total") %>' />
                <br />
                Invoice_Total:
                <asp:TextBox ID="Invoice_TotalTextBox" runat="server" Text='<%# Bind("Invoice_Total") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <ItemTemplate>

            <li style="background-color: #E0FFFF;color: #333333;">Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Car_Alarm:
                <asp:Label ID="Car_AlarmLabel" runat="server" Text='<%# Eval("Car_Alarm") %>' />
                <br />
                Radio_Installation:
                <asp:Label ID="Radio_InstallationLabel" runat="server" Text='<%# Eval("Radio_Installation") %>' />
                <br />
                Tracking_Device:
                <asp:Label ID="Tracking_DeviceLabel" runat="server" Text='<%# Eval("Tracking_Device") %>' />
                <br />
                Car_Price:
                <asp:Label ID="Car_PriceLabel" runat="server" Text='<%# Eval("Car_Price") %>' />
                <br />
                Number_of_Parts_Purchased:
                <asp:Label ID="Number_of_Parts_PurchasedLabel" runat="server" Text='<%# Eval("Number_of_Parts_Purchased") %>' />
                <br />
                Parts_Cost_Total:
                <asp:Label ID="Parts_Cost_TotalLabel" runat="server" Text='<%# Eval("Parts_Cost_Total") %>' />
                <br />
                Repair_Cost_Total:
                <asp:Label ID="Repair_Cost_TotalLabel" runat="server" Text='<%# Eval("Repair_Cost_Total") %>' />
                <br />
                Add_On_Cost_Total:
                <asp:Label ID="Add_On_Cost_TotalLabel" runat="server" Text='<%# Eval("Add_On_Cost_Total") %>' />
                <br />
                Invoice_Total:
                <asp:Label ID="Invoice_TotalLabel" runat="server" Text='<%# Eval("Invoice_Total") %>' />
                <br />
            </li>

        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Car_Alarm:
                <asp:Label ID="Car_AlarmLabel" runat="server" Text='<%# Eval("Car_Alarm") %>' />
                <br />
                Radio_Installation:
                <asp:Label ID="Radio_InstallationLabel" runat="server" Text='<%# Eval("Radio_Installation") %>' />
                <br />
                Tracking_Device:
                <asp:Label ID="Tracking_DeviceLabel" runat="server" Text='<%# Eval("Tracking_Device") %>' />
                <br />
                Car_Price:
                <asp:Label ID="Car_PriceLabel" runat="server" Text='<%# Eval("Car_Price") %>' />
                <br />
                Number_of_Parts_Purchased:
                <asp:Label ID="Number_of_Parts_PurchasedLabel" runat="server" Text='<%# Eval("Number_of_Parts_Purchased") %>' />
                <br />
                Parts_Cost_Total:
                <asp:Label ID="Parts_Cost_TotalLabel" runat="server" Text='<%# Eval("Parts_Cost_Total") %>' />
                <br />
                Repair_Cost_Total:
                <asp:Label ID="Repair_Cost_TotalLabel" runat="server" Text='<%# Eval("Repair_Cost_Total") %>' />
                <br />
                Add_On_Cost_Total:
                <asp:Label ID="Add_On_Cost_TotalLabel" runat="server" Text='<%# Eval("Add_On_Cost_Total") %>' />
                <br />
                Invoice_Total:
                <asp:Label ID="Invoice_TotalLabel" runat="server" Text='<%# Eval("Invoice_Total") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
