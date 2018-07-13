using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;
using System.Data;
namespace MFBDBO.Master
{
    public partial class SuppliersList : System.Web.UI.Page
    {
        SuppliersBL objSuppliersBL = new SuppliersBL();
        Supplierstbl sup = new Supplierstbl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetSuppliers();
            }
        }
        protected void GetSuppliers()
        {
            List<Supplierstbl> lstSup = new List<Supplierstbl>();
            lstSup = objSuppliersBL.GetAllSuppliers(sup).ToList();

            if (lstSup.Count() >= 1)
            {
                gdvSuppliers.DataSource = lstSup;
                gdvSuppliers.DataBind();
            }
            else
            {
                DataTable dt = new DataTable();
                gdvSuppliers.DataSource = dt;
                gdvSuppliers.DataBind();
            }
            //gdvSuppliers.DataSource = lstSup;
            //gdvSuppliers.DataBind();
        }
        protected void lbtnSView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var SuppliersID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["SuppliersID"] = SuppliersID;
            Response.Redirect("SupplierView.aspx");
        }
        protected void lbtnSEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var SuppliersID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["SuppliersID"] = SuppliersID;
            Response.Redirect("SupplierEdit.aspx");
        }

        protected void GdvSuppliers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[5].Text) == 1)
                {
                    e.Row.Cells[5].Text = "Active";
                    e.Row.FindControl("lbtnSMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[5].Text) == 0)
                {
                    e.Row.Cells[5].Text = "InActive";
                    e.Row.FindControl("lbtnSMarkAsInActive").Visible = false;
                }

            }
        }
        protected void lbtnSMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[5].Text;
            Supplierstbl cnt = new Supplierstbl();
            cnt.SupplierID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                cnt.IsActive = 0;
            }
            else if (id == "InActive")
            {
                cnt.IsActive = 1;
            }
            objSuppliersBL.UpdateSuppliersIsActive(cnt);            
            GetSuppliers();
        }
        //protected void GdvSuppliers_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //}
    }
}