<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TaskControll.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2 align="center">
        ВЫБЕРИТЕ НЕОБХОДИМЫЙ РАЗДЕЛ
        </h2>
        <br />
    <div align="center">
    <div align="center" style="padding: 15px; margin: 15px; width: 312px;">
        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="3px" 
            Height="92px" ReadOnly="True" TextMode="MultiLine" Width="133px">ПЛАН ВЫПОЛНЕНИЯ 
ФХД</asp:TextBox><br />
        <asp:Button ID="Button1" runat="server"  PostBackUrl="~/FXDPlan.aspx" Text="Перейти" />
    </div>
    <div align="center" style="padding: 15px; margin: 15px; width: 314px;">
        <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" BorderWidth="3px" 
            Height="92px" ReadOnly="True" TextMode="MultiLine" Width="133px">ПЛАН РАЗРАБОТКИ
ЛНПА</asp:TextBox><br />
        <asp:Button ID="Button2" runat="server" Text="Перейти" />
    </div>
    <div align="center" style="padding: 15px; margin: 15px; width: 316px;">
        <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Solid" BorderWidth="3px" 
            Height="92px" ReadOnly="True" TextMode="MultiLine" Width="133px">ПЛАН РАБОТЫ
ОТДЕЛА</asp:TextBox><br />
        <asp:Button ID="Button3" runat="server" Text="Перейти" />
        </div>
    </div>
</asp:Content>
