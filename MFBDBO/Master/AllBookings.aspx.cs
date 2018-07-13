using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class AllBookings : System.Web.UI.Page
    {
        AllBookingsBL objAllBookingsBL = new AllBookingsBL();
        List<Booking> lstBok = new List<Booking>();

        Agentstbl cntt = new Agentstbl();
        List<Agentstbl> lstAgents = new List<Agentstbl>();

        BookingDetailstbl bdt = new BookingDetailstbl();
        List<BookingDetailstbl> lstBookings = new List<BookingDetailstbl>();

        //Employeetbl ept = new Employeetbl();
        //List<Employeetbl> lstEmployee = new List<Employeetbl>();

        Supplierstbl spt = new Supplierstbl();
        List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();

        protected void Page_Load(object sender, EventArgs e)
        {
            AgentsBL objAgentsBL = new AgentsBL();
            lstAgents = objAgentsBL.GetAllAgents(cntt).ToList();

            BookingDetailsBL objBookingDetailsBL = new BookingDetailsBL();
            lstBookings = objBookingDetailsBL.GetAllBooking(bdt).ToList();

            //EmployeeBL objEmployeeBL = new EmployeeBL();
            //lstEmployee = objEmployeeBL.GetAllEmployee(ept).ToList();

            SuppliersBL objSuppliersBL = new SuppliersBL();
            lstSuppliers = objSuppliersBL.GetAllSuppliers(spt).ToList();

            if (!IsPostBack)
            {
                GetAllBookings();
                GetAgents();
                GetBookingDetails();
                //GetEmployee();
                GetSuppliers();
            }
        }

        protected void GetAgents()
        {
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl ags = new Agentstbl();
            AgentsBL objAgentsBL = new AgentsBL();
            //ags.Status = "1";
            lstAgents = objAgentsBL.GetAllAgents(ags).ToList();
            ListItem m = new ListItem();
            m.Text = "--Select--";
            m.Value = 0.ToString();
            ddlAgent.Items.Add(m);
            foreach (var cntt in lstAgents)
            {
                ListItem la = new ListItem();
                la.Text = cntt.AgencyName;
                la.Value = cntt.AgentID.ToString();
                ddlAgent.Items.Add(la);
            }
        }

        protected void GetBookingDetails()
        {
            List<BookingDetailstbl> lstBookings = new List<BookingDetailstbl>();
            BookingDetailstbl bks = new BookingDetailstbl();
            BookingDetailsBL objBookingDetailsBL = new BookingDetailsBL();
            //bks.Status = 1.ToString();
            lstBookings = objBookingDetailsBL.GetAllBooking(bks).ToList();
            ListItem b = new ListItem();
            b.Text = "--Select--";
            b.Value = "0";
            ddlBID.Items.Add(b);
            ddlAgentBookingID.Items.Add(b);
            foreach (var bdt in lstBookings)
            {
                ListItem bk = new ListItem();
                //bk.Text = bdt.BookingId;
                bk.Text = bdt.SupBookingId.ToString();
                bk.Value = bdt.BookingDetailsId.ToString();
                ddlBID.Items.Add(bk);
                ListItem sbk = new ListItem();
                sbk.Text = bdt.AgentBookingId.ToString();
                sbk.Value = bdt.BookingDetailsId.ToString();
                ddlAgentBookingID.Items.Add(sbk);
            }
        }

        //protected void GetEmployee()
        //{
        //    List<Employeetbl> lstEmployee = new List<Employeetbl>();
        //    Employeetbl epy = new Employeetbl();
        //    EmployeeBL objEmployeeBL = new EmployeeBL();
        //    //bks.Status = 1.ToString();
        //    lstEmployee = objEmployeeBL.GetAllEmployee(epy).ToList();
        //    ListItem e = new ListItem();
        //    e.Text = "--Select--";
        //    e.Value = 0.ToString();
        //    ddlStaff.Items.Add(e);
        //    foreach (var ept in lstEmployee)
        //    {
        //        ListItem ep = new ListItem();
        //        ep.Text = ept.FirstName + " " + ept.LastName;
        //        ep.Value = ept.EmpId.ToString();
        //        ddlStaff.Items.Add(ep);
        //    }
        //}

        protected void GetSuppliers()
        {
            List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
            Supplierstbl sps = new Supplierstbl();
            SuppliersBL objSuppliersBL = new SuppliersBL();
            //bks.Status = 1.ToString();
            lstSuppliers = objSuppliersBL.GetAllSuppliers(sps).ToList();
            ListItem s = new ListItem();
            s.Text = "--Select--";
            s.Value = 0.ToString();
            ddlStaff.Items.Add(s);
            foreach (var spt in lstSuppliers)
            {
                ListItem sp = new ListItem();
                sp.Text = spt.Supplier;
                sp.Value = spt.SupplierID.ToString();
                ddlStaff.Items.Add(sp);
            }
        }

        protected void GetAllBookings()
        {
            AllBookingstbl ls = new AllBookingstbl();
            Hotelstbl hs = new Hotelstbl();
            Gueststbl gs = new Gueststbl();
            Roomstbl rs = new Roomstbl();
            Supplierstbl sp = new Supplierstbl();
            Agentstbl ag = new Agentstbl();
            //Booking Bok = new Booking();
            
            lstBok = objAllBookingsBL.GetAllBookingsWithSearch(ls, gs, hs, rs, sp, ag).ToList();           
            gdvAllBookings.DataSource = lstBok;
            gdvAllBookings.DataBind();
        }

        protected void GetAllBookingsById(int id)
        {
            AllBookingstbl ls = new AllBookingstbl();
            Hotelstbl hs = new Hotelstbl();
            Gueststbl gs = new Gueststbl();
            Roomstbl rs = new Roomstbl();
            Supplierstbl sp = new Supplierstbl();
            Agentstbl ag = new Agentstbl();
            
            List<Booking> lstAllBookings = new List<Booking>();
            lstAllBookings = objAllBookingsBL.GetAllBookingsById(ls, gs, hs, rs, sp, ag).ToList();

            foreach (var el in lstAllBookings)
            {
                              
            }
        }

        protected void GdvAllBookings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (lstBok.Count > 0)
                {
                    e.Row.Cells[1].Text = "<b> ID : </b>" + lstBok[e.Row.RowIndex].AllBookingstc.SupBookingId + "<br/> <b> Supplier : </b>" + lstBok[e.Row.RowIndex].Supplierstc.Supplier + "<br/> <b> Received : </b>";
                    e.Row.Cells[2].Text = lstBok[e.Row.RowIndex].Agentstc.AgencyName + "(" + lstBok[e.Row.RowIndex].Agentstc.AgencyCode + ")<br/> <b> Staff: </b>" + lstBok[e.Row.RowIndex].Agentstc.ContactName;
                    e.Row.Cells[3].Text = lstBok[e.Row.RowIndex].Hotelstc.HotelName + "<br/> <b> Address : </b>" + lstBok[e.Row.RowIndex].Hotelstc.HotelAddress + "<br/> <b> Contact : </b>" + lstBok[e.Row.RowIndex].Hotelstc.ContactNumber;
                    e.Row.Cells[4].Text = lstBok[e.Row.RowIndex].AllBookingstc.AgentID + "<br/> <b> Check-In : </b>" + Convert.ToDateTime(lstBok[e.Row.RowIndex].AllBookingstc.CheckinDate).ToShortDateString() + "<br/> <b> Check-Out : </b>" + Convert.ToDateTime(lstBok[e.Row.RowIndex].AllBookingstc.ChekoutDate).ToShortDateString();
                    //e.Row.Cells[4].Text = lstBok[e.Row.RowIndex].Gueststc.FirstName + "<br/> <b> Check-In : </b>" + Convert.ToDateTime(lstBok[e.Row.RowIndex].AllBookingstc.CheckinDate).ToShortDateString() + "<br/> <b> Check-Out : </b>" + Convert.ToDateTime(lstBok[e.Row.RowIndex].AllBookingstc.ChekoutDate).ToShortDateString();
                    //e.Row.Cells[5].Text = "<b>DeadLine : </b>" + Convert.ToDateTime(e.Row.Cells[5].Text).ToString("dd-MM-yyyy");
                    e.Row.Cells[5].Text = "<b> DeadLine : </b>" + Convert.ToDateTime(e.Row.Cells[5].Text).ToShortDateString() + "<b> Payment : </b><br/>" + "<b> Cancelled : </b>";
                    e.Row.Cells[6].Text = "<b> Confirm : </b>" + e.Row.Cells[6].Text + "<b> ReConfirm : </b><br/> <b> Voucher : </b>";
                    e.Row.Cells[7].Text = e.Row.Cells[7].Text + "<br/> <b> <span class='dtr-data'><span class='label label-primary'>Confirmed: </span> </b> <br/> <b> <label class='label label-danger text-right'>Non-Refundable: </label></span></b>";
                    //lstBok[e.Row.RowIndex].AllBookingstc.CheckinDate
                    //lstBok[e.Row.RowIndex].AllBookingstc.ChekoutDate
                }
            }
        }

        protected void lbtnABView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var BookingDetailsId = Convert.ToInt32(gvr.Cells[0].Text);
            Session["BookingDetailsId"] = BookingDetailsId;
            Response.Redirect("View.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            AllBookingsSearchtbl abs = new AllBookingsSearchtbl();
            abs.AgentID = Convert.ToInt32(ddlAgent.SelectedValue);
            abs.AgentBookingID = ddlAgentBookingID.SelectedItem.Text;
            abs.SupplierID = Convert.ToInt32(ddlStaff.SelectedValue);
            abs.FromDate = txtFDate.Text;
            abs.ToDate = txtTDate.Text;
            abs.SupBookingID = ddlBID.SelectedItem.Text;
            abs.Status = 0;
            abs.Staff = ddlStaff.SelectedValue;
            //List<Booking> lstAllBookings = new List<Booking>();
            //lstAllBookings = objAllBookingsBL.GetAllBookingsSearchWithSearch(abs).ToList();
            lstBok = objAllBookingsBL.GetAllBookingsSearchWithSearch(abs).ToList();
            gdvAllBookings.DataSource = lstBok;
            gdvAllBookings.DataBind();
        }

    }
}