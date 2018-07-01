<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adm.aspx.cs" Inherits="TaskControll.adm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Панель администратора</h1>
    <table style="width: 100%;">
        <tr>           
            <td>Пользователь</td>
            <td>Установить</td>
            <td>Роль</td>
        </tr>
        <tr>
            <td><asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Rect</asp:ListItem>
                <asp:ListItem>GOV</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
            <td><asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Administrator</asp:ListItem>
                <asp:ListItem>Rector</asp:ListItem>
                <asp:ListItem>Visor</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Установить" Width="100px" />
            </td>
        </tr>
        <tr>
            <td><asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Rect</asp:ListItem>
                <asp:ListItem>GOV</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
            <td></td>
            <td><asp:Button ID="Button2" runat="server" Text="Удалить" Width="100px" /></td>
        </tr>
    </table>
</asp:Content>
