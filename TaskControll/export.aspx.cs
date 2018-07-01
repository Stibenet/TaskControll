using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskControll
{
    public partial class export : System.Web.UI.Page
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
            using (MyDatabaseEntities dc = new MyDatabaseEntities())
            {
                GridView1.DataSource = dc.FXDPlans.
                    OrderBy(a => a.name).
                    ThenBy(a => a.responsible).
                    ThenBy(a => a.executor).
                    ThenBy(a => a.department).
                    ThenBy(a => a.report).
                    ToList();
                GridView1.DataBind();
            }
        }

        public void ExportGrid(string fileName, string contenttype)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.Charset = "";
            Response.ContentType = contenttype;
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            GridView1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.Close();
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //this is added for error : GridView must be placed inside a form tag with runat=server
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    ExportGrid("GridviewData.doc", "application/vnd.ms-word");
        //}
    }
}