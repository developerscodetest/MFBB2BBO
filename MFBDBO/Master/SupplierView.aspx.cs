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
    public partial class SupplierView : System.Web.UI.Page
    {
        SuppliersBL objSuppliersBL = new SuppliersBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SuppliersID"].ToString() != null)
                {
                    int SuppliersID = Convert.ToInt32(Session["SuppliersID"]);
                    GetSuppliersById(SuppliersID);
                }
            }
        }

        protected void GetSuppliersById(int SuppliersID)
        {
            Supplierstbl Sup = new Supplierstbl
            {
                SupplierID = SuppliersID
            };

            List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
            lstSuppliers = objSuppliersBL.GetSuppliersById(Sup).ToList();

            foreach (var el in lstSuppliers)
            {
                hdnSupplierID.Value = el.SupplierID.ToString();                
                lblGRNConnect.Text = el.Supplier;
                lblSEmail.Text = el.Email;
                lblNam.Text = el.PersonName;
                lblSMobile.Text = el.MobileNo;
                lblAdd.Text = el.Address;
                lblAgntLnk.Text = el.AgentLink;
                lblAgntCd.Text = el.SupplierCode;
                lblUN.Text = el.UserName;
                lblPasswrd.Text = el.Password;
                lblAPDate.Text = Convert.ToDateTime(el.ApiPurchaseDate).ToShortDateString();
                lblAPValue.Text = el.ApiPurchaseValue;
                lblApiKey.Text = el.ApiKey;
                txtAName.Text = el.AcntName;
                txtOperationsName.Text = el.OperationName;
                txtManagementName.Text = el.MngmtName;
                txtAEmail.Text = el.AcntEmail;
                txtOEmail.Text = el.OperationEmail;
                txtMEmail.Text = el.MngmtEmail;
                txtANumber.Text = el.AcntNumber;
                txtONumber.Text = el.OperationNumber;
                txtMNumber.Text = el.MngmtNumber;
            }
        }        
    }
}