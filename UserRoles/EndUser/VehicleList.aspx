<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleList.aspx.cs" Inherits="Group_C_Autoshop.UserRoles.EndUser.VehicleList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Vehicles for Sale</h1>
    <img src="/Images/toyotatacoma.jpg" width="300" height="250"/>
    <h3>Toyoto Tacoma</h3>
    <!--Get from db-->
    <asp:SqlDataSource ID="ToyotaData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Chassis_Number, Year, Colour, Make, Model, Type, Condition, Engine_Number, CC_Ratings, Mileage FROM Vehicle WHERE (Make = 'Toyota') AND (Model = 'Tacoma') AND (Sold = 'No')">
    </asp:SqlDataSource>
    <!--Grid view-->
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="ToyotaData" DataKeyNames="Chassis_Number" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Chassis_Number:
            <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Chassis_Number:
            <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Colour:
            <asp:Label ID="ColourLabel" runat="server" Text='<%# Bind("Colour") %>' />
            <br />
            Make:
            <asp:Label ID="MakeLabel" runat="server" Text='<%# Bind("Make") %>' />
            <br />
            Model:
            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
            <br />
            Type:
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Condition:
            <asp:Label ID="ConditionLabel" runat="server" Text='<%# Bind("Condition") %>' />
            <br />
            Engine_Number:
            <asp:Label ID="Engine_NumberLabel" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:Label ID="CC_RatingsLabel" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:Label ID="MileageLabel" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
        </ItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>None currently left in stock.</EmptyDataTemplate>
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Buy1" runat="server" Text="Buy" OnClick="Buy1_Click" />
    <br />
    <br />





    <!--*********************************************************************-->
    <img src="/Images/hondacity.jpg" width="300" height="250"/>
    <h3>Honda City</h3>
    <!--Get from db-->
    <asp:SqlDataSource ID="HondaData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Chassis_Number, Year, Colour, Make, Model, Type, Condition, Engine_Number, CC_Ratings, Mileage FROM Vehicle WHERE (Make = 'Honda') AND (Model = 'City') AND (Sold = 'No')">
    </asp:SqlDataSource>
    <!--Grid view-->
    <asp:FormView ID="FormView2" runat="server" AllowPaging="True" DataSourceID="HondaData" DataKeyNames="Chassis_Number" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Chassis_Number:
            <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Chassis_Number:
            <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Colour:
            <asp:Label ID="ColourLabel" runat="server" Text='<%# Bind("Colour") %>' />
            <br />
            Make:
            <asp:Label ID="MakeLabel" runat="server" Text='<%# Bind("Make") %>' />
            <br />
            Model:
            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
            <br />
            Type:
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Condition:
            <asp:Label ID="ConditionLabel" runat="server" Text='<%# Bind("Condition") %>' />
            <br />
            Engine_Number:
            <asp:Label ID="Engine_NumberLabel" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:Label ID="CC_RatingsLabel" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:Label ID="MileageLabel" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
        </ItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>None currently left in stock.</EmptyDataTemplate>
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Buy2" runat="server" Text="Buy" OnClick="Buy2_Click" />
    <br />
    <br />





    <!--*********************************************************************-->
    <img src="/Images/subaruwrx.jpg" width="300" height="250"/>
    <h3>Subaru WRX</h3>
    <!--Get from db-->
    <asp:SqlDataSource ID="SubaruData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Chassis_Number, Year, Colour, Make, Model, Type, Condition, Engine_Number, CC_Ratings, Mileage FROM Vehicle WHERE (Make = 'Subaru') AND (Model = 'WRX') AND (Sold = 'No')">
    </asp:SqlDataSource>
    <!--Grid view-->
    <asp:FormView ID="FormView3" runat="server" AllowPaging="True" DataSourceID="SubaruData" DataKeyNames="Chassis_Number" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Chassis_Number:
            <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Chassis_Number:
            <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Colour:
            <asp:Label ID="ColourLabel" runat="server" Text='<%# Bind("Colour") %>' />
            <br />
            Make:
            <asp:Label ID="MakeLabel" runat="server" Text='<%# Bind("Make") %>' />
            <br />
            Model:
            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
            <br />
            Type:
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Condition:
            <asp:Label ID="ConditionLabel" runat="server" Text='<%# Bind("Condition") %>' />
            <br />
            Engine_Number:
            <asp:Label ID="Engine_NumberLabel" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:Label ID="CC_RatingsLabel" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:Label ID="MileageLabel" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
        </ItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>None currently left in stock.</EmptyDataTemplate>
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Buy3" runat="server" Text="Buy" OnClick="Buy3_Click" />
    <br />
    <br />




    <!--*********************************************************************-->
    <img src="/Images/bmwx6.jpg" width="300" height="250"/>
    <h3>BMW X6</h3>
    <!--Get from db-->
    <asp:SqlDataSource ID="BMWData" runat="server" ConnectionString="<%$ ConnectionStrings:Car_Mart_Web_AppConnectionString %>" SelectCommand="SELECT Chassis_Number, Year, Colour, Make, Model, Type, Condition, Engine_Number, CC_Ratings, Mileage FROM Vehicle WHERE (Make = 'BMW') AND (Model = 'X6') AND (Sold = 'No')">
    </asp:SqlDataSource>
    <!--Grid view-->
    <asp:FormView ID="FormView4" runat="server" AllowPaging="True" DataSourceID="BMWData" DataKeyNames="Chassis_Number" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Chassis_Number:
            <asp:TextBox ID="Chassis_NumberTextBox" runat="server" Text='<%# Bind("Chassis_Number") %>' />
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
            Engine_Number:
            <asp:TextBox ID="Engine_NumberTextBox" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:TextBox ID="CC_RatingsTextBox" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:TextBox ID="MileageTextBox" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Chassis_Number:
            <asp:Label ID="Chassis_NumberLabel" runat="server" Text='<%# Eval("Chassis_Number") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Colour:
            <asp:Label ID="ColourLabel" runat="server" Text='<%# Bind("Colour") %>' />
            <br />
            Make:
            <asp:Label ID="MakeLabel" runat="server" Text='<%# Bind("Make") %>' />
            <br />
            Model:
            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
            <br />
            Type:
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Condition:
            <asp:Label ID="ConditionLabel" runat="server" Text='<%# Bind("Condition") %>' />
            <br />
            Engine_Number:
            <asp:Label ID="Engine_NumberLabel" runat="server" Text='<%# Bind("Engine_Number") %>' />
            <br />
            CC_Ratings:
            <asp:Label ID="CC_RatingsLabel" runat="server" Text='<%# Bind("CC_Ratings") %>' />
            <br />
            Mileage:
            <asp:Label ID="MileageLabel" runat="server" Text='<%# Bind("Mileage") %>' />
            <br />
        </ItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>None currently left in stock.</EmptyDataTemplate>
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Buy4" runat="server" Text="Buy" OnClick="Buy4_Click" />
    <br />
    <br />

</asp:Content>
