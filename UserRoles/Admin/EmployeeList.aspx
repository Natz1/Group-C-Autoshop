<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="Group_C_Autoshop.Admin.EmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all employees-->
    <!--Separates employees into admin personnel, salesman, and mechanic-->

    <h1>D&R Autoshop's Employee List</h1>
    <h3>All Autoshop Employees</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="EmpData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" 
        SelectCommand="SELECT * FROM [Employee]" InsertCommand="Add_Employee_and_Sort" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter Name="Name" Type="String" ControlID="NameTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Date_Employed" Type="DateTime" ControlID="DateTxt" PropertyName="Text" />
            <asp:ControlParameter Name="DOB" Type="DateTime" ControlID="DOBTxt" PropertyName="Text" />
            <asp:ControlParameter Name="Supervisor_ID" Type="Int32" ControlID="Sup1Txt" PropertyName="Text" />
            <asp:ControlParameter Name="employee_type" Type="String" ControlID="TypeTxt" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />

    <!--Form to enter purchase info-->
    <h3>Add new employee</h3>
    <table>
        <tr>
            <td><h4>Date Employed (YYYY/MM/DD): </h4></td>
            <td>
                <asp:TextBox ID="DateTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Name: </h4></td>
            <td>
                <asp:TextBox ID="NameTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>DOB (YYYY/MM/DD): </h4></td>
            <td>
                <asp:TextBox ID="DOBTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Supervisor ID: </h4></td>
            <td>
                <asp:TextBox ID="Sup1Txt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Employee Type: </h4></td>
            <td>
                <asp:DropDownList ID="TypeTxt" runat="server">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Salesman</asp:ListItem>
                    <asp:ListItem>Mechanic</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click"/>
            </td>
        </tr>
    </table>
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
    </asp:GridView>
    <br />






    <h3>Administrative Personnel</h3>
    <!--Link to database-->
    <asp:SqlDataSource ID="AdminData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT E.Employee_ID, E.Name, E.Date_Employed, E.DOB, E.Supervisor_ID, A.Salary FROM Administrative_Personnel AS A INNER JOIN Employee AS E ON E.Employee_ID = A.Admin_ID" UpdateCommand="Update_Salary_Or_Subsistence" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:ControlParameter Name="Employee_Id" Type="Int32" ControlID="Emp1ID" PropertyName="Text" />
            <asp:ControlParameter Name="Salary" Type="Decimal" ControlID="Sal" PropertyName="Text" />
            <asp:ControlParameter Name="Employee_Type" Type="String" ControlID="SalType" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
        <HeaderStyle CssClass="header"></HeaderStyle>

        <RowStyle CssClass="rows"></RowStyle>
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
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
        <EmptyDataTemplate>No data available for display.</EmptyDataTemplate>
    </asp:GridView>
    <br />



     <!--Updating Salary/Subsistence-->
    <h3>Update Salary or Subsistence</h3>
    <table>
        <tr>
            <td><h4>Employee ID: </h4></td>
            <td>
                <asp:TextBox ID="Emp1ID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Salary $: </h4></td>
            <td>
                <asp:TextBox ID="Sal" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><h4>Employee Type: </h4></td>
            <td>
                <asp:DropDownList ID="SalType" runat="server">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Salesman</asp:ListItem>
                    <asp:ListItem>Mechanic</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click"/>
            </td>
        </tr>
    </table>
    <br />

    

</asp:Content>
