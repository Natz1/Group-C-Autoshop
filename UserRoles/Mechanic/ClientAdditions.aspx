<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientAdditions.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Mechanic.ClientAdditions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>View Client Additions</h1>
    <h3>Search</h3>
    <table>
        <tr>
            <td><h4>Client ID:</h4></td>
            <td>
                <asp:TextBox ID="ID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Search1" runat="server" Text="Search"/>
            </td>
        </tr>
        
    </table>
    <br />

    <asp:SqlDataSource ID="AddData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Client_Additions_Checker" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" Name="Client_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="AddList" runat="server" DataSourceID="AddData">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Client_ID:
                <asp:Label ID="Client_IDLabel" runat="server" Text='<%# Eval("Client_ID") %>' />
                <br />
                Client:
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
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
                Addition_Cost:
                <asp:Label ID="Addition_CostLabel" runat="server" Text='<%# Eval("Addition_Cost") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Client_ID:
                <asp:TextBox ID="Client_IDTextBox" runat="server" Text='<%# Bind("Client_ID") %>' />
                <br />
                Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />
                Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
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
                Addition_Cost:
                <asp:TextBox ID="Addition_CostTextBox" runat="server" Text='<%# Bind("Addition_Cost") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Client_ID:
                <asp:TextBox ID="Client_IDTextBox" runat="server" Text='<%# Bind("Client_ID") %>' />
                <br />Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />Car_Alarm:
                <asp:TextBox ID="Car_AlarmTextBox" runat="server" Text='<%# Bind("Car_Alarm") %>' />
                <br />Radio_Installation:
                <asp:TextBox ID="Radio_InstallationTextBox" runat="server" Text='<%# Bind("Radio_Installation") %>' />
                <br />Tracking_Device:
                <asp:TextBox ID="Tracking_DeviceTextBox" runat="server" Text='<%# Bind("Tracking_Device") %>' />
                <br />Addition_Cost:
                <asp:TextBox ID="Addition_CostTextBox" runat="server" Text='<%# Bind("Addition_Cost") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #E0FFFF;color: #333333;">Client_ID:
                <asp:Label ID="Client_IDLabel" runat="server" Text='<%# Eval("Client_ID") %>' />
                <br />
                Client:
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
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
                Addition_Cost:
                <asp:Label ID="Addition_CostLabel" runat="server" Text='<%# Eval("Addition_Cost") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Client_ID:
                <asp:Label ID="Client_IDLabel" runat="server" Text='<%# Eval("Client_ID") %>' />
                <br />
                Client:
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
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
                Addition_Cost:
                <asp:Label ID="Addition_CostLabel" runat="server" Text='<%# Eval("Addition_Cost") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>


</asp:Content>
