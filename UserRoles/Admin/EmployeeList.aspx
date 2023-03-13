<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="Group_C_Autoshop.Admin.EmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all employees-->
    <!--Separates employees into admin personnel, salesman, and mechanic-->

    <h1>D&R Autoshop's Employee List</h1>
    <!--Link to database-->
    <asp:SqlDataSource ID="EmpData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
    <!--Grid View of employee list-->
    <asp:GridView ID="EmpList" runat="server" AllowPaging="True" DataSourceID="EmpData" AutoGenerateColumns="False" DataKeyNames="Employee_ID">
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
    <asp:GridView ID="AdminList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="AdminData">
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
    <asp:GridView ID="MecList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="MecData">
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
    <asp:GridView ID="SalesmanList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="SalesmanData">
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

    <h3>Assigned Supervisors</h3>
    <!--Link to database!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
    <asp:SqlDataSource ID="SupervisorData" runat="server"></asp:SqlDataSource>
    <!--Grid View of supervisor list-->
    <asp:GridView ID="SupervisorList" runat="server" AllowPaging="True" DataSourceID="SupervisorData"></asp:GridView>
    <br />

</asp:Content>
