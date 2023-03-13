<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SpareParts.aspx.cs" Inherits="Group_C_Autoshop.EndUser.SpareParts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all spare vehicle parts available-->
    <h1>Available Replacement Parts</h1>
    <h3>Doors</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox1" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList7" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button7"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <h3>Mirrors</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox2" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList6" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button1"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <h3>Head Lights</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox4" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button2"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <h3>Tail Lights</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox6" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button3"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <h3>Tires</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox8" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button4"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <h3>Bumpers</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox10" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button5"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <h3>Brakes</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox13" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="Buy" Id="Button6"></asp:Button></td>
        </tr>
    </table>
    <br /><br />
</asp:Content>
