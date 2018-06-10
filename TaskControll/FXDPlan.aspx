<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FXDPlan.aspx.cs" Inherits="TaskControll._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div align="center">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Поиск"></asp:Label>
    &nbsp;
        <asp:TextBox ID="TextBox1" runat="server" ForeColor="#CCCCCC" Width="780px">Воспользуйтесь поиском, например: Закупка ПО </asp:TextBox>
    &nbsp;<asp:Button ID="bSearch" runat="server" Text="Найти" />
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Text="Добавить" Width="150px" PostBackUrl="~/FXDPlanAdd.aspx" />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Экспорт в Excel" OnClick="Button1_Click" Width="150px" />
&nbsp;<asp:Button ID="bExportWord" runat="server" Text="Экспорт в Word" Width="150px" OnClick="bExportWord_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellSpacing="10">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="Наименование" />
            <asp:BoundField DataField="responsible" HeaderText="Ответственный" />
            <asp:BoundField DataField="date" HeaderText="Дата" />
            <asp:BoundField DataField="executor" HeaderText="Исполнитель" />
            <asp:BoundField DataField="department" HeaderText="Отдел" />
            <asp:BoundField DataField="report" HeaderText="Отчет" />
            <asp:BoundField DataField="reportfile" HeaderText="Файл отчета" />
            <asp:BoundField DataField="status" HeaderText="Статус" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" PostBackUrl="~/FXDPlanEdit.aspx" runat="server">Редактировать | </asp:LinkButton>  
                    <asp:LinkButton ID="lbDelete" runat="server">Удалить</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>    
    <br />
    <asp:Label ID="lNotSelect" runat="server" Text="Вы не выбрали строки для экспорта"></asp:Label>
    </div>
    <br />
    
</asp:Content>
