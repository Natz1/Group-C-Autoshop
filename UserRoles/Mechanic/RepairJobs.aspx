<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepairJobs.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.Mechanic.RepairJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>View Repair Jobs</h1>

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

    <asp:SqlDataSource ID="RepairData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="Repair_Jobs_By_Mechanic" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ID" Name="Mechanic_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:ListView ID="RepairList" runat="server" DataKeyNames="Mechanic_ID,Job_Number" DataSourceID="RepairData">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Mechanic_ID:
                <asp:Label ID="Mechanic_IDLabel" runat="server" Text='<%# Eval("Mechanic_ID") %>' />
                <br />
                Mechanic:
                <asp:Label ID="MechanicLabel" runat="server" Text='<%# Eval("Mechanic") %>' />
                <br />
                Job_Number:
                <asp:Label ID="Job_NumberLabel" runat="server" Text='<%# Eval("Job_Number") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
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
                Repair_Job_Total:
                <asp:Label ID="Repair_Job_TotalLabel" runat="server" Text='<%# Eval("Repair_Job_Total") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Mechanic_ID:
                <asp:Label ID="Mechanic_IDLabel1" runat="server" Text='<%# Eval("Mechanic_ID") %>' />
                <br />
                Mechanic:
                <asp:TextBox ID="MechanicTextBox" runat="server" Text='<%# Bind("Mechanic") %>' />
                <br />
                Job_Number:
                <asp:Label ID="Job_NumberLabel1" runat="server" Text='<%# Eval("Job_Number") %>' />
                <br />
                Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
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
                Repair_Job_Total:
                <asp:TextBox ID="Repair_Job_TotalTextBox" runat="server" Text='<%# Bind("Repair_Job_Total") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Mechanic_ID:
                <asp:TextBox ID="Mechanic_IDTextBox" runat="server" Text='<%# Bind("Mechanic_ID") %>' />
                <br />Mechanic:
                <asp:TextBox ID="MechanicTextBox" runat="server" Text='<%# Bind("Mechanic") %>' />
                <br />Job_Number:
                <asp:TextBox ID="Job_NumberTextBox" runat="server" Text='<%# Bind("Job_Number") %>' />
                <br />Chassis_Number:
                <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
                <br />Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />Number_of_parts_Used:
                <asp:TextBox ID="Number_of_parts_UsedTextBox" runat="server" Text='<%# Bind("Number_of_parts_Used") %>' />
                <br />Parts_Cost:
                <asp:TextBox ID="Parts_CostTextBox" runat="server" Text='<%# Bind("Parts_Cost") %>' />
                <br />Repair_Cost:
                <asp:TextBox ID="Repair_CostTextBox" runat="server" Text='<%# Bind("Repair_Cost") %>' />
                <br />Repair_Job_Total:
                <asp:TextBox ID="Repair_Job_TotalTextBox" runat="server" Text='<%# Bind("Repair_Job_Total") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #E0FFFF;color: #333333;">Mechanic_ID:
                <asp:Label ID="Mechanic_IDLabel" runat="server" Text='<%# Eval("Mechanic_ID") %>' />
                <br />
                Mechanic:
                <asp:Label ID="MechanicLabel" runat="server" Text='<%# Eval("Mechanic") %>' />
                <br />
                Job_Number:
                <asp:Label ID="Job_NumberLabel" runat="server" Text='<%# Eval("Job_Number") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
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
                Repair_Job_Total:
                <asp:Label ID="Repair_Job_TotalLabel" runat="server" Text='<%# Eval("Repair_Job_Total") %>' />
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
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Mechanic_ID:
                <asp:Label ID="Mechanic_IDLabel" runat="server" Text='<%# Eval("Mechanic_ID") %>' />
                <br />
                Mechanic:
                <asp:Label ID="MechanicLabel" runat="server" Text='<%# Eval("Mechanic") %>' />
                <br />
                Job_Number:
                <asp:Label ID="Job_NumberLabel" runat="server" Text='<%# Eval("Job_Number") %>' />
                <br />
                Chassis_Number:
                <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
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
                Repair_Job_Total:
                <asp:Label ID="Repair_Job_TotalLabel" runat="server" Text='<%# Eval("Repair_Job_Total") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
</asp:ListView>



</asp:Content>
