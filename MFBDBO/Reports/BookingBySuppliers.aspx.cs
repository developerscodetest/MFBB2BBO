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
    public partial class BookingbySuppliers : System.Web.UI.Page
    {
        BookingGuestRpt bgr = new BookingGuestRpt();
        List<BookingGuestRpt> lstbgr = new List<BookingGuestRpt>();
        ReportsBL objRBL = new ReportsBL();
        
        protected void Page_Load(object sender, EventArgs e)
        {           

            if (!IsPostBack)
            {
                GetSuppliers();
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
        protected void GetBookingRequest()
        {
            lstbgr = objRBL.GetAllSupplier(bgr).ToList();
            gdvBbySupplier.DataSource = lstbgr;
            gdvBbySupplier.DataBind();
        }

        protected void GetBookingSearch()
        {
            BookingGuestRpt bgr = new BookingGuestRpt();
            bgr.FromDate = txtFDate.Text;
            bgr.ToDate = txtTDate.Text;
            bgr.SupId = Convert.ToInt32(ddlSupplier.SelectedValue);
            lstbgr = objRBL.GetSupplierById(bgr).ToList();
            gdvBbySupplier.DataSource = lstbgr;
            gdvBbySupplier.DataBind();
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
            txtFDate.Text = "";
            txtTDate.Text = "";
            ddlSupplier.SelectedIndex = 0;
        }
    }
}