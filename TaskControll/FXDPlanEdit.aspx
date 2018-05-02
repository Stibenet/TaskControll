<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FXDPlanEdit.aspx.cs" Inherits="TaskControll.FXDPlanEdit" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="accountInfo">
        <fieldset class="register">
            <legend>Редактирование задачи</legend>
            <p>
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Наименование</asp:Label>
                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Стоимость</asp:Label>
                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="UserName">Дата</asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="textEntry"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">Исполнитель</asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="textEntry"></asp:TextBox>
                <br />
            </p>
            <p>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="UserName">Договор</asp:Label>
                
                <br />
            </p>
            <h1>Согласование задачи</h1>
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                <asp:ListItem>Исполнитель 1</asp:ListItem>
                <asp:ListItem>Исполнитель 2</asp:ListItem>
                <asp:ListItem>Исполнитель 3</asp:ListItem>
                <asp:ListItem>Руководитель</asp:ListItem>
            </asp:CheckBoxList>
            <br />

        </fieldset>
        <p class="submitButton">
            <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" 
                Text="Редактировать" ValidationGroup="RegisterUserValidationGroup" />
        </p>
    </div>
</asp:Content>
