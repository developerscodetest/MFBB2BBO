using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class IssuesList : System.Web.UI.Page
    {
        IssuesBL objIssuesBL = new IssuesBL();
        protected void Page_Load(object sender, EventArgs e)
        {
                GetIssues();
        }

        protected void GetIssues()
        {
            Issuestbl ls = new Issuestbl();            
            List<Issuestbl> lst = new List<Issuestbl>();
            lst = objIssuesBL.GetAllIssues(ls).ToList();
            gdvIssues.DataSource = lst;
            gdvIssues.DataBind();
        }

        protected void lbtnView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var IssuesId = Convert.ToInt32(gvr.Cells[0].Text);
            Session["IssuesId"] = IssuesId;
            Response.Redirect("IssuesView.aspx");
        }

        protected void gdvIssues_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[3].Text) == 1)
                {
                    e.Row.Cells[3].Text = "Reopen";
                }
                else if (Convert.ToInt32(e.Row.Cells[3].Text) == 2)
                {
                    e.Row.Cells[3].Text = "Open";
                }
                else if (Convert.ToInt32(e.Row.Cells[3].Text) == 3)
                {
                    e.Row.Cells[3].Text = "Closed";
                }

                if (Convert.ToInt32(e.Row.Cells[4].Text) == 1)
                {
                    e.Row.Cells[4].Text = "Low";
                }
                else if (Convert.ToInt32(e.Row.Cells[4].Text) == 2)
                {
                    e.Row.Cells[4].Text = "Medium";
                }
                else if (Convert.ToInt32(e.Row.Cells[4].Text) == 3)
                {
                    e.Row.Cells[4].Text = "High";
                }
            }
        }
    }
}