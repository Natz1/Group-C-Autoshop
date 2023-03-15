<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SpareParts.aspx.cs" Inherits="Group_C_Autoshop.EndUser.SpareParts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--Contains List of all spare vehicle parts available-->
    <h1>Available Replacement Parts</h1>
    <img src="/Images/rear.jpg" width="300" height="250"/>
    <h3>Back Bumper</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox1" runat="server" ReadOnly="True" Text="50000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy" OnClick="Buy_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/front.jpg" width="300" height="250"/>
    <h3>Front Bumper</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox2" runat="server" ReadOnly="True" Text="50000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy1" OnClick="Buy1_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/skirt.jpg" width="300" height="250"/>
    <h3>Side Skirt</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox3" runat="server" ReadOnly="True" Text="25000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy2" OnClick="Buy2_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/spoiler.jpg" width="300" height="250"/>
    <h3>Spoiler</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox4" runat="server" ReadOnly="True" Text="30000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy3" OnClick="Buy3_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/rims.jpg" width="300" height="250"/>
    <h3>Rims</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox5" runat="server" ReadOnly="True" Text="30000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy4" OnClick="Buy4_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/tire.jpg" width="300" height="250"/>
    <h3>Tires</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox6" runat="server" ReadOnly="True" Text="20000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy5" OnClick="Buy5_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />


    <img src="/Images/headlight.jpg" width="300" height="250"/>
    <h3>Head Lamps</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox7" runat="server" ReadOnly="True" Text="5000"></asp:TextBox></td>
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy6" OnClick="Buy6_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <img src="/Images/roof.jpg" width="300" height="250"/>
    <h3>Roof Rails</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox8" runat="server" ReadOnly="True" Text="15000"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList8" runat="server">
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy7" OnClick="Buy7_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <img src="/Images/mud.jpg" width="300" height="250"/>
    <h3>Mud Guard</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox9" runat="server" ReadOnly="True" Text="10000"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList9" runat="server">
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy8" OnClick="Buy8_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <img src="" width="300" height="250"/>
    <h3>Haulage Bay Cover</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox10" runat="server" ReadOnly="True" Text="20000"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList10" runat="server">
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy9" OnClick="Buy9_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />

    <img src="/Images/floodlight.jpg" width="300" height="250"/>
    <h3>Flood Light</h3>
    <table>
        <tr>
            <td>Unit Price: $</td>
            <td><asp:TextBox Id="TextBox11" runat="server" ReadOnly="True" Text="10000"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:DropDownList ID="DropDownList11" runat="server">
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
            <td><asp:Button runat="server" Text="Buy" Id="Buy10" OnClick="Buy10_Click"></asp:Button></td>
        </tr>
    </table>
    <br /><br />
</asp:Content>
