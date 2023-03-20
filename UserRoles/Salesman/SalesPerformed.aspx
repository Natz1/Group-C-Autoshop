<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesPerformed.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Salesman.SalesPerformed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>View My Sales</h1>

    <!--Sales-->
    <h3>Sales Search</h3>
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
    <!--Link to database-->
    <asp:SqlDataSource ID="SalesData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Sales_Done] WHERE ([Salesman_ID] = @Salesman_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" Name="Salesman_ID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="SalesList" runat="server" DataSourceID="SalesData">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Salesman_ID:
                <asp:Label ID="Salesman_IDLabel" runat="server" Text='<%# Eval("Salesman_ID") %>' />
                <br />
                Salesman:
                <asp:Label ID="SalesmanLabel" runat="server" Text='<%# Eval("Salesman") %>' />
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
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Date_Purchased:
                <asp:Label ID="Date_PurchasedLabel" runat="server" Text='<%# Eval("Date_Purchased") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Salesman_ID:
                <asp:TextBox ID="Salesman_IDTextBox" runat="server" Text='<%# Bind("Salesman_ID") %>' />
                <br />
                Salesman:
                <asp:TextBox ID="SalesmanTextBox" runat="server" Text='<%# Bind("Salesman") %>' />
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
                Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Make:
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />
                Model:
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />
                Date_Purchased:
                <asp:TextBox ID="Date_PurchasedTextBox" runat="server" Text='<%# Bind("Date_Purchased") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Salesman_ID:
                <asp:TextBox ID="Salesman_IDTextBox" runat="server" Text='<%# Bind("Salesman_ID") %>' />
                <br />Salesman:
                <asp:TextBox ID="SalesmanTextBox" runat="server" Text='<%# Bind("Salesman") %>' />
                <br />Client_ID:
                <asp:TextBox ID="Client_IDTextBox" runat="server" Text='<%# Bind("Client_ID") %>' />
                <br />Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />Make:
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />Model:
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />Date_Purchased:
                <asp:TextBox ID="Date_PurchasedTextBox" runat="server" Text='<%# Bind("Date_Purchased") %>' />
                <br />Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #E0FFFF;color: #333333;">Salesman_ID:
                <asp:Label ID="Salesman_IDLabel" runat="server" Text='<%# Eval("Salesman_ID") %>' />
                <br />
                Salesman:
                <asp:Label ID="SalesmanLabel" runat="server" Text='<%# Eval("Salesman") %>' />
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
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Date_Purchased:
                <asp:Label ID="Date_PurchasedLabel" runat="server" Text='<%# Eval("Date_Purchased") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
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
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Salesman_ID:
                <asp:Label ID="Salesman_IDLabel" runat="server" Text='<%# Eval("Salesman_ID") %>' />
                <br />
                Salesman:
                <asp:Label ID="SalesmanLabel" runat="server" Text='<%# Eval("Salesman") %>' />
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
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Date_Purchased:
                <asp:Label ID="Date_PurchasedLabel" runat="server" Text='<%# Eval("Date_Purchased") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>

</asp:Content>
