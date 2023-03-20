<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientInvoice.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Admin.ClientInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Generates invoice of client's purchases-->
    <h1>Adjust Client Purchases</h1>
    <h3>View Sales Data</h3>
    <asp:SqlDataSource ID="SaleData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT * FROM [Client_Sale]">
    </asp:SqlDataSource>
    <asp:GridView ID="SaleList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" AllowPaging="True" 
        DataSourceID="SaleData" AutoGenerateColumns="False" >
        <Columns>
            <asp:BoundField DataField="Sale_ID" HeaderText="Sale_ID" SortExpression="Sale_ID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" SortExpression="Client_ID" />
            <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Car_Price" HeaderText="Car_Price" SortExpression="Car_Price" />
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman_ID" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Mechanic_ID" HeaderText="Mechanic_ID" SortExpression="Mechanic_ID" />
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" SortExpression="Job_Number" />
            <asp:BoundField DataField="Number_of_parts_Used" HeaderText="Number_of_parts_Used" SortExpression="Number_of_parts_Used" />
            <asp:BoundField DataField="Parts_Cost" HeaderText="Parts_Cost" SortExpression="Parts_Cost" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Repair_Cost" HeaderText="Repair_Cost" SortExpression="Repair_Cost" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>

        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

    <h3>View Client Additions</h3>
    <asp:SqlDataSource ID="AdditionData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Client_Additions]"></asp:SqlDataSource>
    <asp:GridView ID="AdditionList"  HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px" AllowPaging="True" 
        runat="server" AutoGenerateColumns="False" DataSourceID="AdditionData">
        <Columns>
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" SortExpression="Client_ID" />
            <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Car_Alarm" HeaderText="Car_Alarm" SortExpression="Car_Alarm" />
            <asp:BoundField DataField="Radio_Installation" HeaderText="Radio_Installation" SortExpression="Radio_Installation" />
            <asp:BoundField DataField="Tracking_Device" HeaderText="Tracking_Device" SortExpression="Tracking_Device" />
            <asp:BoundField DataField="Addition_Cost" HeaderText="Addition_Cost" SortExpression="Addition_Cost" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

    <h3>View Parts to be Changed</h3>
    <asp:SqlDataSource ID="PartsData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Sale.Sale_ID, Client.Client_ID, Client.Name, Sale.Chassis_Number, Part_Changed.Job_Number, Part_Changed.Part_Id, Part_Changed.Part_Name, Part_Changed.Quantity FROM Client INNER JOIN Sale ON Client.Client_ID = Sale.Client_ID INNER JOIN Work_Done ON Sale.Sale_ID = Work_Done.Sale_ID INNER JOIN Part_Changed ON Work_Done.Job_Number = Part_Changed.Job_Number"></asp:SqlDataSource>
    <asp:GridView ID="PartsList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"
        AllowPaging="True" AutoGenerateColumns="False" DataSourceID="PartsData">
        <Columns>
            <asp:BoundField DataField="Sale_ID" HeaderText="Sale_ID" InsertVisible="False" ReadOnly="True" SortExpression="Sale_ID" />
            <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" InsertVisible="False" ReadOnly="True" SortExpression="Client_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Job_Number" HeaderText="Job_Number" SortExpression="Job_Number" />
            <asp:BoundField DataField="Part_Id" HeaderText="Part_Id" SortExpression="Part_Id" />
            <asp:BoundField DataField="Part_Name" HeaderText="Part_Name" SortExpression="Part_Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
    </asp:GridView>
    <br />

    <!--Assigns a salesman and mechanic to order-->
    <h3>Update Sales Data</h3>
    <!--Form to enter info-->
    <table>
        <tr>
            <td><h4>Sales ID: </h4></td>
            <td><asp:TextBox ID="Sale" runat="server"></asp:TextBox></td>
            
        </tr>
        <tr>
            <td><h4>Select Salesman: </h4></td>
            <td><asp:TextBox ID="salesm" runat="server"></asp:TextBox></td>
            
        </tr>
        <tr>
            <td><h4>Select Mechanic: </h4></td>
            <td><asp:TextBox ID="mechan" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><h4>Repair Cost: </h4></td>
            <td>
                <asp:TextBox ID="Repair" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Description: </h4></td>
            <td>
                <asp:TextBox ID="Desc" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" ValidationGroup="Val1" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="Sales ID is required." ControlToValidate="Sale" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Salesman ID is required." ControlToValidate="salesm" ValidationGroup="Val1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />





    <h3>Generate Client Invoice</h3>
    <asp:SqlDataSource ID="InvoiceData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT Client_Invoice_1.* FROM dbo.Client_Invoice(@id) AS Client_Invoice_1">
        <SelectParameters>
            <asp:ControlParameter ControlID="Specific" Name="id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="InvoiceData">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Sale_ID:
                <asp:Label ID="Sale_IDLabel" runat="server" Text='<%# Eval("Sale_ID") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Client_ID:
                <asp:Label ID="Client_IDLabel" runat="server" Text='<%# Eval("Client_ID") %>' />
                <br />
                Client:
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Car_Price:
                <asp:Label ID="Car_PriceLabel" runat="server" Text='<%# Eval("Car_Price") %>' />
                <br />
                Radio_Installation:
                <asp:Label ID="Radio_InstallationLabel" runat="server" Text='<%# Eval("Radio_Installation") %>' />
                <br />
                Car_Alarm:
                <asp:Label ID="Car_AlarmLabel" runat="server" Text='<%# Eval("Car_Alarm") %>' />
                <br />
                Tracking_Device:
                <asp:Label ID="Tracking_DeviceLabel" runat="server" Text='<%# Eval("Tracking_Device") %>' />
                <br />
                Addition_Cost:
                <asp:Label ID="Addition_CostLabel" runat="server" Text='<%# Eval("Addition_Cost") %>' />
                <br />
                Number_of_parts_Used:
                <asp:Label ID="Number_of_parts_UsedLabel" runat="server" Text='<%# Eval("Number_of_parts_Used") %>' />
                <br />
                Parts_Cost:
                <asp:Label ID="Parts_CostLabel" runat="server" Text='<%# Eval("Parts_Cost") %>' />
                <br />
                Repair_Cost:
                <asp:Label ID="Repair_CostLabel" runat="server" Text='<%# Eval("Repair_Cost") %>' />
                <br />
                Total_Cost:
                <asp:Label ID="Total_CostLabel" runat="server" Text='<%# Eval("Total_Cost") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Sale_ID:
                <asp:TextBox ID="Sale_IDTextBox" runat="server" Text='<%# Bind("Sale_ID") %>' />
                <br />
                Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Client_ID:
                <asp:TextBox ID="Client_IDTextBox" runat="server" Text='<%# Bind("Client_ID") %>' />
                <br />
                Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />
                Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />
                Car_Price:
                <asp:TextBox ID="Car_PriceTextBox" runat="server" Text='<%# Bind("Car_Price") %>' />
                <br />
                Radio_Installation:
                <asp:TextBox ID="Radio_InstallationTextBox" runat="server" Text='<%# Bind("Radio_Installation") %>' />
                <br />
                Car_Alarm:
                <asp:TextBox ID="Car_AlarmTextBox" runat="server" Text='<%# Bind("Car_Alarm") %>' />
                <br />
                Tracking_Device:
                <asp:TextBox ID="Tracking_DeviceTextBox" runat="server" Text='<%# Bind("Tracking_Device") %>' />
                <br />
                Addition_Cost:
                <asp:TextBox ID="Addition_CostTextBox" runat="server" Text='<%# Bind("Addition_Cost") %>' />
                <br />
                Number_of_parts_Used:
                <asp:TextBox ID="Number_of_parts_UsedTextBox" runat="server" Text='<%# Bind("Number_of_parts_Used") %>' />
                <br />
                Parts_Cost:
                <asp:TextBox ID="Parts_CostTextBox" runat="server" Text='<%# Bind("Parts_Cost") %>' />
                <br />
                Repair_Cost:
                <asp:TextBox ID="Repair_CostTextBox" runat="server" Text='<%# Bind("Repair_Cost") %>' />
                <br />
                Total_Cost:
                <asp:TextBox ID="Total_CostTextBox" runat="server" Text='<%# Bind("Total_Cost") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Sale_ID:
                <asp:TextBox ID="Sale_IDTextBox" runat="server" Text='<%# Bind("Sale_ID") %>' />
                <br />
                Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Client_ID:
                <asp:TextBox ID="Client_IDTextBox" runat="server" Text='<%# Bind("Client_ID") %>' />
                <br />
                Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />
                Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />
                Car_Price:
                <asp:TextBox ID="Car_PriceTextBox" runat="server" Text='<%# Bind("Car_Price") %>' />
                <br />
                Radio_Installation:
                <asp:TextBox ID="Radio_InstallationTextBox" runat="server" Text='<%# Bind("Radio_Installation") %>' />
                <br />
                Car_Alarm:
                <asp:TextBox ID="Car_AlarmTextBox" runat="server" Text='<%# Bind("Car_Alarm") %>' />
                <br />
                Tracking_Device:
                <asp:TextBox ID="Tracking_DeviceTextBox" runat="server" Text='<%# Bind("Tracking_Device") %>' />
                <br />
                Addition_Cost:
                <asp:TextBox ID="Addition_CostTextBox" runat="server" Text='<%# Bind("Addition_Cost") %>' />
                <br />
                Number_of_parts_Used:
                <asp:TextBox ID="Number_of_parts_UsedTextBox" runat="server" Text='<%# Bind("Number_of_parts_Used") %>' />
                <br />
                Parts_Cost:
                <asp:TextBox ID="Parts_CostTextBox" runat="server" Text='<%# Bind("Parts_Cost") %>' />
                <br />
                Repair_Cost:
                <asp:TextBox ID="Repair_CostTextBox" runat="server" Text='<%# Bind("Repair_Cost") %>' />
                <br />
                Total_Cost:
                <asp:TextBox ID="Total_CostTextBox" runat="server" Text='<%# Bind("Total_Cost") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <ItemTemplate>

            <li style="background-color: #E0FFFF;color: #333333;">Sale_ID:
                <asp:Label ID="Sale_IDLabel" runat="server" Text='<%# Eval("Sale_ID") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Client_ID:
                <asp:Label ID="Client_IDLabel" runat="server" Text='<%# Eval("Client_ID") %>' />
                <br />
                Client:
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Car_Price:
                <asp:Label ID="Car_PriceLabel" runat="server" Text='<%# Eval("Car_Price") %>' />
                <br />
                Radio_Installation:
                <asp:Label ID="Radio_InstallationLabel" runat="server" Text='<%# Eval("Radio_Installation") %>' />
                <br />
                Car_Alarm:
                <asp:Label ID="Car_AlarmLabel" runat="server" Text='<%# Eval("Car_Alarm") %>' />
                <br />
                Tracking_Device:
                <asp:Label ID="Tracking_DeviceLabel" runat="server" Text='<%# Eval("Tracking_Device") %>' />
                <br />
                Addition_Cost:
                <asp:Label ID="Addition_CostLabel" runat="server" Text='<%# Eval("Addition_Cost") %>' />
                <br />
                Number_of_parts_Used:
                <asp:Label ID="Number_of_parts_UsedLabel" runat="server" Text='<%# Eval("Number_of_parts_Used") %>' />
                <br />
                Parts_Cost:
                <asp:Label ID="Parts_CostLabel" runat="server" Text='<%# Eval("Parts_Cost") %>' />
                <br />
                Repair_Cost:
                <asp:Label ID="Repair_CostLabel" runat="server" Text='<%# Eval("Repair_Cost") %>' />
                <br />
                Total_Cost:
                <asp:Label ID="Total_CostLabel" runat="server" Text='<%# Eval("Total_Cost") %>' />
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
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Sale_ID:
                <asp:Label ID="Sale_IDLabel" runat="server" Text='<%# Eval("Sale_ID") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Client_ID:
                <asp:Label ID="Client_IDLabel" runat="server" Text='<%# Eval("Client_ID") %>' />
                <br />
                Client:
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Car_Price:
                <asp:Label ID="Car_PriceLabel" runat="server" Text='<%# Eval("Car_Price") %>' />
                <br />
                Radio_Installation:
                <asp:Label ID="Radio_InstallationLabel" runat="server" Text='<%# Eval("Radio_Installation") %>' />
                <br />
                Car_Alarm:
                <asp:Label ID="Car_AlarmLabel" runat="server" Text='<%# Eval("Car_Alarm") %>' />
                <br />
                Tracking_Device:
                <asp:Label ID="Tracking_DeviceLabel" runat="server" Text='<%# Eval("Tracking_Device") %>' />
                <br />
                Addition_Cost:
                <asp:Label ID="Addition_CostLabel" runat="server" Text='<%# Eval("Addition_Cost") %>' />
                <br />
                Number_of_parts_Used:
                <asp:Label ID="Number_of_parts_UsedLabel" runat="server" Text='<%# Eval("Number_of_parts_Used") %>' />
                <br />
                Parts_Cost:
                <asp:Label ID="Parts_CostLabel" runat="server" Text='<%# Eval("Parts_Cost") %>' />
                <br />
                Repair_Cost:
                <asp:Label ID="Repair_CostLabel" runat="server" Text='<%# Eval("Repair_Cost") %>' />
                <br />
                Total_Cost:
                <asp:Label ID="Total_CostLabel" runat="server" Text='<%# Eval("Total_Cost") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <br />


    <h3>Client Invoice Search</h3>
    <table>
        <tr>
            <td>Client ID: </td>
            <td>
                <asp:TextBox ID="Specific" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search" runat="server" Text="Search" />
            </td>
        </tr>
    </table>
</asp:Content>
