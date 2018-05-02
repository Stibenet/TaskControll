<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FXDPlan.aspx.cs" Inherits="TaskControll._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Поиск"></asp:Label>
    &nbsp;<asp:TextBox ID="tbSearch" runat="server" Width="347px"></asp:TextBox>
    <asp:Button ID="bSearch" runat="server" Text="Найти" />
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Text="Добавить" Width="150px" />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Экспорт в Excel" OnClick="Button1_Click" Width="150px" />
&nbsp;<asp:Button ID="Button4" runat="server" Text="Экспорт в Word" Width="150px" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellSpacing="10">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="Наименование" />
            <asp:BoundField DataField="sum" HeaderText="Стоимость" />
            <asp:BoundField DataField="date" HeaderText="Дата" />
            <asp:BoundField DataField="executor" HeaderText="Исполнитель" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" PostBackUrl="~/FXDPlanEdit.aspx" runat="server">Редактировать | </asp:LinkButton>  
                    <asp:LinkButton ID="lbDelete" runat="server">Удалить</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>    
    <asp:Label ID="lNotSelect" runat="server" Text="Вы не выбрали строки для экспорта"></asp:Label>
    <br />
    
</asp:Content>
