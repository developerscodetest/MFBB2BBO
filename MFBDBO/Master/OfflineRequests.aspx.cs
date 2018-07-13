using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
namespace MFBDBO.Master
{
    public partial class OfflineRequests : System.Web.UI.Page
    {
        BookingRequestBL objBookReqBL = new BookingRequestBL();
        List<BookingRequesttbl> lstbr = new List<BookingRequesttbl>();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetRequest();
            }
        }
        protected void GetRequest()
        {

            lstbr = objBookReqBL.GetBookRequest().ToList();
            gdvBookingDetails.DataSource = lstbr;
            gdvBookingDetails.DataBind();
        }

        protected void lbtnBookingDetails_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var RequestId = Convert.ToInt32(gvr.Cells[0].Text);

            Session["RequestId"] = RequestId;
            Response.Redirect("BookingDetails.aspx");
        }

        protected void gdvBookingDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var lst = lstbr;
                var val = lst.OfType<BookingRequesttbl>().Where(r => r.RequestId == Convert.ToInt32(e.Row.Cells[0].Text));
                var fir = val.First();
                e.Row.Cells[1].Text = "<b>ID : </b>" + e.Row.Cells[1].Text + "<br/> <b>Supplier : </b>";
                e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/> <b>Staff: </b>";
                e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/> <b>Address : </b> <br/> <b>Contact : </b>";
                e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/> <b>Check-In : </b>" + Convert.ToDateTime(fir.Checkin).ToString("dd-MM-yyyy") + "<br/> <b>Check-Out : </b>" + Convert.ToDateTime(fir.Checkout).ToString("dd-MM-yyyy");
                //e.Row.Cells[5].Text = "<b>DeadLine : </b>" + Convert.ToDateTime(e.Row.Cells[5].Text).ToString("dd-MM-yyyy");
                //e.Row.Cells[5].Text = "<b>DeadLine : </b>" + e.Row.Cells[5].Text;
                //e.Row.Cells[6].Text = "<b>Confirm : </b>" + e.Row.Cells[6].Text;
                //e.Row.Cells[7].Text = e.Row.Cells[7].Text;
            }
        }

        protected void lbtnBookingRequest_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var RequestId = Convert.ToInt32(gvr.Cells[0].Text);

            Session["RequestId"] = RequestId;
            Response.Redirect("BookingRequest.aspx");
       
        }

       
    }
}