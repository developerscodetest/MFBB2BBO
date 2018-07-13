using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Reports
{
    public partial class BookingByAgents : System.Web.UI.Page
    {
        BookingGuestRpt bgr = new BookingGuestRpt();
        List<BookingGuestRpt> lstbgr = new List<BookingGuestRpt>();
        ReportsBL objRBL = new ReportsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAgents();
                GetBookingRequest();
            }
        }
        protected void GetAgents()
        {
            AgentsBL objAgentBL = new AgentsBL();
            List<Agentstbl> lstAgent = new List<Agentstbl>();
            Agentstbl Agt = new Agentstbl();
            Agt.IsActive = 1;
            lstAgent = objAgentBL.GetAllAgents(Agt).ToList();
            foreach (var cnt in lstAgent)
            {
                ListItem li = new ListItem();
                li.Text = cnt.AgencyName;
                li.Value = cnt.AgentID.ToString();
                ddlAgents.Items.Add(li);
            }
        }
        protected void GetBookingRequest()
        {
            lstbgr = objRBL.GetAllAgents(bgr).ToList();
            gdvBbyAgents.DataSource = lstbgr;
            gdvBbyAgents.DataBind();
        }
        protected void GetBookingSearch()
        {
            BookingGuestRpt bgr = new BookingGuestRpt();
            bgr.FromDate = txtFromDate.Text;
            bgr.ToDate = txtToData.Text;
            bgr.AgentId = Convert.ToInt32(ddlAgents.SelectedValue);
            bgr.Status = Convert.ToInt32(ddlStatus.SelectedValue);
            lstbgr = objRBL.GetAllReportById(bgr).ToList();
            //gdvBbyAgents.DataSource = lstbgr;
            //gdvBbyAgents.DataBind();
        }
        protected void gdvBbyAgents_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            GetBookingSearch();
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFromDate.Text = "";
            txtToData.Text = "";
            ddlAgents.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }
    }
}
