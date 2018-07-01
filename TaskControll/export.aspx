<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="export.aspx.cs" Inherits="TaskControll.export" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="responsible" HeaderText="responsible" SortExpression="responsible" />
                    <asp:BoundField DataField="executor" HeaderText="executor" SortExpression="executor" />
                    <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
                    <asp:BoundField DataField="report" HeaderText="report" SortExpression="report" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [responsible], [executor], [department], [report] FROM [ListTasks]"></asp:SqlDataSource>
        </div>
        <%--<div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" /></div>--%>
    </form>
</body>
</html>
