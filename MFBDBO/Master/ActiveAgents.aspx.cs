using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;
using System.Data;

namespace MFBDBO.Master
{
    public partial class ActiveAgents : System.Web.UI.Page
    {
        RegistrationBL objagBL = new RegistrationBL();
        Agentstbl at = new Agentstbl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAgents();
            }
        }

        protected void GetAgents()
        {
            List<Agentstbl> lstAgn = new List<Agentstbl>();
            at.IsActive = 1;
           
            lstAgn = objagBL.GetAgentByIsActive(at).ToList();
            if (lstAgn.Count() >= 1)
            {
                gdvAgents.DataSource = lstAgn;
                gdvAgents.DataBind();

            }
            else
            {
                DataTable dt = new DataTable();
                gdvAgents.DataSource = dt;
                gdvAgents.DataBind();
            }
        
        }

        protected void lbtnAView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var AgentID =Convert.ToInt32(gvr.Cells[0].Text);
            Session["AgentID"] = AgentID;
            Response.Redirect("AgentsView.aspx");
        }

        protected void GdvAgents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[7].Text) == 1)
                {
                    e.Row.Cells[7].Text = "Active";
                    e.Row.FindControl("lbtnAMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[7].Text) == 0)
                {
                    e.Row.Cells[7].Text = "InActive";
                    e.Row.FindControl("lbtnAMarkAsInActive").Visible = false;
                }
                  else if (Convert.ToInt32(e.Row.Cells[7].Text) == 2)
                {
                    e.Row.Cells[7].Text = "Hold";
                    e.Row.FindControl("lbtnAHold").Visible = false;
                }

            }
        }

        protected void lbtnAMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var s = lbtn.Text.Split('>');
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[7].Text;
            Agentstbl at = new Agentstbl();
            at.AgentID = Convert.ToInt32(gvr.Cells[0].Text);
            if (s[2] ==  "Mark As InActive")
            {
                at.Status = 0;
            }
            else if (s[2] == "Mark As Active")
            {
                at.Status = 1;
            }
            else if (s[2] == "Hold")
            {
                at.Status = 2;
            }
          //  id.Split("</li>");
            objagBL.UpdateAgentStatus(at);
            GetAgents();


        }
        protected void lbtnAHold_Click(object sender, EventArgs e)
        {

            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[7].Text;
            Agentstbl at = new Agentstbl();
            at.AgentID = Convert.ToInt32(gvr.Cells[0].Text);
            at.Status = 2;
            objagBL.UpdateAgentStatus(at);
            GetAgents();
        }
        
    }
}