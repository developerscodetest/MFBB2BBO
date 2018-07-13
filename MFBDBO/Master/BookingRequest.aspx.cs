using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MFBDBO.Business;
using MFBDBO.Data;
using MySql.Data.MySqlClient;

namespace MFBDBO.Master
{
    public partial class OfflineRequestView : System.Web.UI.Page
    {
        BookingRequestBL objBookReqBL = new BookingRequestBL();
       
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        List<Countrytbl> lstCountry = new List<Countrytbl>();
        Countrytbl ctry = new Countrytbl();
        CountryBL objcountryBL = new CountryBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAgency();
                GetCountry();
                GetRequest();
            }
        }
        protected void GetRequest()
        {
            BookingRequesttbl br = new BookingRequesttbl();
            br.RequestId = Convert.ToInt32(Session["RequestId"]);
            GetRequestByID(br.RequestId);
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void GetAgency()
        {
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl agt = new Agentstbl();
            RegistrationBL objRegBL = new RegistrationBL();
            lstAgents = objRegBL.GetAllAgents(agt).ToList();
            ddlAgency.Items.Clear();
            foreach (var el in lstAgents)
            {
                ListItem li = new ListItem();
                li.Text = el.AgencyName;
                li.Value = el.AgentID.ToString();
                ddlAgency.Items.Add(li);
            }
        }
        protected void GetCountry()
        {

            ctry.IsActive = 1;
            lstCountry = objcountryBL.GetCountryByIsActive(ctry).ToList();
            foreach (var cnt in lstCountry)
            {
                ListItem li = new ListItem();
                li.Text = cnt.CountryName;
                li.Value = cnt.CountryID.ToString();
                ddlNationality.Items.Add(li);
            }
        }
        protected void GetRequestByID(int RequestId)
        {
            BookingRequesttbl br = new BookingRequesttbl();
            List<BookingRequesttbl> lbr = new List<BookingRequesttbl>();
            br.RequestId = RequestId;
            lbr = objBookReqBL.GetBookingRequestbyId(br).ToList();
            List<BookingReqGuestDetailstbl> lstbd = new List<BookingReqGuestDetailstbl>();
            BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();

            foreach (var el in lbr)
            {
                hdnRequestId.Value = el.RequestId.ToString();
                ddlAgency.SelectedValue = el.AgentId.ToString();
                txtDest.Text = el.Destination;
               ddlNationality.SelectedValue = el.Nationality;
                txtCheckInDate.Text = Convert.ToDateTime(el.Checkin).ToShortDateString();
                txtCheckOutDate.Text = Convert.ToDateTime(el.Checkout).ToShortDateString();

                //Countrytbl cn = new Countrytbl();
                //cn.CountryID = Convert.ToInt32(el.CountryId);
                //var cval = objcountryBL.GetCountryById(cn);
                //ddlNationality.SelectedValue = el.Nationality;


                txtPrH.Text = el.PreferedHotels;
                ddlSightSeeing.SelectedValue = el.SightSeeing.ToString();

                int a = 0, k = 0;
                for (int i = 0; i < el.GuestDetails.Count(); i++)
                {
                    if (el.GuestDetails[i].Type == "A" && i == 0)
                    {
                        hdnAdultGuestId1.Value = el.GuestDetails[i].GuestId.ToString();
                        txtAdultFN1.Text = el.GuestDetails[i].FirstName;
                        txtAdultLN1.Text = el.GuestDetails[i].LastName;
                        ddlAdultSalutation1.SelectedValue= el.GuestDetails[i].Salutation;
                        a++;
                    }

                    if (el.GuestDetails[i].Type == "A" &&  i == 1 )
                    {
                        hdnAdultGuestId2.Value = el.GuestDetails[i].GuestId.ToString();
                        txtAdultFN2.Text = el.GuestDetails[i].FirstName;
                        txtAdultLN2.Text = el.GuestDetails[i].LastName;
                        ddlAdultSalutation2.SelectedValue = el.GuestDetails[i].Salutation;
                        a++;
                    }
                    if (el.GuestDetails[i].Type == "K" &&  (i==1 || i == 2))
                    {
                        hdnChildGuestId1.Value = el.GuestDetails[i].GuestId.ToString();
                        txtChildFName1.Text = el.GuestDetails[i].FirstName;
                        txtChildLName1.Text = el.GuestDetails[i].LastName;
                        ddlChildAge1.SelectedValue = el.GuestDetails[i].Age;
                        k++;
                    }
                    if (el.GuestDetails[i].Type == "K" &&  i == 3)
                    {
                        hdnChildGuestId2.Value = el.GuestDetails[i].GuestId.ToString();
                        txtChildFName2.Text = el.GuestDetails[i].FirstName;
                        txtChildLName2.Text = el.GuestDetails[i].LastName;
                        ddlChildAge2.SelectedValue = el.GuestDetails[i].Age;
                        k++;
                    }
                }
                ddlAdult.SelectedValue = a.ToString();
                ddlChild.SelectedValue = k.ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            BookingRequesttbl Br = new BookingRequesttbl();
            Br.RequestId = Convert.ToInt32(hdnRequestId.Value);
            Br.AgentId = Convert.ToInt32(ddlAgency.SelectedValue);
            Br.Destination = txtDest.Text;
            Br.Checkin = Convert.ToDateTime(txtCheckInDate.Text).ToString("yyyy-MM-dd");
            Br.Checkout = Convert.ToDateTime(txtCheckInDate.Text).ToString("yyyy-MM-dd");
            Br.Nationality = ddlNationality.SelectedValue;
            Br.PreferedHotels = txtPrH.Text;
            Br.SightSeeing = ddlSightSeeing.SelectedValue;
            List<BookingRequesttbl> brl = new List<BookingRequesttbl>();

          //  List<BookingRequesttbl> lbr = new List<BookingRequesttbl>();
            List<BookingReqGuestDetailstbl> lstbd = new List<BookingReqGuestDetailstbl>();
          //  BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();

              if (Convert.ToInt32(ddlAdult.SelectedValue) >= 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.GuestId =Convert.ToInt32(hdnAdultGuestId1.Value);
                brg.RequestId = Convert.ToInt32(hdnRequestId.Value);
                brg.Salutation = ddlAdultSalutation1.SelectedItem.Text;
                brg.FirstName = txtAdultFN1.Text;
                brg.LastName = txtAdultLN1.Text;
                brg.Type = "A";
                brg.Status = 1;
                brg.CreatedBy = 1;
                brg.RoomNo = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);
            }
            if (Convert.ToInt32(ddlAdult.SelectedValue) > 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.GuestId = Convert.ToInt32(hdnAdultGuestId2.Value);
                brg.RequestId = Convert.ToInt32(hdnRequestId.Value);
                brg.Salutation = ddlAdultSalutation2.SelectedItem.Text;
                brg.FirstName = txtAdultFN2.Text;
                brg.LastName = txtAdultLN2.Text;               
                brg.Type = "A";
                brg.Status = 1;
                brg.RoomNo = 1;
                brg.CreatedBy = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);

            }

            if (Convert.ToInt32(ddlChild.SelectedValue) >= 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.GuestId = Convert.ToInt32(hdnChildGuestId1.Value);
                brg.RequestId = Convert.ToInt32(hdnRequestId.Value);
                brg.Age = ddlChildAge1.SelectedValue;
                brg.FirstName = txtChildFName1.Text;
                brg.LastName = txtChildLName1.Text;               
                brg.Type = "K";
                brg.Status = 1;
                brg.CreatedBy = 1;
                brg.RoomNo = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);
            }
            if (Convert.ToInt32(ddlChild.SelectedValue) > 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.GuestId = Convert.ToInt32(hdnChildGuestId2.Value);
                brg.RequestId = Convert.ToInt32(hdnRequestId.Value);
                brg.Age = ddlChildAge2.SelectedValue;
                brg.FirstName = txtChildFName2.Text;
                brg.LastName = txtChildLName2.Text;          
                brg.Type = "K";
                brg.Status = 1;
                brg.RoomNo = 1;
                brg.CreatedBy = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);
            }

            //brl = objBookReqBL.UpdateBookingRequest(Br).ToList();     
           
            Br.GuestDetails = lstbd;
            
            brl = objBookReqBL.UpdateBookingRequest(Br).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Booking Request Updated Successfully');", true);
            //Reset();
            btnUpdate.Visible = false;
            btnSubmit.Visible = true;
        
        }
        protected void Reset()
        {
            ddlAgency.SelectedIndex = 0;
            txtDest.Text = "";
            txtCheckInDate.Text = "";
            txtCheckOutDate.Text = "";
            ddlNationality.SelectedIndex = 0;
            ddlSightSeeing.SelectedIndex = 0;
            txtPrH.Text = "";
            ddlAdult.SelectedIndex = 0;
            ddlAdultSalutation1.SelectedIndex = 0;
            ddlAdultSalutation2.SelectedIndex = 0;
            txtAdultFN1.Text = "";
            txtAdultLN1.Text = "";
            txtAdultFN2.Text = "";
            txtAdultLN2.Text = "";
            txtChildFName1.Text = "";
            txtChildFName2.Text = "";
            txtChildLName1.Text = "";
            txtChildLName2.Text = "";
            ddlChild.SelectedIndex = 0;
            ddlChild.SelectedIndex = 0;
            ddlChildAge2.SelectedIndex = 0;

        }






    }
}