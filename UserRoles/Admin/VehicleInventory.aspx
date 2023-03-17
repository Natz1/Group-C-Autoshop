<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleInventory.aspx.cs" Inherits="Group_C_Autoshop.EndUser.VehicleInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all vehicles available-->
    <h1>D&R Autoshop Vehicles</h1>
    <h3>Vehicles Left In Stock</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="OwnedData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Vehicle]"></asp:SqlDataSource>
    <!--Grid View of supervisor list-->
    <asp:GridView ID="OwnedList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"  PageSize="20" 
        runat="server" AllowPaging="True" DataSourceID="OwnedData" AutoGenerateColumns="False" DataKeyNames="Chassis_Number">
        <Columns>
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" SortExpression="Chassis_Number" ReadOnly="True" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Import_Price" HeaderText="Import_Price" SortExpression="Import_Price" />
            <asp:BoundField DataField="Mark_Up_Percent" HeaderText="Mark_Up_Percent" SortExpression="Mark_Up_Percent" />
            <asp:BoundField DataField="Engine_Number" HeaderText="Engine_Number" SortExpression="Engine_Number" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
            <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
    </asp:GridView>
    <br />

    <!--Car Types-->
    <h3>Cars</h3>
    <h4>Update</h4>
    <table>
        <thead>
            <tr>
                <th>Chassis Number</th>
                <th>Seating Capacity</th>
                <th>Wheel Drive</th>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="Chassis1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Seat1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Wheel1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Add1" runat="server" Text="Add" OnClick="Add1_Click" />
            </td>
        </tr>
    </table><br />

    <asp:SqlDataSource ID="CarData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Car.*, Vehicle.Year, Vehicle.Colour, Vehicle.Make, Vehicle.Model, Vehicle.Type, Vehicle.Condition, Vehicle.Import_Price, Vehicle.Mark_Up_Percent, Vehicle.Engine_Number, Vehicle.CC_Ratings, Vehicle.Mileage, Vehicle.Sold FROM Car INNER JOIN Vehicle ON Car.Chassis_Number = Vehicle.Chassis_Number">
    </asp:SqlDataSource>
    <asp:GridView ID="CarList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"  PageSize="20" 
        runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Chassis_Number" DataSourceID="CarData">
        <Columns>
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" ReadOnly="True" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Seating_Capacity" HeaderText="Seating_Capacity" SortExpression="Seating_Capacity" />
            <asp:BoundField DataField="Wheel_Drive" HeaderText="Wheel_Drive" SortExpression="Wheel_Drive" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Import_Price" HeaderText="Import_Price" SortExpression="Import_Price" />
            <asp:BoundField DataField="Mark_Up_Percent" HeaderText="Mark_Up_Percent" SortExpression="Mark_Up_Percent" />
            <asp:BoundField DataField="Engine_Number" HeaderText="Engine_Number" SortExpression="Engine_Number" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
            <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
            <HeaderStyle CssClass="header"></HeaderStyle>

            <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />




    <h3>Four Wheel Drive</h3>
    <h4>Update</h4>
    <table>
        <thead>
            <tr>
                <th>Chassis Number</th>
                <th>Seating Capacity</th>
                <th>Fuel</th>
                <th>Vehicle Size</th>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="Chassis2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Seat2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Fuel2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Size2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Add2" runat="server" Text="Add" OnClick="Add2_Click" />
            </td>
        </tr>
    </table><br />

    <asp:SqlDataSource ID="WDData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Four_WD.*, Vehicle.Year, Vehicle.Colour, Vehicle.Make, Vehicle.Model, Vehicle.Type, Vehicle.Condition, Vehicle.Import_Price, Vehicle.Mark_Up_Percent, Vehicle.Engine_Number, Vehicle.CC_Ratings, Vehicle.Mileage, Vehicle.Sold FROM Four_WD INNER JOIN Vehicle ON Four_WD.Chassis_Number = Vehicle.Chassis_Number">
    </asp:SqlDataSource>
    <asp:GridView ID="WDList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"  PageSize="20" 
        runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Chassis_Number" DataSourceID="WDData">
        <Columns>
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" ReadOnly="True" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Seating_Capacity" HeaderText="Seating_Capacity" SortExpression="Seating_Capacity" />
            <asp:BoundField DataField="Fuel" HeaderText="Fuel" SortExpression="Fuel" />
            <asp:BoundField DataField="Vehicle_Size" HeaderText="Vehicle_Size" SortExpression="Vehicle_Size" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Import_Price" HeaderText="Import_Price" SortExpression="Import_Price" />
            <asp:BoundField DataField="Mark_Up_Percent" HeaderText="Mark_Up_Percent" SortExpression="Mark_Up_Percent" />
            <asp:BoundField DataField="Engine_Number" HeaderText="Engine_Number" SortExpression="Engine_Number" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
            <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
            <HeaderStyle CssClass="header"></HeaderStyle>

            <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />




    <h3>Vans</h3>
    <h4>Update</h4>
    <table>
        <thead>
            <tr>
                <th>Chassis Number</th>
                <th>Haulage Size</th>
                <th>Max Clearance</th>
            </tr>
        </thead>
        <tr>
            <td>
                <asp:TextBox ID="Chassis3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Haulage3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Max3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Add3" runat="server" Text="Add" OnClick="Add3_Click" />
            </td>
        </tr>
    </table><br />

    <asp:SqlDataSource ID="VanData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Van.Chassis_Number, Van.Haulage_Size, Van.Max_Clearance, Vehicle.Year, Vehicle.Colour, Vehicle.Make, Vehicle.Model, Vehicle.Type, Vehicle.Condition, Vehicle.Import_Price, Vehicle.Mark_Up_Percent, Vehicle.Engine_Number, Vehicle.CC_Ratings, Vehicle.Mileage, Vehicle.Sold FROM Van INNER JOIN Vehicle ON Van.Chassis_Number = Vehicle.Chassis_Number">
    </asp:SqlDataSource>
    <asp:GridView ID="VanList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="1000px"  PageSize="20" 
        runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Chassis_Number" DataSourceID="VanData">
        <Columns>
            <asp:BoundField DataField="Chassis_Number" HeaderText="Chassis_Number" ReadOnly="True" SortExpression="Chassis_Number" />
            <asp:BoundField DataField="Haulage_Size" HeaderText="Haulage_Size" SortExpression="Haulage_Size" />
            <asp:BoundField DataField="Max_Clearance" HeaderText="Max_Clearance" SortExpression="Max_Clearance" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Colour" HeaderText="Colour" SortExpression="Colour" />
            <asp:BoundField DataField="Make" HeaderText="Make" SortExpression="Make" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Import_Price" HeaderText="Import_Price" SortExpression="Import_Price" />
            <asp:BoundField DataField="Mark_Up_Percent" HeaderText="Mark_Up_Percent" SortExpression="Mark_Up_Percent" />
            <asp:BoundField DataField="Engine_Number" HeaderText="Engine_Number" SortExpression="Engine_Number" />
            <asp:BoundField DataField="CC_Ratings" HeaderText="CC_Ratings" SortExpression="CC_Ratings" />
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
            <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
        </Columns>
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
            <HeaderStyle CssClass="header"></HeaderStyle>

            <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />
</asp:Content>
