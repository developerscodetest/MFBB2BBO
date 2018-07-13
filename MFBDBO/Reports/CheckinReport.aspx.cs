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
    public partial class CheckinReport : System.Web.UI.Page
    {
        BookingGuestRpt bgr = new BookingGuestRpt();
        List<BookingGuestRpt> lstbgr = new List<BookingGuestRpt>();
        ReportsBL objRBL = new ReportsBL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //GetAgents();
                //GetGuestName();
                //GetHotelName();
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
            }
        }
        protected void GetGuestName()
        {
            AllBookingsBL objGuestDetailsBL = new AllBookingsBL();
            List<Booking> lstBook = new List<Booking>();
            List<GuestDetailstbl> lstGuestDetails = new List<GuestDetailstbl>();
            AllBookingstbl abt = new AllBookingstbl();
            Gueststbl gt = new Gueststbl();            
            Hotelstbl ht = new Hotelstbl();
            Roomstbl rt = new Roomstbl();
            Supplierstbl st = new Supplierstbl();
            Agentstbl at = new Agentstbl();
            GuestDetailstbl Cust = new GuestDetailstbl();
            Cust.Status = 1;
            lstBook = objGuestDetailsBL.GetAllBookings(abt, gt, ht, rt, st, at).ToList();
            foreach (var cnt in lstBook)
            {
                ListItem li = new ListItem();
                li.Text = cnt.Gueststc.FirstName + ' ' + cnt.Gueststc.LastName;
                li.Value = cnt.Gueststc.GuestId.ToString();
            }
        }
        protected void GetHotelName()
        {
            AllBookingsBL objHotelBL = new AllBookingsBL();
            List<Booking> lstBook = new List<Booking>();
            List<HotelDetailstbl> lstHotel = new List<HotelDetailstbl>();
            HotelDetailstbl Htl = new HotelDetailstbl();
            AllBookingstbl abt = new AllBookingstbl();
            Gueststbl gt = new Gueststbl();
            Hotelstbl ht = new Hotelstbl();
            Roomstbl rt = new Roomstbl();
            Supplierstbl st = new Supplierstbl();
            Agentstbl at = new Agentstbl();
            GuestDetailstbl Cust = new GuestDetailstbl();
            Htl.IsActive = 1;
            lstBook = objHotelBL.GetAllBookings(abt, gt, ht, rt, st, at ).ToList();
            foreach (var cnt in lstHotel)
            {
                ListItem li = new ListItem();
                li.Text = cnt.HotelName;
                li.Value = cnt.HotelDetailsId.ToString();
            }
            
        }
        protected void GetBookingRequest()
        {
            //lstbgr = objRBL.GEtCheckinReportAll(bgr).ToList();
            //lstbgr = objRBL.GetAllSupplier(bgr).ToList();
            //lstbgr = objRBL.GetAllAgents(bgr).ToList();
            lstbgr = objRBL.GEtCheckinReportAll(bgr).ToList();
            //lstbgr = objRBL.Get(bgr).ToList();
            gdvBbyCheckinDate.DataSource = lstbgr;
            gdvBbyCheckinDate.DataBind();
        }

        protected void GetBookingSearch()
        {
            BookingGuestRpt bgr = new BookingGuestRpt();
            bgr.FromDate = txtTodayDate.Text;
            lstbgr = objRBL.GetCheckinReportById(bgr).ToList();
            gdvBbyCheckinDate.DataSource = lstbgr;
            gdvBbyCheckinDate.DataBind();
        }
        protected void gdvBbyCheckinDate_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //var lst = lstbgr;
            //var val = lst.OfType<BookingGuestRpt>().Where(d => d.HotelDetailscls.HotelId == Convert.ToInt32(e.Row.Cells[3].Text));
            //e.Row.Cells[3].Text = val.First().HotelDetailscls.HotelName;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Cells[2].Text = lstbgr[e.Row.RowIndex].GuestDetailscls.;
                e.Row.Cells[3].Text = lstbgr[e.Row.RowIndex].HotelDetailscls.HotelName;                
            }
            
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            GetBookingSearch();
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTodayDate.Text = "";
            //txtTDate.Text = "";
            //ddlSupplier.SelectedIndex = 0;
        }
    }
}