<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TasksList.aspx.cs" Inherits="TaskControll.TasksList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

    <html>
    <head>
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
                    vertical-align: top;
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

            input[type='text'], select {
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
        <div align="center">
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label">ВЫ МОЖЕТЕ ЭКСПОРТИРОВАТЬ ДАННЫЕ</asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Экспорт в Excel" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Экспорт в Word" OnClick="Button2_Click" />
<%--            <form id="form1">--%>
                <div>
                    <asp:GridView ID="myGridview" runat="server" AutoGenerateColumns="false"
                        CellPadding="10" CellSpacing="0"
                        ShowFooter="true"
                        DataKeyNames="Id"
                        CssClass="myGrid" HeaderStyle-CssClass="header" RowStyle-CssClass="trow1"
                        AlternatingRowStyle-CssClass="trow2" OnRowCommand="myGridview_RowCommand" OnRowEditing="myGridview_RowEditing" OnRowCancelingEdit="myGridview_RowCancelingEdit" OnRowDeleting="myGridview_RowDeleting" OnRowUpdating="myGridview_RowUpdating">

                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Наименование</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("name") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%#Bind("name") %>' />
                                    <asp:RequiredFieldValidator ID="rfCNEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtName">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNameFooter" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCN" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtNameFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Ответственный</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("responsible") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtResponsible" runat="server" Text='<%#Bind("responsible") %>' />
                                    <asp:RequiredFieldValidator ID="rfCREdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtResponsible">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtResponsibleFooter" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCR" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtResponsibleFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <%--                <asp:TemplateField>
                    <HeaderTemplate>Дата</HeaderTemplate>
                    <ItemTemplate><%#Eval("date") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDate" runat="server" Text='<%#Bind("date") %>' />
                        <asp:RequiredFieldValidator ID="rfCDEdit" runat="server" ErrorMessage="*"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtDate">Required</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCD" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtDate">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>--%>
                            <asp:TemplateField>
                                <HeaderTemplate>Исполнитель</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("executor") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtExecutor" runat="server" Text='<%#Bind("executor") %>' />
                                    <asp:RequiredFieldValidator ID="rfCEEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtExecutor">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtExecutorFooter" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCE" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtExecutorFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Отдел</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("department") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDepartment" runat="server" Text='<%#Bind("department") %>' />
                                    <asp:RequiredFieldValidator ID="rfCDEEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtDepartment">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDepartmentFooter" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCDE" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtDepartmentFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Отчет</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("report") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtReport" runat="server" Text='<%#Bind("report") %>' />
                                    <asp:RequiredFieldValidator ID="rfCREEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtReport">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtReportFooter" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCRE" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtReportFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <%--                <asp:TemplateField>
                    <HeaderTemplate>Файл отчета</HeaderTemplate>
                    <ItemTemplate><%#Eval("reportfile") %></ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtReportFile" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCREF" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtReportFile">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>--%>
                            <%--<asp:TemplateField>
                    <HeaderTemplate>Статус</HeaderTemplate>
                    <ItemTemplate><%#Eval("status") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStatus" runat="server" Text='<%#Bind("status") %>' />
                        <asp:RequiredFieldValidator ID="rfCSEdit" runat="server" ErrorMessage="*"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtStatus">Required</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfCS" runat="server" ErrorMessage="*"
                            ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtStatus">Required</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>--%>
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
                                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit" ToolTip="Edit">Редактировать</asp:LinkButton>
                                    &nbsp;|&nbsp;
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" ToolTip="Delete" OnClientClick="return confirm('Вы уверены?')">Удалить</asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Update" ToolTip="Update" ValidationGroup="edit">Обновить</asp:LinkButton>
                                    &nbsp;|&nbsp;
                        <asp:LinkButton ID="lbCansel" runat="server" CommandName="Cansel" ToolTip="Cansel">Отменить</asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="btnInsert" runat="server" Text="Сохранить" CommandName="AddNew" ToolTip="Add New" ValidationGroup="Add" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </div>
<%--            </form>--%>
    </body>
    </html>
    </div>
</asp:Content>
