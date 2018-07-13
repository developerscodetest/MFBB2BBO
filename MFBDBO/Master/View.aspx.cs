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
    public partial class View : System.Web.UI.Page
    {
        AllBookingsBL objAllBookingsBL = new AllBookingsBL();

        List<Booking> lstAllBookings = new List<Booking>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["BookingDetailsId"].ToString() != null)
                {
                    int BookingDetailsId = Convert.ToInt32(Session["BookingDetailsId"]);
                    GetAllBookingsById(3);
                    GetAllBookings();
                }
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

            List<Booking> lstBok = new List<Booking>();
            lstBok = objAllBookingsBL.GetAllBookings(ls, gs, hs, rs, sp, ag).ToList();
            gdvAllBookings.DataSource = lstBok;
            gdvAllBookings.DataBind();
            GridView1.DataSource = lstBok;
            GridView1.DataBind();
            decimal Total = 0;
            foreach(var vl in lstBok)
            {
                Total += Convert.ToDecimal(vl.AllBookingstc.NoofRooms) *  Convert.ToDecimal(vl.AllBookingstc.AgentPrice);
            }
            lblTotalAmount.Text = Total.ToString();
            
        }

        protected void GetAllBookingsById(int BookingDetailsId)
        {
            AllBookingstbl ls = new AllBookingstbl
            {
                BookingDetailsId = BookingDetailsId
            };
            Hotelstbl hs = new Hotelstbl();
            Gueststbl gs = new Gueststbl();
            Roomstbl rs = new Roomstbl();
            Supplierstbl sp = new Supplierstbl();
            Agentstbl ag = new Agentstbl();

            lstAllBookings = objAllBookingsBL.GetAllBookingsById(ls, gs, hs, rs, sp, ag).ToList();

            foreach (var el in lstAllBookings)
            {
                lblBID.Text = el.AllBookingstc.SupBookingId;                
                lblDate.Text = Convert.ToDateTime(el.AllBookingstc.BookingDate).ToShortDateString();
                lblSName.Text = el.Supplierstc.Supplier;
                lblRec.Text = el.Supplierstc.ToString();
                lblAgencyName.Text = el.Agentstc.AgencyName;
                lblAgencyCNo.Text = el.Agentstc.MobileNo;
                lblCancel.Text = el.Agentstc.ToString();
                lblDeadlineDate.Text = el.Agentstc.ToString();
                lblABID.Text = el.AllBookingstc.AgentBookingId;

                lblHName.Text = el.Hotelstc.HotelName;
                lblCNo.Text = el.Hotelstc.ContactNumber;
                lblAdrs.Text =  el.Hotelstc.HotelAddress;
                lblLctn.Text = el.Hotelstc.ToString();
                lblCheckInDate.Text = Convert.ToDateTime(el.AllBookingstc.CheckinDate).ToShortDateString();
                lblCheckOutDate.Text = Convert.ToDateTime(el.AllBookingstc.ChekoutDate).ToShortDateString();
            }
            //GetAllBookingsById(30);
        }

        protected void GdvAllBookings_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = lstAllBookings[e.Row.RowIndex].Roomstc.RoomDetailsId.ToString();
                e.Row.Cells[2].Text = lstAllBookings[e.Row.RowIndex].Roomstc.RoomType;
                e.Row.Cells[3].Text = lstAllBookings[e.Row.RowIndex].Roomstc.Price;
                e.Row.Cells[4].Text = lstAllBookings[e.Row.RowIndex].Gueststc.FirstName + " " + lstAllBookings[e.Row.RowIndex].Gueststc.LastName; 
                e.Row.Cells[5].Text = lstAllBookings[e.Row.RowIndex].Roomstc.Adults.ToString();
                e.Row.Cells[6].Text = lstAllBookings[e.Row.RowIndex].Roomstc.Kids.ToString();
            }           

        }

        protected void GdvAllBookings_RowDataBound2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = lstAllBookings[e.Row.RowIndex].Roomstc.RoomType;
                e.Row.Cells[2].Text = lstAllBookings[e.Row.RowIndex].Roomstc.Price;
                e.Row.Cells[3].Text = lstAllBookings[e.Row.RowIndex].AllBookingstc.NoofRooms.ToString();
                e.Row.Cells[4].Text = lstAllBookings[e.Row.RowIndex].AllBookingstc.AgentPrice;
            }

        }

        //lblTotalAmount.Text = lbl

        //protected void BtnUpdate_Click(object sender, EventArgs e)
        //{
        //    AllBookingstbl ls = new AllBookingstbl();
        //    Hotelstbl hs = new Hotelstbl();
        //    Gueststbl gs = new Gueststbl();
        //    Roomstbl rs = new Roomstbl();
        //    Supplierstbl sp = new Supplierstbl();
        //    Agentstbl ag = new Agentstbl();

        //    ls.BookingDetailsId = Convert.ToInt32(hdnBookingDetailsId.Value);
        //    ls.SupBookingId = lblID.Text;
        //    //ls. = lblDate.Text;
        //    hs.HotelName = lblName.Text;
        //    hs.HotelAddress = lblAdrs.Text;
        //    hs.ContactNumber = lblNo.Text;
        //    hs.HotelLocation = lblLctn.Text;
        //    ls.CheckinDate = lblCheckInDate.Text;
        //    ls.ChekoutDate = lblCheckOutDate.Text;
        //    sp.Supplier = lblSName.Text;
        //    //sp. = Convert.ToInt32(lblOff.Text);
        //    ag.AgencyName = lblAgencyName.Text;
        //    ag.MobileNo = lblAgencyNo.Text;
        //    //ag. = Convert.ToInt32(lblNR.Text);
        //    //ag. = Convert.ToInt32(lblDeadlineDate.Text);
        //    rs.Adults = Convert.ToInt32(lblANo.Text);
        //    rs.Kids = Convert.ToInt32(lblKidsNo.Text);
        //    gs.FirstName = lblGDname.Text;
        //    ls.ConfirmationID = txtConfID.Text;
        //    ls.ReConfirmationID = txtReConfID.Text;
        //    //ls. = Convert.ToInt32(Label2.Text);

        //    //Pa.Status = 1;
        //    //Pa.UpdatedBy = 1;
        //    //Pa.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        //    List<Booking> lstAllBookings = new List<Booking>();
        //    objAllBookingsBL.UpdateAllBookings(ls, gs, hs, rs, sp, ag).ToList();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('AllBookings Updated Successfully');", true);
        //    Clear();
        //}

        protected void Clear()
        {
            //txtCommission.Text = string.Empty;

        }
        
    }
}