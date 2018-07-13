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
    public partial class PaymentsList : System.Web.UI.Page
    {
        Supplierstbl cntt = new Supplierstbl();
        List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();

        AccPaymentsBL objAccPaymentsBL = new AccPaymentsBL();
        AccPaymentstbl AP = new AccPaymentstbl();

        protected void Page_Load(object sender, EventArgs e)
        {
            SuppliersBL objSuppliersBL = new SuppliersBL();
            lstSuppliers = objSuppliersBL.GetAllSuppliers(cntt).ToList();

            if (!IsPostBack)
            {
                GetPayments();
            }
        }

        //protected string GetSuppliers(int spid)
        //{
        //    List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
        //    Supplierstbl sps = new Supplierstbl();
        //    SuppliersBL objSuppliersBL = new SuppliersBL();
        //    lstSuppliers = objSuppliersBL.GetAllSuppliers(sps).ToList();
        //    var supplier = lstSuppliers.OfType<Supplierstbl>().Where(a => a.SupplierID == spid);
        //    return supplier.First().AgencyName;
        //}

        protected string GetSuppliers()
        {
            List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
            Supplierstbl sps = new Supplierstbl();
            SuppliersBL objSuppliersBL = new SuppliersBL();
            lstSuppliers = objSuppliersBL.GetAllSuppliers(sps).ToList();
           
            foreach (var cnt in lstSuppliers)
            {
                sps.Supplier = cnt.Supplier;
            }
            
            return sps.Supplier;
        }
        
        protected void GetPayments()
        {
            List<AccPaymentstbl> lstAP = new List<AccPaymentstbl>();
            lstAP = objAccPaymentsBL.GetAllPayments(AP).ToList();
            gdvAccPayments.DataSource = lstAP;
            gdvAccPayments.DataBind();
        }

        protected void lbtnPView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var PaymentID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["PaymentID"] = PaymentID;
            Response.Redirect("PreparePaymentsView.aspx");
        }

        protected void lbtnPEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var PaymentID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["PaymentID"] = PaymentID;
            Response.Redirect("PreparePaymentsEdit.aspx");
        }

        protected void GdvAccPayments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[4].Text) == 1)
                {
                    e.Row.Cells[4].Text = "Cash";
                }
                else if (Convert.ToInt32(e.Row.Cells[4].Text) == 2)
                {
                    e.Row.Cells[4].Text = "Bank";
                }
                //else if (Convert.ToInt32(e.Row.Cells[4].Text) == 3)
                //{
                //    e.Row.Cells[4].Text = "Credit/Debit Card";
                //}
                //else if (Convert.ToInt32(e.Row.Cells[4].Text) == 4)
                //{
                //    e.Row.Cells[4].Text = "Internet Banking";
                //}

                var lst = lstSuppliers;
                var val = lst.OfType<Supplierstbl>().Where(d => d.SupplierID == Convert.ToInt32(e.Row.Cells[2].Text));
                e.Row.Cells[2].Text = val.Count() <= 0 ? "" : val.First().Supplier;
                //e.Row.Cells[2].Text = Convert.ToString(e.Row.Cells[2].Text).ToString();
                e.Row.Cells[3].Text = Convert.ToDateTime(e.Row.Cells[3].Text).ToShortDateString();

                //if (Convert.ToInt32(e.Row.Cells[4].Text) == 1)
                //{
                //    e.Row.Cells[4].Text = "Active";
                //    e.Row.FindControl("lbtnPMarkAsActive").Visible = false;
                //}
                //else if (Convert.ToInt32(e.Row.Cells[4].Text) == 0)
                //{
                //    e.Row.Cells[4].Text = "InActive";
                //    e.Row.FindControl("lbtnPMarkAsInActive").Visible = false;
                //}
            }
        }

        //protected void lbtnPMarkAsActive_Click(object sender, EventArgs e)
        //{
        //    LinkButton lbtn = (LinkButton)sender;
        //    GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
        //    var val = gvr.DataItemIndex;
        //    var id = gvr.Cells[4].Text;
        //    AccPaymentstbl cnt = new AccPaymentstbl();
        //    cnt.PaymentID = Convert.ToInt32(gvr.Cells[0].Text);
        //    if (id == "Active")
        //    {
        //        cnt.Status = 0;
        //    }
        //    else if (id == "InActive")
        //    {
        //        cnt.Status = 1;
        //    }
        //    objAccPaymentsBL.UpdatePaymentsStatus(cnt);
        //    GetPayments();
        //}
    }    
}