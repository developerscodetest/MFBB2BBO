using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Data;
using MFBDBO.Business;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace MFBDBO.Master
{
    public partial class OfflineRequestEdit : System.Web.UI.Page
    {
        //  BookingDetailsBLold objBookdetailsBL = new BookingDetailsBLold();
        HotelDetailsBL objHBL = new HotelDetailsBL();
        RoomDetailsBL objRoomBL = new RoomDetailsBL();
        GuestDetailsBL objGBL = new GuestDetailsBL();
        BookingDetailsBL objBBL = new BookingDetailsBL();
        BookingDetailstbl bd = new BookingDetailstbl();
        List<BookingDetailstbl> lbdt = new List<BookingDetailstbl>();
        BookingRequestBL objReBL = new BookingRequestBL();
        CountryBL objCountryBL = new CountryBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BookingDetails();
            }
          
        }


        protected void BookingDetails()
        {
            BookingRequesttbl brt = new BookingRequesttbl();
            List<BookingRequesttbl> lstbr = new List<BookingRequesttbl>();
            brt.RequestId = Convert.ToInt32(Session["RequestId"]);
            lstbr = objReBL.GetBookingRequestbyId(brt).ToList();
            foreach (var el in lstbr)
            {
                lblDest.Text = el.Destination;
                //lblIn.Text = el.Nationality;

                Countrytbl cn = new Countrytbl();
                cn.CountryID = Convert.ToInt32(el.Nationality);
                var cval = objCountryBL.GetCountryById(cn);
                lblIn.Text = cval.First().CountryName;


                lblHName.Text = el.PreferedHotels;
                txtCheckInDate.Text = Convert.ToDateTime(el.Checkin).ToShortDateString();
                txtCheckOutDate.Text = Convert.ToDateTime(el.Checkout).ToShortDateString();
                GetRequestByID(brt.RequestId);
                
            }
        }
  

        protected void HotelInsert()
        {
            HotelDetailstbl hd = new HotelDetailstbl();
            hd.HotelDetailsId = 0;
            hd.HotelCode ="";
            hd.HotelName = txtHN.Text;
            hd.Description ="";
            hd.Address = txtHtAdress.Text;
            hd.Category =1;
            hd.ContactNumber="";
            hd.CityID = "";
            hd.CountryID = "";
            hd.Latitude = "";
            hd.Longitude = "";
            hd.CreatedBy =1;
            hd.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<HotelDetailstbl> hds = new List<HotelDetailstbl>();
            hds = objHBL.InsertHotel(hd).ToList();
            hds = objHBL.GetMaxHotel(hd).ToList();
            BookingInsert(hds.First().HotelDetailsId);
        }

        protected void BookingInsert(int HotelDetailsId)
        {
            BookingDetailstbl lbd = new BookingDetailstbl();
            lbd.BookingDetailsId = 0;
            lbd.HotelDetailsId =1;
            lbd.SupplierID =1;
            lbd.SupBookingId ="1hm0";
            lbd.AgentBookingId ="2fhjf";
            lbd.Checkin =txtCheckInDate.Text;
            lbd.Checkout =txtCheckOutDate.Text;
            lbd.NoofRooms = txtNORooms.Text == "" ? 0 : Convert.ToInt32(txtNORooms.Text); 
            lbd.AgentPrice ="100";
            lbd.SupplierPrice ="200";
            lbd.Status ="1";
            lbd.Cancellation ="0";
            lbd.Amendment ="1";
            lbd.PaymentType ="cash";
            lbd.PaymentStatus ="1";
            lbd.NonRefundable ="no";
            lbd.Currency ="1000";
            lbd.SupBookRef ="1ggf";
            lbd.BookingDate =DateTime.Now.ToString();
            lbd.BookingComment ="1";
            lbd.AdditionalInfo ="ghgf";
            lbd.Title ="Boss";
            lbd.Name ="Rama";
            lbd.SurName ="Mr";
            lbd.Nationality =1;
            lbd.MobileNumber =12345654.ToString();
            lbd.EmailID ="dagf@mgif";
            lbd.BookingType ="1";
            lbd.ConfirmationID ="1";
            lbd.ReConfirmationID ="1";          
            lbd.CreatedBy = 1;
            lbd.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            lbd.UpdatedBy = 1;
            lbd.UpdatedDate = DateTime.Now.ToString();
            List<BookingDetailstbl> lbt = new List<BookingDetailstbl>();
            lbt = objBBL.InsertBooking(lbd).ToList();
            lbt = objBBL.GetMaxBooking(lbd).ToList();
            RoomInsert(lbt.First().BookingDetailsId);
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data inserted Successfully');", true);
        }

        
        //RoomDetailstbl rd2 = new RoomDetailstbl()
        //{
        //    RoomDetailsId = 2,
        //    BookingDetailsId = 0,
        //    Adults = 3,
        //    Kids = 4,
        //    Status=1,
        //    RoomType = "2nddouble",
        //    Price = "2000",

        //};
        //RoomDetailstbl rd3 = new RoomDetailstbl()
        //{
        //    RoomDetailsId = 3,
        //    BookingDetailsId = 0,
        //    Adults = 1,
        //    Kids = 1,
        //    RoomType = "3rd double",
        //    Price = "5000",

        //};

        List<RoomDetailstbl> objRd = new List<RoomDetailstbl>();
        RoomDetailstbl rd1 = new RoomDetailstbl();
        protected void RoomInsert(int BookingDetailsId)
        {

            RoomDetailstbl rd1 = new RoomDetailstbl()
            {
                RoomDetailsId = 0,
                BookingDetailsId = 0,
                Adults = 2,
                Kids = 2,
                Status = 1,
                RoomType = "1stsingle",
                Price = "1000",

            };
            List<GuestDetailstbl> GDtbl = new List<GuestDetailstbl>();
            gd1.BookingDetailsId = BookingDetailsId;
            gd2.BookingDetailsId = BookingDetailsId;
            gd3.BookingDetailsId = BookingDetailsId;
            gd4.BookingDetailsId = BookingDetailsId;
            GDtbl.Add(gd1);
            GDtbl.Add(gd2);
            GDtbl.Add(gd3);
            GDtbl.Add(gd4);
            rd1.GuestDetails = GDtbl;
            //rd2.GuestDetails = GDtbl;
            //rd3.GuestDetails = GDtbl;
            List<RoomDetailstbl> objRDT = new List<RoomDetailstbl>();
            RoomDetailstbl objrd = new RoomDetailstbl();
            objRDT.Add(rd1);
            //objRDT.Add(rd2);
            //objRDT.Add(rd3);
            for (int i=0;i<objRDT.Count();i++)
            {
                List<RoomDetailstbl> lrt = new List<RoomDetailstbl>();

                objrd.BookingDetailsId = objRDT[i].BookingDetailsId;
                objrd.RoomType = objRDT[i].RoomType;
                objrd.Adults =objRDT[i].Adults;
                objrd.Kids = objRDT[i].Kids;
                objrd.Status = objRDT[i].Status;
                objrd.Price = objRDT[i].Price;
                lrt = objRoomBL.InsertRoom(objrd).ToList();
                //lrt = objRoomBL.InsertRoom(objrd).ToList();
                lrt = objRoomBL.GetMaxRoom(objrd).ToList();
                GuestInsert(lrt.First().RoomDetailsId);
            }

        }

        GuestDetailstbl gd1 = new GuestDetailstbl();
        GuestDetailstbl gd2 = new GuestDetailstbl();
        GuestDetailstbl gd3 = new GuestDetailstbl();
        GuestDetailstbl gd4 = new GuestDetailstbl();

        List<GuestDetailstbl> GDtbl = new List<GuestDetailstbl>();
      protected void GuestInsert(int RoomDetailsId)
        {
            GuestDetailstbl gd1 = new GuestDetailstbl()
            {
                GuestId = 0,
                BookingDetailsId = 0,
                RoomDetailsId = 0,
                FirstName = txtAdultFN1.Text,
                LastName = txtAdultLN1.Text,
                Salutation = ddlAdultSalutation1.SelectedValue,
                Type = "Adult",
                Status = 1,             
                CreatedBy = 2,
                CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),

            };
            GuestDetailstbl gd2 = new GuestDetailstbl()
            {
                GuestId = 0,
                BookingDetailsId = 0,
                RoomDetailsId = 1,
                FirstName = txtAdultFN2.Text,
                LastName=txtAdultLN2.Text,
                Salutation=ddlAdultSalutation2.SelectedValue,
                Type="Adult",
                Status = 1,           
                CreatedBy = 36,
                CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
            };
            GuestDetailstbl gd3 = new GuestDetailstbl()
            {
                GuestId = 0,
                BookingDetailsId = 0,
                RoomDetailsId = 2,
                FirstName = txtChildFN1.Text,
                LastName = txtChildLN1.Text,
               Age=Convert.ToInt32(ddlChildAge1.SelectedValue),
                Type = "Child",
                Status = 1,               
                CreatedBy = 26,
                CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
            };
            GuestDetailstbl gd4 = new GuestDetailstbl()
            {
                GuestId = 0,
                BookingDetailsId = 0,
                RoomDetailsId = 2,
                FirstName = txtChildFN2.Text,
                LastName = txtChildLN2.Text,
                Age = Convert.ToInt32(ddlChildAge2.SelectedValue),
                Type = "Child",
                Status = 1,
                CreatedBy = 26,
                CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
            };
            GuestDetailstbl gd = new GuestDetailstbl();
            List<GuestDetailstbl> objgd = new List<GuestDetailstbl>();
            gd1.RoomDetailsId = RoomDetailsId;
            gd2.RoomDetailsId = RoomDetailsId;
            gd3.RoomDetailsId = RoomDetailsId;
            gd4.RoomDetailsId = RoomDetailsId;
            objgd.Add(gd1);
            objgd.Add(gd2);
            objgd.Add(gd3);
            objgd.Add(gd4);
           for(int i=0; i< objgd.Count(); i++)
            {
                GuestDetailstbl gdt = new GuestDetailstbl();

                gdt.GuestId = objgd[i].GuestId;
                gdt.BookingDetailsId =objgd[i].BookingDetailsId;
                gdt.RoomDetailsId = objgd[i].RoomDetailsId;
                gdt.FirstName = objgd[i].FirstName;
                gdt.LastName = objgd[i].LastName;
                gdt.Salutation = objgd[i].Salutation;
                gdt.Type = objgd[i].Type;
                gdt.Status = objgd[i].Status;
                gdt.CreatedBy = objgd[i].CreatedBy;
                gdt.CreatedDate = objgd[i].CreatedDate;
                
                gdt.Age = objgd[i].Age;
                GDtbl = objGBL.InsertGuest(gdt).ToList();

            }
        }
  
        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            HotelInsert();
            //BookingInsert();
            //RoomInsert();
            //GuestInsert();

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("OfflineRequest.aspx");
        }
     
        protected void GetRequestByID(int RequestId)
        {
            BookingRequesttbl br = new BookingRequesttbl();
            List<BookingRequesttbl> lbr = new List<BookingRequesttbl>();
            br.RequestId = RequestId;
            lbr = objReBL.GetBookingRequestbyId(br).ToList();
            List<BookingReqGuestDetailstbl> lstbd = new List<BookingReqGuestDetailstbl>();
            BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();

            foreach (var el in lbr)
            {
                hdnRequestId.Value = el.RequestId.ToString();
                // ddlAgency.SelectedValue = el.AgentId.ToString();
                //lblDest.Text = el.Destination;

                //txtCheckInDate.Text = Convert.ToDateTime(el.Checkin).ToShortDateString();
                //txtCheckOutDate.Text = Convert.ToDateTime(el.Checkout).ToShortDateString();

                //txtPrH.Text = el.PreferedHotels;
                //ddlSightSeeing.SelectedValue = el.SightSeeing.ToString();


           

                

                int a = 0, k = 0;
                for (int i = 0; i < el.GuestDetails.Count(); i++)
                {
                    if (el.GuestDetails[i].Type == "A" && i == 0)
                    {
                        hdnAdultGuestId1.Value = el.GuestDetails[i].GuestId.ToString();
                        txtAdultFN1.Text = el.GuestDetails[i].FirstName;
                        txtAdultLN1.Text = el.GuestDetails[i].LastName;
                        ddlAdultSalutation1.SelectedValue = el.GuestDetails[i].Salutation;
                        a++;
                    }

                    if (el.GuestDetails[i].Type == "A" && i == 1)
                    {
                        hdnAdultGuestId2.Value = el.GuestDetails[i].GuestId.ToString();
                        txtAdultFN2.Text = el.GuestDetails[i].FirstName;
                        txtAdultLN2.Text = el.GuestDetails[i].LastName;
                        ddlAdultSalutation2.SelectedValue = el.GuestDetails[i].Salutation;
                        a++;
                    }
                    if (el.GuestDetails[i].Type == "K" && (i == 1 || i == 2))
                    {
                        hdnChildGuestId1.Value = el.GuestDetails[i].GuestId.ToString();
                        txtChildFN1.Text = el.GuestDetails[i].FirstName;
                        txtChildLN1.Text = el.GuestDetails[i].LastName;
                        ddlChildAge1.SelectedValue = el.GuestDetails[i].Age;
                        k++;
                    }
                    if (el.GuestDetails[i].Type == "K" && i == 3)
                    {
                        hdnChildGuestId2.Value = el.GuestDetails[i].GuestId.ToString();
                        txtChildFN2.Text = el.GuestDetails[i].FirstName;
                        txtChildLN2.Text = el.GuestDetails[i].LastName;
                        ddlChildAge2.SelectedValue = el.GuestDetails[i].Age;
                        k++;
                    }
                }
                //ddlAdult.SelectedValue = a.ToString();
                //ddlChild.SelectedValue = k.ToString();
            }
        }
    }


}