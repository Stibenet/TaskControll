<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FXDPlanEdit.aspx.cs" Inherits="TaskControll.FXDPlanEdit" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div style="height: 439px">

       <table style="width: 100%; height: 385px;">
           <tr>
               <td style="height: 62px; width: 148px"></td>
               <td style="height: 62px; width: 1034px">
                   <h1>Редактировать задачу</h1>
               </td>
               <td style="height: 62px"></td>
           </tr>
           <tr>
               <td style="width: 148px; height: 327px"></td>
               <td style="width: 1034px; height: 327px" aria-readonly="False">
                   <table class="nav-justified">
                       <tr>
                           <td style="width: 208px">Наименование</td>
                           <td style="width: 464px">
                               <asp:TextBox ID="TextBox1" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td style="width: 192px">Исполнитель 1</td>
                           <td>
                               <asp:CheckBox ID="CheckBox1" runat="server" Text="Согласовано" />
                           </td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Стоимость</td>
                           <td style="width: 464px">
                               <asp:TextBox ID="TextBox2" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td style="width: 192px">Исполнитель 1</td>
                           <td>
                               <asp:CheckBox ID="CheckBox2" runat="server" Text="Согласовано" />
                           </td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Дата</td>
                           <td style="width: 464px">
                               <asp:TextBox ID="TextBox3" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td style="width: 192px">Исполнитель 1</td>
                           <td>
                               <asp:CheckBox ID="CheckBox3" runat="server" Text="Согласовано" />
                           </td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Исполнитель</td>
                           <td style="width: 464px">
                               <asp:TextBox ID="TextBox5" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td style="width: 192px">Исполнитель 1</td>
                           <td>
                               <asp:CheckBox ID="CheckBox4" runat="server" Text="Согласовано" />
                           </td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Путь к файлу</td>
                           <td style="width: 464px">
                               <asp:TextBox ID="TextBox4" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td style="width: 192px">Руководитель</td>
                           <td>
                               <asp:CheckBox ID="CheckBox5" runat="server" Text="Утверждение" />
                           </td>
                       </tr>
                   </table>
                   <br />
                   <asp:Button ID="Button1" runat="server" Text="Добавить" Width="120px" />
                   <br />
                   <br />
                   <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Text="Вы можете добавить документ"></asp:Label>
                   <br />
                   <br />
                   <asp:Button ID="Button2" runat="server" Text="Загрузить" Width="120px" />
               </td>
               <td style="height: 327px"></td>
           </tr>
           </table>

   </div>
</asp:Content>
