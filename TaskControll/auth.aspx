﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="auth.aspx.cs" Inherits="TaskControll.auth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; height: 385px;">
           <tr>
               <td style="height: 62px; width: 148px"></td>
               <td style="height: 62px; width: 1034px">
                   <h1>Авторизация в системе</h1>
               </td>
               <td style="height: 62px"></td>
           </tr>
           <tr>
               <td style="width: 148px; height: 327px"></td>
               <td aria-readonly="False">
                   <table class="nav-justified">
                       <tr>
                           <td style="width: 208px">Логин</td>
                           <td>
                               <asp:TextBox ID="Login1" runat="server" Width="415px"></asp:TextBox> 
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td style="width: 208px">Пароль</td>
                           <td>                               
                               <asp:TextBox ID="Password1" runat="server" Width="415px"></asp:TextBox>
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                    </table>
                   <br />
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF0066"></asp:Label>
                    <br />
                   <br />
                    <asp:Button ID="Button1" runat="server" Text="Войти" Width="120px" OnClick="Button1_Click" />
                    <br />
                </td>
               </tr>
        </table>
        

</asp:Content>
