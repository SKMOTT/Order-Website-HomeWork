<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="BF.Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
            color: #000066;
        }
        .auto-style2 {
            color: #FFFFFF;
            background-color: #000066;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            text-align: left;
            width: 708px;
        }
        .auto-style6 {
            font-size: x-large;
            color: #FFFFFF;
            background-color: #000066;
        }
        .auto-style7 {
            font-size: x-large;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #000066;
        }
        .auto-style9 {
            font-size: x-large;
            font-weight: bold;
        }
    </style>
</head>
<body style="background-image: url('1234.jpg'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed; background-position: center center">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong><span class="auto-style2">歡迎來到牛肉麵店</span><table class="auto-style3">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="userShowLB" runat="server" CssClass="auto-style6" Text="使用者資料"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"><strong>
                        <asp:Button ID="orderBT" runat="server" CssClass="auto-style9" OnClick="orderBT_Click" Text="前往訂購" />
                        <asp:Button ID="truncateTableBT" runat="server" CssClass="auto-style9" OnClick="truncateTableBT_Click" Text="重建表單" />
                        </strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <strong>
                        <asp:DropDownList ID="noodleList" runat="server" AutoPostBack="True" CssClass="auto-style7" DataSourceID="noodleData" DataTextField="noodle_name" DataValueField="noodle_id" OnSelectedIndexChanged="noodleList_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:Label ID="noodlePriceLB" runat="server" CssClass="auto-style6" Text="X元"></asp:Label>
                        <asp:Label ID="noodleQtLB" runat="server" CssClass="auto-style6" Text="庫存 : X 碗"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            </strong></div>
        <table class="auto-style3">
            <tr>
                <td><strong>
                    <asp:DropDownList ID="cupList" runat="server" CssClass="auto-style7" Height="24px">
                    </asp:DropDownList>
                    <asp:Label ID="cupLB" runat="server" CssClass="auto-style6" Text="碗"></asp:Label>
                    <asp:DropDownList ID="hardList" runat="server" CssClass="auto-style7">
                        <asp:ListItem>家常麵</asp:ListItem>
                        <asp:ListItem>刀削麵</asp:ListItem>
                        <asp:ListItem>粗麵</asp:ListItem>
                        <asp:ListItem>細麵</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="vegList" runat="server" CssClass="auto-style7">
                        <asp:ListItem>要蔥</asp:ListItem>
                        <asp:ListItem>不要蔥</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="addItemBT" runat="server" CssClass="auto-style7" Text="添加" />
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
            <strong>
                    <asp:Image ID="noodleImage" runat="server" />
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="noodleData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [noodle_name], [noodle_id] FROM [noodleTable]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="noodleDataSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO orderTable(order_time, order_userPhone) VALUES (GATDATE(), @order_userPhone)" SelectCommand="SELECT [noodle_qt], [noodle_price] FROM [noodleTable] WHERE ([noodle_id] = @noodle_id)">
            <InsertParameters>
                <asp:SessionParameter Name="order_userPhone" SessionField="phone" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="noodleList" Name="noodle_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="noodleDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="noodleDataSelect" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="noodle_qt" HeaderText="noodle_qt" SortExpression="noodle_qt" />
                <asp:BoundField DataField="noodle_price" HeaderText="noodle_price" SortExpression="noodle_price" />
            </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>
