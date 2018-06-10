<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="TaskControll.TaskList" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /*Here I will add some css for looks good*/
        .myGrid {
            border: 1px solid #ddd;
            margin: 15px;
            -webkit-border-radius: 3px 3px 0 0;
            -moz-border-radius: 3px 3px 0 0;
            border-radius: 3px 3px 0 0;
        }
        .myGrid td {
            vertical-align:top;
        }
        .header {
            overflow: hidden;
            position: relative;
            border-bottom: 1px solid #ddd;
            height: 30px;
        }
 
            .header th {
                color: #222;
                font-weight: normal;
                line-height: 40px;
                text-align: left;
                /* text-shadow: 0 1px #FFFFFF; */
                white-space: nowrap;
                border-right: 1px solid #ddd;
                border-bottom: 2px solid #ddd;
                padding: 0px 15px 0px 15px;
                -webkit-border-radius: 1px;
                -moz-border-radius: 1px;
            }
 
        .trow1 {
            background: #f9f9f9;
        }
 
        .trow2 {
            background: #fff;
        }
 
            .trow1 td, .trow2 td {
                color: #555;
                line-height: 18px;
                padding: 9px 5px;
                text-align: left;
                border-right: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                text-align: left;
                
            }
 
        input[type='text'],select {
            border: 1px solid #b8b8b8;
            border-radius: 3px;
            color: #999999;
            float: left;
            height: 22px;
            padding: 0 5px;
            position: relative;
            width: 185px;            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="myGridview" runat="server" AutoGenerateColumns="false"
            CellPadding="10" CellSpacing="0"
            ShowFooter="true"
            CssClass="myGrid"  HeaderStyle-CssClass="header" RowStyle-CssClass="trow1" 
            AlternatingRowStyle-CssClass="trow2" OnRowCommand="myGridview_RowCommand">
 
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>Наименование</HeaderTemplate>
                    <ItemTemplate><%#Eval("name") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCN" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtName">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Ответственный</HeaderTemplate>
                    <ItemTemplate><%#Eval("responsible") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtResponsible" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCR" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtResponsible">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Дата</HeaderTemplate>
                    <ItemTemplate><%#Eval("date") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCD" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtDate">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Исполнитель</HeaderTemplate>
                    <ItemTemplate><%#Eval("executor") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtExecutor" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCE" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtExecutor">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Отдел</HeaderTemplate>
                    <ItemTemplate><%#Eval("department") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCDE" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtDepartment">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Отчет</HeaderTemplate>
                    <ItemTemplate><%#Eval("report") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtReport" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCRE" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtReport">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Файл отчета</HeaderTemplate>
                    <ItemTemplate><%#Eval("reportfile") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtReportFile" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCREF" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtReportFile">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Статус</HeaderTemplate>
                    <ItemTemplate><%#Eval("status") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCS" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtStatus">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField>
                    <HeaderTemplate>Country</HeaderTemplate>
                    <ItemTemplate><%#Eval("CountryName") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddCountry_SelectedIndexChanged">
                            <asp:ListItem Text="Select Country" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="rfC" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="ddCountry" InitialValue="0">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit">Редактировать</asp:LinkButton>
                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete">Удалить</asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnInsert" runat="server" Text="Сохранить" CommandName="Insert" ValidationGroup="Add" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
 
        </asp:GridView>
    </div>
    </form>
</body>
</html>
