using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskControll
{
    public partial class TaskList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateData();
            }
        }

        private void PopulateData()
        {
            //List<FXDPlan> allContacts = null;
            //using (MyDatabaseEntities dc = new MyDatabaseEntities())
            //{
            //    var tasks = (from a in dc.FXDPlans                            
            //                 select new
            //                 {
            //                     a                                 
            //                 });
            //    if (tasks != null)
            //    {
            //        allContacts = new List<FXDPlan>();
            //        //foreach (var i in tasks)
            //        //{
            //        //    FXDPlan c = i.a;
            //        //    c.name;
            //        //    c.StateName = i.StateName;
            //        //    allContacts.Add(c);
            //        //}
            //    }

            //    if (allContacts == null || allContacts.Count == 0)
            //    {
            //        //trick to show footer when there is no data in the gridview
            //        allContacts.Add(new FXDPlan());
            //        myGridview.DataSource = allContacts;
            //        myGridview.DataBind();
            //        //myGridview.Rows[0].Visible = false;
            //        //myGridview.Rows[7].Visible = false;
            //    }
            //    else
            //    {
            //        myGridview.DataSource = allContacts;
            //        myGridview.DataBind();
            //    }                                
            //}
            using (MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                myGridview.DataSource = dc.FXDPlans.
                    OrderBy(a => a.name).
                    ThenBy(a => a.responsible).
                    ThenBy(a => a.date).
                    ThenBy(a => a.executor).
                    ThenBy(a => a.department).
                    ThenBy(a => a.report).
                    ThenBy(a => a.reportfile).
                    ThenBy(a => a.status).
                    ToList();
                myGridview.DataBind();
            }
        }

        protected void myGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Insert new task
            if (e.CommandName == "Insert")
            {
                Page.Validate("Add");
                if (Page.IsValid)
                {
                    DateTime thisDate = DateTime.Today;
                    var fRow = myGridview.FooterRow;

                    //TextBox for entering data
                    TextBox txtName = (TextBox)fRow.FindControl("txtName");
                    TextBox txtResponsible = (TextBox)fRow.FindControl("txtResponsible");                    
                    //TextBox txtDate = (TextBox)fRow.FindControl("txtDate");
                    TextBox txtExecutor = (TextBox)fRow.FindControl("txtExecutor");
                    TextBox txtDepartment = (TextBox)fRow.FindControl("txtDepartment");
                    TextBox txtReport = (TextBox)fRow.FindControl("txtReport");
                    TextBox txtReportFile = (TextBox)fRow.FindControl("txtReportFile");
                    TextBox txtStatus = (TextBox)fRow.FindControl("txtStatus");
                    
                    //connect to DB
                    using (MyDatabaseEntities dc = new MyDatabaseEntities())
                    {            
                        //insert data from TextBox
                        dc.FXDPlans.Add(new FXDPlan
                        {
                            name = txtName.Text.Trim(),
                            responsible = txtResponsible.Text.Trim(),
                            executor = txtExecutor.Text.Trim(),
                            department = txtDepartment.Text.Trim(),
                            report = txtReport.Text.Trim(),                            
                        });
                        //save changes
                        dc.SaveChanges();
                        PopulateData();
                    }
                }
            }
        }

    }
}