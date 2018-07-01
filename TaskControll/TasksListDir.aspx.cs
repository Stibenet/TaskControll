using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskControll
{
    public partial class TasksListDir : System.Web.UI.Page
    {
        string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Malkollm\Documents\GIT\TaskControll\TaskControll\App_Data\FXDPlan.mdf;
            Integrated Security = True; MultipleActiveResultSets=True;Application Name = EntityFramework";



        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM FXDPlan", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                myGridview.DataSource = dtbl;
                myGridview.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                myGridview.DataSource = dtbl;
                myGridview.DataBind();
                myGridview.Rows[0].Cells.Clear();
                myGridview.Rows[0].Cells.Add(new TableCell());
                myGridview.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                myGridview.Rows[0].Cells[0].Text = "Данные не найдены ...";
                myGridview.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void myGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO FXDPlan (name, responsible, executor, department, report) VALUES (@name, @responsible, @executor, @department, @report)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@name", (myGridview.FooterRow.FindControl("txtNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@responsible", (myGridview.FooterRow.FindControl("txtResponsibleFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@executor", (myGridview.FooterRow.FindControl("txtExecutorFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@department", (myGridview.FooterRow.FindControl("txtDepartmentFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@report", (myGridview.FooterRow.FindControl("txtReportFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            //try
            //{
            //    if (e.CommandName.Equals("Check"))
            //    {
            //        using (SqlConnection sqlCon = new SqlConnection(connectString))
            //        {
            //            sqlCon.Open();
            //            string query = "SELECT name FROM FXDPlan";
            //            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            //            sqlCmd.Parameters.AddWithValue("@name", (myGridview.FooterRow.FindControl("txtNameT") as TextBox).Text.Trim());

            //            sqlCmd.ExecuteNonQuery();
            //            PopulateGridview();
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine(ex.Message);
            //}
        }

        protected void myGridview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            myGridview.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        //protected void myGridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    myGridview.EditIndex = -1;
        //    PopulateGridview();
        //}

        protected void myGridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectString))
                {
                    sqlCon.Open();
                    string query = "UPDATE FXDPlan SET name=@name, responsible=@responsible, executor=@executor, department=@department, report=@report WHERE Id=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@name", (myGridview.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@responsible", (myGridview.Rows[e.RowIndex].FindControl("txtResponsible") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@executor", (myGridview.Rows[e.RowIndex].FindControl("txtExecutor") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@department", (myGridview.Rows[e.RowIndex].FindControl("txtDepartment") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@report", (myGridview.Rows[e.RowIndex].FindControl("txtReport") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(myGridview.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    myGridview.EditIndex = -1;
                    PopulateGridview();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void myGridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM FXDPlan WHERE Id=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(myGridview.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
    }
}
