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
    public partial class SupplierEdit : System.Web.UI.Page
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
                txtSupplier.Text = el.Supplier;
                txtEmail.Text = el.Email;
                txtName.Text = el.PersonName;
                txtMobile.Text = el.MobileNo;
                txtAddress.Text = el.Address;
                txtAPDate.Text = Convert.ToDateTime(el.ApiPurchaseDate).ToShortDateString();
                txtAPValue.Text = el.ApiPurchaseValue;
                txtAPIKey.Text = el.ApiKey;
                txtALink.Text = el.AgentLink;
                txtSupplierCode.Text = el.SupplierCode;
                txtUserName.Text = el.UserName;
                txtPassword.Text = el.Password;
                txtAccounts.Text = el.AcntName;
                txtOperationsName.Text = el.OperationName;
                txtManagementName.Text = el.MngmtName;
                txtAEmail.Text = el.AcntEmail;
                txtOEmail.Text = el.OperationEmail;
                txtMEmail.Text = el.MngmtEmail;
                txtANumber.Text = el.AcntNumber;
                txtONumber.Text = el.OperationNumber;
                txtMNumber.Text = el.MngmtNumber;
                hdnSupplierID.Value = el.SupplierID.ToString();
                //hdnAddress.Value = el.Address;
                //hdnAgentLink.Value = el.AgentLink;
                //hdnAgentCode.Value = el.AgentCode;
                //hdnUserName.Value = el.UserName;
                //hdnPassword.Value = el.Password;
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Supplierstbl Sup = new Supplierstbl();        
                Sup.SupplierID = Convert.ToInt32(hdnSupplierID.Value);
                Sup.Address = txtAddress.Text;
                Sup.AgentLink = txtALink.Text;
                Sup.SupplierCode = txtSupplierCode.Text;
                Sup.UserName = txtUserName.Text;
                Sup.Password = txtPassword.Text;
                Sup.Supplier = txtSupplier.Text;
                Sup.PersonName = txtName.Text;
                Sup.Email = txtEmail.Text;
                Sup.MobileNo = txtMobile.Text;
                Sup.ApiPurchaseDate = Convert.ToDateTime(txtAPDate.Text).ToString("yyyy-MM-dd");
                Sup.ApiKey = txtAPIKey.Text;
                Sup.ApiPurchaseValue = txtAPValue.Text;
                Sup.AcntName = txtAccounts.Text;
                Sup.AcntEmail = txtAEmail.Text;
                Sup.AcntNumber = txtANumber.Text;
                Sup.OperationName = txtOperationsName.Text;
                Sup.OperationEmail = txtOEmail.Text;
                Sup.OperationNumber = txtONumber.Text;
                Sup.MngmtName = txtManagementName.Text;
                Sup.MngmtEmail = txtMEmail.Text;
                Sup.MngmtNumber = txtMNumber.Text;
            List<Supplierstbl> lst = new List<Supplierstbl>();
                Sup.IsActive = 1;
                Sup.UpdatedBy = 1;
                Sup.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            objSuppliersBL.UpdateSuppliers(Sup).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Suppliers Updated Successfully');", true);
            Clear();
            Response.Redirect("SuppliersList.aspx");

        }
        protected void Clear()
        {
            txtSupplier.Text = string.Empty; 
            txtName.Text = string.Empty; 
            txtEmail.Text = string.Empty; 
            txtMobile.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtALink.Text = string.Empty;
            txtSupplierCode.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtAPDate.Text = string.Empty;
            txtAPIKey.Text = string.Empty; 
            txtAPValue.Text = string.Empty;
            txtAccounts.Text = string.Empty; 
            txtAEmail.Text = string.Empty; 
            txtANumber.Text = string.Empty; 
            txtOperationsName.Text = string.Empty; 
            txtOEmail.Text = string.Empty; 
            txtONumber.Text = string.Empty; 
            txtManagementName.Text = string.Empty; 
            txtMEmail.Text = string.Empty; 
            txtMNumber.Text = string.Empty; 
        }
    }
}