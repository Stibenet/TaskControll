<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FXDPlan.aspx.cs" Inherits="TaskControll._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellSpacing="10">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="Name" />
        </Columns>
    </asp:GridView>    
    <br />
    <asp:Button ID="Button1" runat="server" Text="Экспорт в Excel" OnClick="Button1_Click" />
</asp:Content>
