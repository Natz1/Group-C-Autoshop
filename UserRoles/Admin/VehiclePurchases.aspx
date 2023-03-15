<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehiclePurchases.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.VehiclesPurchases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains data on vehicles purchased by autoshop-->
    <h1>Vehicles Purchased by Autoshop</h1>
    <!--connect to db-->
    <asp:SqlDataSource ID="PurchaseData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Purchase.Purchase_ID, Purchase.Date, Purchase.Salesman_ID, Purchase.Value, Vehicle.Chassis_Number, Vehicle.Year, Vehicle.Colour, Vehicle.Make, Vehicle.Model, Vehicle.Type, Vehicle.Condition, Vehicle.Import_Price, Vehicle.Mark_Up_Percent, Vehicle.Engine_Number, Vehicle.CC_Ratings, Vehicle.Mileage FROM Purchase INNER JOIN Vehicle ON Purchase.Chassis_Number = Vehicle.Chassis_Number" InsertCommand="Add_Vehicle" InsertCommandType="StoredProcedure">
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
        AllowPaging="True" DataSourceID="PurchaseData" AutoGenerateColumns="False" DataKeyNames="Purchase_ID,Chassis_Number">
        <Columns>
            <asp:BoundField DataField="Purchase_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Purchase_ID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Salesman_ID" HeaderText="Salesman" SortExpression="Salesman_ID" />
            <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis" SortExpression="Chassis_Number" ReadOnly="True" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Import_Price" HeaderText="Import_Price" SortExpression="Import_Price" />
            <asp:BoundField DataField="Mark_Up_Percent" HeaderText="Mark_Up" SortExpression="Mark_Up_Percent" />
            <asp:BoundField DataField="Engine_Number" HeaderText="Engine_Number" SortExpression="Engine_Number" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
        </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br /><br />

    <!--Form to enter purchase info-->
    <h3>Add new vehicle</h3>
    <asp:SqlDataSource ID="AddVData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT Chassis_Number FROM Purchase" 
        UpdateCommand="UPDATE Purchase SET Salesman_ID = @salesman WHERE (Chassis_Number = (SELECT TOP 1 (Chassis_Number) FROM Purchase ORDER BY Purchase_ID DESC))">
        <UpdateParameters>
            <asp:ControlParameter Name="salesman" ControlID="SalesmanTxt" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table>
        <tr>
            <td><h4>Salesman ID: </h4></td>
            <td>
                <asp:TextBox ID="SalesmanTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Chassis Number: </h4></td>
            <td>
                <asp:TextBox ID="ChassisTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Year: </h4></td>
            <td>
                <asp:TextBox ID="YrTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Colour: </h4></td>
            <td>
                <asp:TextBox ID="ColourTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Make: </h4></td>
            <td>
                <asp:TextBox ID="MakeTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Model: </h4></td>
            <td>
                <asp:TextBox ID="ModTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Type: </h4></td>
            <td>
                <asp:TextBox ID="TypeTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Condition: </h4></td>
            <td>
                <asp:TextBox ID="ConTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Import Price: </h4></td>
            <td>
                <asp:TextBox ID="ImportTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Mark Up Percent: </h4></td>
            <td>
                <asp:TextBox ID="MarkUpTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Engine Number: </h4></td>
            <td>
                <asp:TextBox ID="EngineTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>CC_Ratings</h4></td>
            <td>
                <asp:TextBox ID="CCTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Mileage</h4></td>
            <td>
                <asp:TextBox ID="MileTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Sold</h4></td>
            <td>
                <asp:DropDownList ID="SoldTxt" runat="server">
                    <asp:ListItem>No</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click"/>
            </td>
        </tr>
    </table>

</asp:Content>
