using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Collections;

namespace TaskControll
{
    public partial class TasksList : System.Web.UI.Page
    {
        string connectString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Malkollm\Documents\GIT\TaskControll\TaskControll\App_Data\FXDPlan.mdf;
            Integrated Security = True; MultipleActiveResultSets=True;Application Name = EntityFramework";

        protected void Page_Load(object sender, EventArgs e)
        {
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

            try
            {
                if (e.CommandName.Equals("Check"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectString))
                    {
                        sqlCon.Open();
                        string query = "SELECT name FROM FXDPlan";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@name", (myGridview.FooterRow.FindControl("txtNameT") as TextBox).Text.Trim());
                        
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
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



        //private void ExportGrid(string fileName, string contenttype)
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
        //    Response.Charset = "";
        //    Response.ContentType = contenttype;
        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);

        //    myGridview.RenderControl(hw);
        //    Response.Output.Write(sw.ToString());
        //    Response.Flush();
        //    Response.Close();
        //    Response.End();
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            ////ExportGrid("GridviewData.doc", "application/vnd.ms-word");
            ////Export selected rows to Excel
            ////need to check is any row selected

            //bool isSelected = false;
            //foreach (GridViewRow i in myGridview.Rows)
            //{
            //    CheckBox cb = (CheckBox)i.FindControl("chkSelect");
            //    if (cb != null && cb.Checked)
            //    {
            //        isSelected = true;
            //        break;
            //    }
            //}

            ////export here
            //if (isSelected)
            //{
            //    GridView gvExport = myGridview;

            //    //this bellow line for not export to Excel
            //    gvExport.Columns[0].Visible = false;
            //    gvExport.Columns[6].Visible = false;
            //    gvExport.Columns[7].Visible = false;
            //    foreach (GridViewRow i in myGridview.Rows)
            //    {
            //        gvExport.Rows[i.RowIndex].Visible = false;
            //        CheckBox cb = (CheckBox)i.FindControl("chkSelect");
            //        if (cb != null && cb.Checked)
            //        {
            //            gvExport.Rows[i.RowIndex].Visible = true;
            //        }
            //    }
            //    Response.Clear();
            //    Response.Buffer = true;
            //    Response.AddHeader("content-disposition", "attachment;filename=ExportGridData.xls");
            //    Response.Charset = "";
            //    Response.ContentType = "application/vnd.ms-excel";
            //    StringWriter sw = new StringWriter();
            //    HtmlTextWriter htW = new HtmlTextWriter(sw);
            //    gvExport.RenderControl(htW);
            //    Response.Output.Write(sw.ToString());
            //    Response.End();
            //}


            Response.AddHeader("content-disposition", "attachment;filename=ExportGridData.xls");
            Response.ContentType = "application/vnd.ms-excel";
            using(StringWriter sw = new StringWriter())
            {
                HtmlTextWriter htW = new HtmlTextWriter(sw);
                myGridview.AllowPaging = false;
                myGridview.RenderControl(htW);
                string style = @"<style> .textmode { mso-number-format:\@; } </style>";
                Response.Write(style);
                Response.Output.Write(sw);
                Response.Flush();
                Response.Close();
                Response.End();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //this is added for error : GridView must be placed inside a form tag with runat=server
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            //Export selected rows to Word
            //need to check is any row selected

            bool isSelected = false;
            foreach (GridViewRow i in myGridview.Rows)
            {
                CheckBox cb = (CheckBox)i.FindControl("chkSelect");
                if (cb != null && cb.Checked)
                {
                    isSelected = true;
                    break;
                }
            }

            //export here
            if (isSelected)
            {
                GridView gvExport = myGridview;

                //this bellow line for not export to Excel
                gvExport.Columns[0].Visible = false;
                gvExport.Columns[6].Visible = false;
                gvExport.Columns[7].Visible = false;
                foreach (GridViewRow i in myGridview.Rows)
                {
                    gvExport.Rows[i.RowIndex].Visible = false;
                    CheckBox cb = (CheckBox)i.FindControl("chkSelect");
                    if (cb != null && cb.Checked)
                    {
                        gvExport.Rows[i.RowIndex].Visible = true;
                    }
                }
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=FXDPlanTasks.doc");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-word";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htW = new HtmlTextWriter(sw);
                gvExport.RenderControl(htW);
                Response.Output.Write(sw.ToString());
                Response.End();
            }
        }
    }
}
