using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class Issues : System.Web.UI.Page
    {
        Booking b = new Booking();
        List<Booking> lb = new List<Booking>();
        BookingDetailstbl cnt = new BookingDetailstbl();
        List<BookingDetailstbl> lstBooking = new List<BookingDetailstbl>();

        Hotelstbl hs = new Hotelstbl();
        List<Hotelstbl> lsthotel = new List<Hotelstbl>();

        AllBookingstbl ls = new AllBookingstbl();
        List<AllBookingstbl> lstlAllbooking = new List<AllBookingstbl>();

        Gueststbl gs = new Gueststbl();
        List<Gueststbl> lstGuest = new List<Gueststbl>();

        Roomstbl rs = new Roomstbl();
        List<Roomstbl> lstRooms = new List<Roomstbl>();

        Supplierstbl sp = new Supplierstbl();
        List<Supplierstbl> lstsup = new List<Supplierstbl>();

        Agentstbl ag = new Agentstbl();
        List<Agentstbl> lstagt = new List<Agentstbl>();

        
        Employeetbl cntt = new Employeetbl();
        List<Employeetbl> lstEmployee = new List<Employeetbl>();        

        IssuesBL objIssuesBL = new IssuesBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            AllBookingsBL objAllBookingsBL = new AllBookingsBL();
            lb = objAllBookingsBL.GetAllBookings(ls, gs, hs, rs, sp, ag).ToList();

            EmployeeBL objEmployeeBL = new EmployeeBL();
            lstEmployee = objEmployeeBL.GetAllEmployee(cntt).ToList();

            if (!IsPostBack)
            {
              GetEmployee();
                GetBookings();
            }
        }
        
        protected void IssuesInsert()
        {
            Issuestbl iss = new Issuestbl
            {
                BookingID = Convert.ToInt32(ddlBookingID.Text),
                Issue = txtIssue.Text,
                Status = Convert.ToInt32(ddlStatus.SelectedValue),
                Priority = Convert.ToInt32(ddlPriority.SelectedValue),
                AssignToEmployee = ddlAssignToEmployee.Text,
               // Note = txtNote.Text,
                IsActive = 1,
                CreatedBy = 1,
                CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
               
            };
            List<Issuestbl> lst = new List<Issuestbl>();
            lst = objIssuesBL.InsertIssues(iss).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnSave.Visible = true;
        }

        protected void GetBookings()
        {
            List<BookingDetailstbl> lstBooking = new List<BookingDetailstbl>();
            BookingDetailstbl bd = new BookingDetailstbl();
            AllBookingsBL objAllBookingsBL = new AllBookingsBL();
            bd.Status = "1";
            lb = objAllBookingsBL.GetAllBookings(ls, gs, hs, rs, sp, ag).ToList();
            ListItem b = new ListItem();
            b.Text = "--Select--";
            b.Value = 0.ToString();
            ddlBookingID.Items.Add(b);
            foreach (var cntt in lstBooking)
            {
                ListItem lb = new ListItem();
                lb.Text = cnt.AgentBookingId;
                lb.Value = cnt.BookingDetailsId.ToString();
                ddlBookingID.Items.Add(lb);
            }
        }

        protected void GetEmployee()
        {
            List<Employeetbl> lstEmployee = new List<Employeetbl>();
            Employeetbl Em = new Employeetbl();
            EmployeeBL objEmployeeBL = new EmployeeBL();
            Em.Status = 1;
            lstEmployee = objEmployeeBL.GetAllEmployee(Em).ToList();
            ListItem m = new ListItem();
            m.Text = "--Select--";
            m.Value = 0.ToString();
            ddlAssignToEmployee.Items.Add(m);
            foreach (var cntt in lstEmployee)
            {
                ListItem la = new ListItem();
                la.Text = cntt.FirstName + " " + cntt.LastName;
                la.Value = cntt.EmpId.ToString();
                ddlAssignToEmployee.Items.Add(la);
            }
        }
        
        internal void Reset()
        {
            ddlBookingID.Visible = true;
            ddlStatus.SelectedIndex = 0;
            ddlPriority.SelectedIndex = 0;
            ddlAssignToEmployee.Visible = true;
            txtIssue.Text = "";
           // txtNote.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            IssuesInsert();
            Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
                
    }
}