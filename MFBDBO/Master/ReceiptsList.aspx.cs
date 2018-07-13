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
    public partial class ReceiptsList : System.Web.UI.Page
    {
        Agentstbl cntt = new Agentstbl();
        List<Agentstbl> lstAgents = new List<Agentstbl>();

        AccReceiptsBL objAccReceiptsBL = new AccReceiptsBL();
        AccReceiptstbl AR = new AccReceiptstbl();

        protected void Page_Load(object sender, EventArgs e)
        {
            AgentsBL objAgentsBL = new AgentsBL();
            lstAgents = objAgentsBL.GetAllAgents(cntt).ToList();

            if (!IsPostBack)
            {
                GetAccReceipts();
            }
        }

        protected string GetAgents()
        {
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl ags = new Agentstbl();
            AgentsBL objAgentsBL = new AgentsBL();            
            lstAgents = objAgentsBL.GetAllAgents(ags).ToList();
            foreach (var cnt in lstAgents)
            {
                ags.AgencyName = cnt.AgencyName;
            }

            return ags.AgencyName;
        }

        protected void GetAccReceipts()
        {
            List<AccReceiptstbl> lstAR = new List<AccReceiptstbl>();
            lstAR = objAccReceiptsBL.GetAllAccReceipt(AR).ToList();
            gdvAccReceipts.DataSource = lstAR;
            gdvAccReceipts.DataBind();            
        }

        protected void lbtnRView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var ReceiptID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["ReceiptID"] = ReceiptID;
            Response.Redirect("PrepareAReceiptsView.aspx");
        }

        protected void lbtnREdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var ReceiptID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["ReceiptID"] = ReceiptID;
            Response.Redirect("ReceiptsEdit.aspx");
        }

        protected void GdvAccReceipts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[4].Text) == 1)
                {
                    e.Row.Cells[4].Text = "Cash";
                }
                else if (Convert.ToInt32(e.Row.Cells[4].Text) == 2)
                {
                    e.Row.Cells[4].Text = "Bank";
                }
                //else if (Convert.ToInt32(e.Row.Cells[4].Text) == 3)
                //{
                //    e.Row.Cells[4].Text = "Credit/Debit Card";
                //}
                //else if (Convert.ToInt32(e.Row.Cells[4].Text) == 4)
                //{
                //    e.Row.Cells[4].Text = "Internet Banking";
                //}

                var lst = lstAgents;
                var val = lst.OfType<Agentstbl>().Where(d => d.AgentID == Convert.ToInt32(e.Row.Cells[2].Text));
                
                e.Row.Cells[2].Text = Convert.ToInt32(val.Count()) <= 0 ? "" : val.First().AgencyName;

                e.Row.Cells[3].Text = Convert.ToDateTime(e.Row.Cells[3].Text).ToShortDateString();

                //if (Convert.ToInt32(e.Row.Cells[3].Text) == 1)
                //{
                //    e.Row.Cells[3].Text = "Active";
                //    e.Row.FindControl("lbtnRMarkAsActive").Visible = false;
                //}
                //else if (Convert.ToInt32(e.Row.Cells[3].Text) == 0)
                //{
                //    e.Row.Cells[3].Text = "InActive";
                //    e.Row.FindControl("lbtnRMarkAsInActive").Visible = false;
                //}
            }
        }
        

        //protected void lbtnRMarkAsActive_Click(object sender, EventArgs e)
        //{
        //    LinkButton lbtn = (LinkButton)sender;
        //    GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
        //    var val = gvr.DataItemIndex;
        //    var id = gvr.Cells[3].Text;
        //    AccReceiptstbl cnt = new AccReceiptstbl();
        //    cnt.ReceiptID = Convert.ToInt32(gvr.Cells[0].Text);
        //    if (id == "Active")
        //    {
        //        cnt.Status = 0;
        //    }
        //    else if (id == "InActive")
        //    {
        //        cnt.Status = 1;
        //    }
        //    objAccReceiptsBL.UpdateAccReceiptIsActive(cnt);
        //    GetAccReceipts();
        //}
    }
}