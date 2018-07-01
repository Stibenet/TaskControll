using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskControll
{
    public partial class auth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //avs1111-dir
        //admin-admin
        //iam2222-rectorate
        //tbm3333-worker
        protected void Button1_Click(object sender, EventArgs e)
        {
            using (MyDatabaseEntities db = new MyDatabaseEntities())
            {
                try{
                    var userLogin = (from u in db.auths
                                     where u.login == Login1.Text
                                     select u).ToArray();
                    var userPass = (from u in db.auths
                                    where u.pass == Password1.Text
                                    select u).ToArray();

                    if (Login1.Text == userLogin[0].login)
                    {
                        if (Password1.Text == userPass[0].pass)
                        {
                            if (Login1.Text == "avs1111")
                            {
                                Response.Redirect("/TasksListDir.aspx");
                            }
                            else if (Login1.Text == "admin")
                            {
                                Response.Redirect("/adm.aspx");
                            }
                            else if (Login1.Text == "iam2222")
                            {
                                Response.Redirect("/TasksList.aspx");
                            }
                            else if (Login1.Text == "tbm3333")
                            {
                                Response.Redirect("/TasksListWor.aspx");
                            }
                        }
                        else
                        {
                            Label1.Text = "Ошибка авторизации!";
                        }
                    }
                    else
                    {
                        Label1.Text = "Ошибка авторизации!";
                    }
                }catch (SystemException y)
                {
                    Label1.Text = "Ошибка авторизации!";
                }
            }
        }
    }
}