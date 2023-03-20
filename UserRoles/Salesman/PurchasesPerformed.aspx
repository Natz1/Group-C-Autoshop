<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchasesPerformed.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Salesman.PurchasesPerformed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>My Purchases</h1>

    <!--Sales-->
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
    <!--Link to database-->
    <asp:SqlDataSource ID="PurchaseData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Purchase.Salesman_ID, Purchase.Purchase_ID, Purchase.Date, Purchase.Value, Purchase.Cost, Vehicle.Chassis_Number, Vehicle.Year, Vehicle.Colour, Vehicle.Make, Vehicle.Model, Vehicle.Type, Vehicle.Condition FROM Purchase INNER JOIN Vehicle ON Purchase.Chassis_Number = Vehicle.Chassis_Number WHERE (Purchase.Salesman_ID = @salesman)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" Name="salesman" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="PurchaseList" runat="server" DataKeyNames="Purchase_ID,Chassis_Number" DataSourceID="PurchaseData">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Salesman_ID:
                <asp:Label ID="Salesman_IDLabel" runat="server" Text='<%# Eval("Salesman_ID") %>' />
                <br />
                Purchase_ID:
                <asp:Label ID="Purchase_IDLabel" runat="server" Text='<%# Eval("Purchase_ID") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Value:
                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                <br />
                Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Colour:
                <asp:Label ID="ColourLabel" runat="server" Text='<%# Eval("Colour") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Type:
                <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                <br />
                Condition:
                <asp:Label ID="ConditionLabel" runat="server" Text='<%# Eval("Condition") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Salesman_ID:
                <asp:TextBox ID="Salesman_IDTextBox" runat="server" Text='<%# Bind("Salesman_ID") %>' />
                <br />
                Purchase_ID:
                <asp:Label ID="Purchase_IDLabel1" runat="server" Text='<%# Eval("Purchase_ID") %>' />
                <br />
                Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Value:
                <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' />
                <br />
                Cost:
                <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel1" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Colour:
                <asp:TextBox ID="ColourTextBox" runat="server" Text='<%# Bind("Colour") %>' />
                <br />
                Make:
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />
                Model:
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />
                Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />
                Condition:
                <asp:TextBox ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
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
                <br />Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />Value:
                <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' />
                <br />Cost:
                <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                <br />Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />Year:
                <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                <br />Colour:
                <asp:TextBox ID="ColourTextBox" runat="server" Text='<%# Bind("Colour") %>' />
                <br />Make:
                <asp:TextBox ID="MakeTextBox" runat="server" Text='<%# Bind("Make") %>' />
                <br />Model:
                <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("Model") %>' />
                <br />Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />Condition:
                <asp:TextBox ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
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
                Purchase_ID:
                <asp:Label ID="Purchase_IDLabel" runat="server" Text='<%# Eval("Purchase_ID") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Value:
                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                <br />
                Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Colour:
                <asp:Label ID="ColourLabel" runat="server" Text='<%# Eval("Colour") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Type:
                <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                <br />
                Condition:
                <asp:Label ID="ConditionLabel" runat="server" Text='<%# Eval("Condition") %>' />
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
                Purchase_ID:
                <asp:Label ID="Purchase_IDLabel" runat="server" Text='<%# Eval("Purchase_ID") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
                Value:
                <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                <br />
                Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                <br />
                Colour:
                <asp:Label ID="ColourLabel" runat="server" Text='<%# Eval("Colour") %>' />
                <br />
                Make:
                <asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' />
                <br />
                Model:
                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                <br />
                Type:
                <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                <br />
                Condition:
                <asp:Label ID="ConditionLabel" runat="server" Text='<%# Eval("Condition") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
