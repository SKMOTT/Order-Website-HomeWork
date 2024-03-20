<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BF.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: #FFFFFF;
            font-size: xx-large;
            background-color: #000066;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style6 {
            color: #FFFFFF;
            font-size: x-large;
            background-color: #000066;
        }
        .auto-style7 {
            font-size: x-large;
            font-weight: bold;
        }
        .auto-style8 {
            font-size: x-large;
            color: #FFFFFF;
            background-color: #FF00FF;
        }
    </style>
</head>
<body style="background-position: center center; background-image: url('https://localhost:44348/123.jpg'); background-size: cover ;background-repeat: no-repeat; background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>歡迎來到牛肉麵店</strong></div>
        <table class="auto-style2" style="position: relative">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style4">
                    <strong>
                    <asp:Label ID="accountLB" runat="server" Text="帳號 : " CssClass="auto-style6"></asp:Label>
                    </strong>
                    <asp:TextBox ID="accountTB" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style4">
                    <strong>
                    <asp:Label ID="passwordLB" runat="server" Text="密碼 : " CssClass="auto-style6"></asp:Label>
                    </strong>
                    <asp:TextBox ID="passwordTB" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style4">
                    <strong>
                    <asp:Button ID="loginBT" runat="server" Text="登入" CssClass="auto-style7" OnClick="loginBT_Click1" />
                    </strong>
                    <asp:LinkButton ID="entry" runat="server" CssClass="auto-style8" Visible="False" PostBackUrl="~/Store.aspx">進入商店</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:DetailsView ID="clientDetailsView" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="clientData" EmptyDataText="帳號密碼錯誤" Height="50px" Visible="False" Width="125px">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                <asp:BoundField DataField="user_money" HeaderText="user_money" SortExpression="user_money" />
                <asp:BoundField DataField="user_phone" HeaderText="user_phone" SortExpression="user_phone" />
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="clientData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT user_name, user_money, user_phone FROM userData WHERE (user_name = @user_name) AND (user_password = @user_password)">
            <SelectParameters>
                <asp:ControlParameter ControlID="accountTB" Name="user_name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordTB" Name="user_password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
