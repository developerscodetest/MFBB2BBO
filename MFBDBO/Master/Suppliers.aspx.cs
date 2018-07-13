using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class Suppliers : System.Web.UI.Page
    {
        SuppliersBL objSuppliersBL = new SuppliersBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {           
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            Supplierstbl ls = new Supplierstbl
            {

                Supplier = txtSupplier.Text,
                PersonName = txtName.Text,
                Email = txtEmail.Text,
                MobileNo = txtMobile.Text,
                Address = txtAddress.Text,
                ApiPurchaseDate = txtDate.Text,
                ApiKey = txtAPIKey.Text,
                ApiPurchaseValue = txtAPValue.Text,
                AgentLink = txtALink.Text,
                SupplierCode = txtSupplierCode.Text,
                UserName = txtUserName.Text,
                Password = txtPassword.Text,
                AcntName = txtAName.Text,
                AcntEmail = txtAEmail.Text,
                AcntNumber = txtANumber.Text,
                OperationName = txtOperationsName.Text,
                OperationEmail = txtOEmail.Text,
                OperationNumber = txtONumber.Text,
                MngmtName = txtManagementName.Text,
                MngmtEmail = txtMEmail.Text,
                MngmtNumber = txtMNumber.Text,
                IsActive = 1,
                CreatedBy = 1,
                CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss")
            };

            List<Supplierstbl> lst = new List<Supplierstbl>();
            lst = objSuppliersBL.SaveSuppliers(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Suppliers Saved Successfully');", true);
            Clear();
            Response.Redirect("SuppliersList.aspx");
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            Clear();
            //btnSave.Visible = true;
        }

        protected void Clear()
        {
            txtSupplier.Text = string.Empty; 
            txtName.Text = string.Empty; 
            txtEmail.Text = string.Empty; 
            txtMobile.Text = string.Empty; 
            txtAddress.Text = string.Empty; 
            txtDate.Text = string.Empty; 
            txtAPIKey.Text = string.Empty; 
            txtAPValue.Text = string.Empty; 
            txtALink.Text = string.Empty; 
            txtSupplierCode.Text = string.Empty; 
            txtUserName.Text = string.Empty; 
            txtPassword.Text = string.Empty; 
            txtAName.Text = string.Empty; 
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