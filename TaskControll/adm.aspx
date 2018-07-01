<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adm.aspx.cs" Inherits="TaskControll.adm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 23px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 310px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 714px">&nbsp;</td>
            <td>&nbsp;<a runat="server" href="~/auth">Выйти</a></td>
        </tr>
    </table>
    <h1>Панель администратора</h1>   
    <table class="nav-justified">
        <tr>           
            <td>Пользователь</td>
            <td>Установить</td>
            <td>Роль</td>
        </tr>
        <tr>
            <td style="height: 62px"><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="login" DataValueField="login">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [login] FROM [auths]"></asp:SqlDataSource>
            </td>
            <td style="height: 62px"></td>
            <td style="height: 62px"><asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="role" DataValueField="role">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [role] FROM [auths]"></asp:SqlDataSource>
            </td>
            <td style="height: 62px">
                <asp:Button ID="Button1" runat="server" Text="Установить" Width="100px" />
            </td>
        </tr>
    </table>
    <h3>Перейти к списку задач: </h3><asp:Button ID="Button3" runat="server" PostBackUrl="~/TasksList.aspx" Text="Перейти" />
</asp:Content>
