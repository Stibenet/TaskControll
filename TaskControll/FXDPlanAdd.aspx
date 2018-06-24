<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FXDPlanAdd.aspx.cs" Inherits="TaskControll.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <div style="height: 439px">

       <table style="width: 100%; height: 385px;">
           <tr>
               <td style="height: 62px; width: 148px"></td>
               <td style="height: 62px; width: 1034px">
                   <h1>Добавить новую задачу</h1>
               </td>
               <td style="height: 62px"></td>
           </tr>
           <tr>
               <td style="width: 148px; height: 327px"></td>
               <td style="width: 1034px; height: 327px" aria-readonly="False">
                   <table class="nav-justified">
                       <tr>
                           <td style="width: 208px">Наименование</td>
                           <td>
                               <asp:TextBox ID="TextBox1" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Ответственный</td>
                           <td>
                               <asp:TextBox ID="TextBox2" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Дата</td>
                           <td>
                               <asp:TextBox ID="TextBox3" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Исполнитель</td>
                           <td>
                               <asp:TextBox ID="TextBox5" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Отдел</td>
                           <td>
                               <asp:TextBox ID="TextBox4" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Отчет</td>
                           <td>
                               <asp:TextBox ID="TextBox6" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Путь к файлу</td>
                           <td>
                               <asp:TextBox ID="TextBox7" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Статус</td>
                           <td>
                               <asp:TextBox ID="TextBox8" runat="server" Width="418px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
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
