﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;


namespace MFBDBO.Reports
{
    public partial class BookingByReport : System.Web.UI.Page
    {

        BookingGuestRpt bgr = new BookingGuestRpt();
        List<BookingGuestRpt> lstbgr = new List<BookingGuestRpt>();
        ReportsBL objRBL = new ReportsBL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetSuppliers();
                GetAgents();
                GetBookingRequest();
            }
        }
        protected void GetSuppliers()
        {
            SuppliersBL objSupBL = new SuppliersBL();
            List<Supplierstbl> lstsupl = new List<Supplierstbl>();
            Supplierstbl sup = new Supplierstbl();
            sup.IsActive = 1;
            lstsupl = objSupBL.GetAllSuppliers(sup).ToList();
            foreach (var cnt in lstsupl)
            {
                ListItem li = new ListItem();
                li.Text = cnt.Supplier;
                li.Value = cnt.SupplierID.ToString();
                ddlSupplier.Items.Add(li);
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
            lstbgr = objRBL.GetAllReports(bgr).ToList();
            gdvBbyReports.DataSource = lstbgr;
            gdvBbyReports.DataBind();
        }

        protected void GetBookingSearch()
        {
            BookingGuestRpt bgr = new BookingGuestRpt();
            bgr.FromDate = txtFromDate.Text;
            bgr.ToDate = txtToData.Text;
            bgr.SupId = Convert.ToInt32(ddlSupplier.SelectedValue);            
            bgr.AgentId = Convert.ToInt32(ddlAgents.SelectedValue);
            lstbgr = objRBL.GetAllReportById(bgr).ToList();
            gdvBbyReports.DataSource = lstbgr;
            gdvBbyReports.DataBind();
        }
        protected void gdvBbySupplier_RowDataBound(object sender, GridViewRowEventArgs e)
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
            ddlSupplier.SelectedIndex = 0;
            ddlAgents.SelectedIndex = 0;
        }
    }
}