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
            <br />
            <asp:Button ID="Button1" runat="server" Text="Экспортировать все в Word" OnClick="Button1_Click" />
            &nbsp;<asp:Button ID="Button2" runat="server" Text="Экспортировать все в Excel" OnClick="Button2_Click" />
            </div>

                    <div align="center">
                        <br />
                        <br />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Сортировка по наименованию</asp:ListItem>
                            <asp:ListItem>Сортировка по статусу</asp:ListItem>                                                         
                        </asp:RadioButtonList>
                    </div>
        
                    <asp:GridView ID="myGridview" runat="server" AutoGenerateColumns="False"
                        CellPadding="10"
                        ShowFooter="True"
                        DataKeyNames="Id"
                        CssClass="myGrid" HeaderStyle-CssClass="header" RowStyle-CssClass="trow1"
                        AlternatingRowStyle-CssClass="trow2" OnRowCommand="myGridview_RowCommand" OnRowEditing="myGridview_RowEditing" OnRowDeleting="myGridview_RowDeleting" OnRowUpdating="myGridview_RowUpdating">

                    <AlternatingRowStyle CssClass="trow2"></AlternatingRowStyle>

                        <Columns>
<%--                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField>
                                <HeaderTemplate>Наименование</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("name") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server"  Height="40px" Width="250px" TextMode="MultiLine" Text='<%#Bind("name") %>' />
                                    <asp:RequiredFieldValidator ID="rfCNEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtName">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNameFooter" runat="server" Height="40px" Width="250px" TextMode="MultiLine"></asp:TextBox><br />
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
                                    <asp:TextBox ID="txtResponsible" runat="server"  Height="40px" Width="250px" TextMode="MultiLine" Text='<%#Bind("responsible") %>' />
                                    <asp:RequiredFieldValidator ID="rfCREdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtResponsible">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtResponsibleFooter" runat="server" Height="40px" Width="250px" TextMode="MultiLine"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCR" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtResponsibleFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Исполнитель</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("executor") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtExecutor" runat="server"  Height="40px" Width="250px" TextMode="MultiLine" Text='<%#Bind("executor") %>' />
                                    <asp:RequiredFieldValidator ID="rfCEEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtExecutor">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtExecutorFooter" runat="server" Height="40px" Width="250px" TextMode="MultiLine"></asp:TextBox><br />
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
                                    <asp:TextBox ID="txtDepartment" runat="server"  Height="40px" Width="250px" TextMode="MultiLine" Text='<%#Bind("department") %>' />
                                    <asp:RequiredFieldValidator ID="rfCDEEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtDepartment">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDepartmentFooter" runat="server" Height="40px" Width="250px" TextMode="MultiLine"></asp:TextBox><br />
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
                                    <asp:TextBox ID="txtReport" runat="server" Height="120px" Width="270px" TextMode="MultiLine" Text='<%#Bind("report") %>' />
                                    <asp:RequiredFieldValidator ID="rfCREEdit" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtReport">Required</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtReportFooter" runat="server" Height="120px" Width="270px" TextMode="MultiLine"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="rfCRE" runat="server" ErrorMessage="*"
                                        ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtReportFooter">Required</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Статус задачи</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("status") %>' runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Утверждено</asp:ListItem>
                                        <asp:ListItem>Отказано</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit" ToolTip="Edit">Редактировать</asp:LinkButton>
                                    &nbsp;|&nbsp;
                                    <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" ToolTip="Delete" OnClientClick="return confirm('Вы уверены?')">Удалить</asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Update" ToolTip="Update" ValidationGroup="edit">Обновить</asp:LinkButton>
                                 
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="btnInsert" runat="server" Text="Добавить" CommandName="AddNew" ToolTip="Add New" ValidationGroup="Add" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>

                    <HeaderStyle CssClass="header"></HeaderStyle>

                    <RowStyle CssClass="trow1"></RowStyle>

                    </asp:GridView>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Наименование" SortExpression="name" />
                <asp:BoundField DataField="responsible" HeaderText="Ответственный" SortExpression="responsible" />
                <asp:BoundField DataField="executor" HeaderText="Исполнитель" SortExpression="executor" />
                <asp:BoundField DataField="department" HeaderText="Отдел" SortExpression="department" />
                <asp:BoundField DataField="report" HeaderText="Доклад" SortExpression="report" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [responsible], [executor], [department], [report] FROM [FXDPlan]"></asp:SqlDataSource>
            <br />
    </body>
</html>

</asp:Content>
