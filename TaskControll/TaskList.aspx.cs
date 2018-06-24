//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data.SqlClient;
//using System.Data;
//using System.IO;

//namespace TaskControll
//{
//    public partial class TaskList : System.Web.UI.Page
//    {
//        //    protected void Page_Load(object sender, EventArgs e)
//        //    {
//        //        if (!IsPostBack)
//        //        {
//        //            PopulateData();
//        //        }
//        //    }

//        //    private void PopulateData()
//        //    {
//        //        //List<FXDPlan> allContacts = null;
//        //        //using (MyDatabaseEntities dc = new MyDatabaseEntities())
//        //        //{
//        //        //    var tasks = (from a in dc.FXDPlans                            
//        //        //                 select new
//        //        //                 {
//        //        //                     a                                 
//        //        //                 });
//        //        //    if (tasks != null)
//        //        //    {
//        //        //        allContacts = new List<FXDPlan>();
//        //        //        //foreach (var i in tasks)
//        //        //        //{
//        //        //        //    FXDPlan c = i.a;
//        //        //        //    c.name;
//        //        //        //    c.StateName = i.StateName;
//        //        //        //    allContacts.Add(c);
//        //        //        //}
//        //        //    }

//        //        //    if (allContacts == null || allContacts.Count == 0)
//        //        //    {
//        //        //        //trick to show footer when there is no data in the gridview
//        //        //        allContacts.Add(new FXDPlan());
//        //        //        myGridview.DataSource = allContacts;
//        //        //        myGridview.DataBind();
//        //        //        //myGridview.Rows[0].Visible = false;
//        //        //        //myGridview.Rows[7].Visible = false;
//        //        //    }
//        //        //    else
//        //        //    {
//        //        //        myGridview.DataSource = allContacts;
//        //        //        myGridview.DataBind();
//        //        //    }                                
//        //        //}
//        //        using (MyDatabaseEntities dc = new MyDatabaseEntities())
//        //        {
//        //            myGridview.DataSource = dc.FXDPlans.
//        //                OrderBy(a => a.name).
//        //                ThenBy(a => a.responsible).
//        //                //ThenBy(a => a.date).
//        //                ThenBy(a => a.executor).
//        //                ThenBy(a => a.department).
//        //                ThenBy(a => a.report).
//        //                //ThenBy(a => a.reportfile).
//        //                //ThenBy(a => a.status).
//        //                ToList();
//        //            myGridview.DataBind();
//        //        }
//        //    }

//        //    protected void myGridview_RowCommand(object sender, GridViewCommandEventArgs e)
//        //    {
//        //        //Insert new task
//        //        if (e.CommandName == "Insert")
//        //        {
//        //            Page.Validate("Add");
//        //            if (Page.IsValid)
//        //            {
//        //                DateTime thisDate = DateTime.Today;
//        //                var fRow = myGridview.FooterRow;

//        //                //TextBox for entering data
//        //                TextBox txtName = (TextBox)fRow.FindControl("txtName");
//        //                TextBox txtResponsible = (TextBox)fRow.FindControl("txtResponsible");                    
//        //                //TextBox txtDate = (TextBox)fRow.FindControl("txtDate");
//        //                TextBox txtExecutor = (TextBox)fRow.FindControl("txtExecutor");
//        //                TextBox txtDepartment = (TextBox)fRow.FindControl("txtDepartment");
//        //                TextBox txtReport = (TextBox)fRow.FindControl("txtReport");
//        //                //TextBox txtReportFile = (TextBox)fRow.FindControl("txtReportFile");
//        //                //TextBox txtStatus = (TextBox)fRow.FindControl("txtStatus");

//        //                //connect to DB
//        //                using (MyDatabaseEntities dc = new MyDatabaseEntities())
//        //                {            
//        //                    //insert data from TextBox
//        //                    dc.FXDPlans.Add(new FXDPlan
//        //                    {
//        //                        name = txtName.Text.Trim(),
//        //                        responsible = txtResponsible.Text.Trim(),
//        //                        executor = txtExecutor.Text.Trim(),
//        //                        department = txtDepartment.Text.Trim(),
//        //                        report = txtReport.Text.Trim(),                            
//        //                    });
//        //                    //save changes
//        //                    dc.SaveChanges();
//        //                    PopulateData();
//        //                }
//        //            }
//        //        }
//        //    }

//        //    protected void myGridview_RowEditing(object sender, GridViewEditEventArgs e)
//        //    {
//        //        //Open Edit Mode
//        //        myGridview.EditIndex = e.NewEditIndex;
//        //        PopulateData();
//        //    }

//        //    protected void myGridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
//        //    {
//        //        //Cancel Edit Mode 
//        //        myGridview.EditIndex = -1;
//        //        PopulateData();
//        //    }

//        //    protected void myGridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
//        //    {
//        //        //Validate Page
//        //        Page.Validate("edit");
//        //        if (!Page.IsValid)
//        //        {
//        //            return;
//        //        }

//        //        //Get Contact ID
//        //        int contactID = (int)myGridview.DataKeys[e.RowIndex]["Id"];

//        //        //myGridview.Columns[5].Visible = false;
//        //        //Find Controls 
//        //        TextBox txtName = (TextBox)myGridview.Rows[e.RowIndex].FindControl("txtName");
//        //        TextBox txtResponsible = (TextBox)myGridview.Rows[e.RowIndex].FindControl("txtResponsible");
//        //        TextBox txtExecutor = (TextBox)myGridview.Rows[e.RowIndex].FindControl("txtExecutor");
//        //        TextBox txtDepartment = (TextBox)myGridview.Rows[e.RowIndex].FindControl("txtDepartment");
//        //        TextBox txtReport = (TextBox)myGridview.Rows[e.RowIndex].FindControl("txtReport");
//        //        //TextBox txtStatus = (TextBox)myGridview.Rows[e.RowIndex].FindControl("txtStatus");
//        //        //Get Values (updated) and Save to database

//        //        using (MyDatabaseEntities dc = new MyDatabaseEntities())
//        //        {
//        //            var v = dc.FXDPlans.Where(a => a.Id.Equals(contactID)).FirstOrDefault();
//        //            if (v != null)
//        //            {
//        //                v.name = txtName.Text.Trim();
//        //                v.responsible = txtResponsible.Text.Trim();
//        //                v.executor = txtExecutor.Text.Trim();
//        //                v.department = txtDepartment.Text.Trim();
//        //                v.report = txtReport.Text.Trim();
//        //                //v.status = txtStatus.Text.Trim();
//        //            }
//        //            dc.SaveChanges();
//        //            myGridview.EditIndex = -1;
//        //            PopulateData();
//        //        }
//        //    }

//        //    protected void myGridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
//        //    {
//        //        int contactID = (int)myGridview.DataKeys[e.RowIndex]["Id"];
//        //        using (MyDatabaseEntities dc = new MyDatabaseEntities())
//        //        {
//        //            var v = dc.FXDPlans.Where(a => a.Id.Equals(contactID)).FirstOrDefault();
//        //            if (v != null)
//        //            {
//        //                dc.FXDPlans.Remove(v);
//        //                dc.SaveChanges();
//        //                PopulateData();
//        //            }
//        //        }
//        //    }
//        //}

//        string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Malkollm\Documents\GIT\TaskControll\TaskControll\App_Data\FXDPlan.mdf;
//            Integrated Security = True; MultipleActiveResultSets=True;Application Name = EntityFramework";

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                PopulateGridview();
//            }
//        }

//        void PopulateGridview()
//        {
//            DataTable dtbl = new DataTable();
//            using (SqlConnection sqlCon = new SqlConnection(connectString))
//            {
//                sqlCon.Open();
//                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM FXDPlan", sqlCon);
//                sqlDa.Fill(dtbl);
//            }
//            if (dtbl.Rows.Count > 0)
//            {
//                myGridview.DataSource = dtbl;
//                myGridview.DataBind();
//            }
//            else
//            {
//                dtbl.Rows.Add(dtbl.NewRow());
//                myGridview.DataSource = dtbl;
//                myGridview.DataBind();
//                myGridview.Rows[0].Cells.Clear();
//                myGridview.Rows[0].Cells.Add(new TableCell());
//                myGridview.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
//                myGridview.Rows[0].Cells[0].Text = "Данные не найдены ...";
//                myGridview.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
//            }
//        }

//        protected void myGridview_RowCommand(object sender, GridViewCommandEventArgs e)
//        {
//            try
//            {
//                if (e.CommandName.Equals("AddNew"))
//                {
//                    using (SqlConnection sqlCon = new SqlConnection(connectString))
//                    {
//                        sqlCon.Open();
//                        string query = "INSERT INTO FXDPlan (name, responsible, executor, department, report) VALUES (@name, @responsible, @executor, @department, @report)";
//                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
//                        sqlCmd.Parameters.AddWithValue("@name", (myGridview.FooterRow.FindControl("txtName") as TextBox).Text.Trim());
//                        sqlCmd.Parameters.AddWithValue("@responsible", (myGridview.FooterRow.FindControl("txtResponsible") as TextBox).Text.Trim());
//                        sqlCmd.Parameters.AddWithValue("@executor", (myGridview.FooterRow.FindControl("txtExecutor") as TextBox).Text.Trim());
//                        sqlCmd.Parameters.AddWithValue("@department", (myGridview.FooterRow.FindControl("txtDepartment") as TextBox).Text.Trim());
//                        sqlCmd.Parameters.AddWithValue("@report", (myGridview.FooterRow.FindControl("txtReport") as TextBox).Text.Trim());
//                        sqlCmd.ExecuteNonQuery();
//                        PopulateGridview();
//                    }
//                }
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.Message);
//            }


//        }

//        protected void myGridview_RowEditing(object sender, GridViewEditEventArgs e)
//        {
//            myGridview.EditIndex = e.NewEditIndex;
//            PopulateGridview();
//        }

//        protected void myGridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
//        {
//            myGridview.EditIndex = -1;
//            PopulateGridview();
//        }

//        protected void myGridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
//        {
//            try
//            {
//                using (SqlConnection sqlCon = new SqlConnection(connectString))
//                {
//                    sqlCon.Open();
//                    string query = "UPDATE FXDPlan SET name=@name, responsible=@responsible, executor=@executor, department=@department, report=@report WHERE Id=@id";
//                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
//                    sqlCmd.Parameters.AddWithValue("@name", (myGridview.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim());
//                    sqlCmd.Parameters.AddWithValue("@responsible", (myGridview.Rows[e.RowIndex].FindControl("txtResponsible") as TextBox).Text.Trim());
//                    sqlCmd.Parameters.AddWithValue("@executor", (myGridview.Rows[e.RowIndex].FindControl("txtExecutor") as TextBox).Text.Trim());
//                    sqlCmd.Parameters.AddWithValue("@department", (myGridview.Rows[e.RowIndex].FindControl("txtDepartment") as TextBox).Text.Trim());
//                    sqlCmd.Parameters.AddWithValue("@report", (myGridview.Rows[e.RowIndex].FindControl("txtReport") as TextBox).Text.Trim());
//                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(myGridview.DataKeys[e.RowIndex].Value.ToString()));
//                    sqlCmd.ExecuteNonQuery();
//                    myGridview.EditIndex = -1;
//                    PopulateGridview();
//                }
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.Message);
//            }
//        }

//        protected void myGridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
//        {
//            try
//            {
//                using (SqlConnection sqlCon = new SqlConnection(connectString))
//                {
//                    sqlCon.Open();
//                    string query = "DELETE FROM FXDPlan WHERE Id=@id";
//                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
//                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(myGridview.DataKeys[e.RowIndex].Value.ToString()));
//                    sqlCmd.ExecuteNonQuery();
//                    PopulateGridview();
//                }
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.Message);
//            }
//        }  
//    }
//}