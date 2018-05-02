using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskControll
{
    public partial class _Default : Page
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
            using(MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                GridView1.DataSource = dc.FXDPlans.OrderBy(a => a.name).ThenBy(a => a.sum).ThenBy(a => a.date).ThenBy(a => a.executor).ToList();
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Export selected rows to Excel
            //need to check is any row selected

            bool isSelected = false;
            foreach(GridViewRow i in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)i.FindControl("chkSelect");
                if(cb != null && cb.Checked)
                {
                    isSelected = true;
                    break;
                }
            }

            //export here
            if (isSelected)
            {
                GridView gvExport = GridView1;
                
                //this bellow line for not export to Excel
                gvExport.Columns[0].Visible = false;
                gvExport.Columns[5].Visible = false;
                foreach (GridViewRow i in GridView1.Rows)
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
                Response.AddHeader("content-disposition", "attachment;filename=ExportGridData.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htW = new HtmlTextWriter(sw);
                gvExport.RenderControl(htW);
                Response.Output.Write(sw.ToString());
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //this is added for error : GridView must be placed inside a form tag with runat=server
        }
    }
}