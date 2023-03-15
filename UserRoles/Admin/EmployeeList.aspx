<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="Group_C_Autoshop.Admin.EmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all employees-->
    <!--Separates employees into admin personnel, salesman, and mechanic-->

    <h1>D&R Autoshop's Employee List</h1>
    <h3>All Autoshop Employees</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="EmpData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
    <!--Grid View of employee list-->
    <asp:GridView ID="EmpList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" PageSize="20" runat="server" 
        AllowPaging="True" DataSourceID="EmpData" AutoGenerateColumns="False" DataKeyNames="Employee_ID" Width="700px">
        <Columns>
            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" InsertVisible="False" ReadOnly="True" SortExpression="Employee_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Date_Employed" HeaderText="Date_Employed" SortExpression="Date_Employed" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor_ID" SortExpression="Supervisor_ID" />
        </Columns>
    </asp:GridView>
    <br />

    <h3>Administrative Personnel</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="AdminData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT E.Employee_ID, E.Name, E.Date_Employed, E.DOB, E.Supervisor_ID, A.Salary FROM Administrative_Personnel AS A INNER JOIN Employee AS E ON E.Employee_ID = A.Admin_ID"></asp:SqlDataSource>
    <!--Grid View of admin personnel list-->
    <asp:GridView ID="AdminList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" PageSize="20" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="AdminData" Width="700px">
        <Columns>
            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" InsertVisible="False" ReadOnly="True" SortExpression="Employee_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Date_Employed" HeaderText="Date_Employed" SortExpression="Date_Employed" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor_ID" SortExpression="Supervisor_ID" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
        </Columns>
    </asp:GridView>
    <br />

    <h3>Mechanics</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="MecData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT E.*, M.Salary, M.Area_Of_Expertise FROM Mechanic AS M INNER JOIN Employee AS E ON M.Mechanic_ID = E.Employee_ID"></asp:SqlDataSource>
    <!--Grid View of mechanic list-->
    <asp:GridView ID="MecList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" PageSize="20" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="MecData" Width="700px">
        <Columns>
            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" InsertVisible="False" ReadOnly="True" SortExpression="Employee_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Date_Employed" HeaderText="Date_Employed" SortExpression="Date_Employed" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor_ID" SortExpression="Supervisor_ID" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            <asp:BoundField DataField="Area_Of_Expertise" HeaderText="Area_Of_Expertise" SortExpression="Area_Of_Expertise" />
        </Columns>
    </asp:GridView>
    <br />

    <h3>Salesmen</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="SalesmanData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Employee.*, Salesman.Travel_Subsistence FROM Employee INNER JOIN Salesman ON Employee.Employee_ID = Salesman.Salesman_ID"></asp:SqlDataSource>
    <!--Grid View of salesman list-->
    <asp:GridView ID="SalesmanList" runat="server" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="700px" PageSize="20" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="SalesmanData" >
        <Columns>
            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" InsertVisible="False" ReadOnly="True" SortExpression="Employee_ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Date_Employed" HeaderText="Date_Employed" SortExpression="Date_Employed" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor_ID" SortExpression="Supervisor_ID" />
            <asp:BoundField DataField="Travel_Subsistence" HeaderText="Travel_Subsistence" SortExpression="Travel_Subsistence" />
        </Columns>
    </asp:GridView>
    <br />

    <!--Supervisor-->
    <h3>Supervisor Search</h3>
    <table>
        <tr>
            <td><h4>Supervisor ID:</h4></td>
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
    <asp:SqlDataSource ID="SupervisorData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Assigned_Supervisor_1.* FROM dbo.Assigned_Supervisor(@Supervisor_id) AS Assigned_Supervisor_1">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" DefaultValue="0" Name="Supervisor_Id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--Grid View of supervisor list-->
    <asp:GridView ID="SupervisorList" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" runat="server" AllowPaging="True" PageSize="20"
        DataSourceID="SupervisorData" AutoGenerateColumns="False" DataKeyNames="Employee_ID" Width="700px">
        <Columns>
            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" SortExpression="Employee_ID" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Date_Employed" HeaderText="Date_Employed" SortExpression="Date_Employed" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Supervisor_ID" HeaderText="Supervisor_ID" SortExpression="Supervisor_ID" />
        </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

</asp:Content>
