using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MFBDBO.Data;
using MFBDBO.Business;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Master
{
    public partial class Banks : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        BankBL objBankBL = new BankBL();
        List<Bankstbl> lba = new List<Bankstbl>();
        Bankstbl ba = new Bankstbl();
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if(!IsPostBack)
            {
                btnUpdate.Visible = false;
                if(Session["BankID"] != null)
                {
                    GetBanksById();
                    
                }  
                else
                {
                    Reset();
                }                  
            }
        }

        protected void InsertBank()
        {
           
            ba.BankName = txtBankName.Text;
            ba.Branch = txtBranch.Text;
            ba.Address = txtAddress.Text;
            ba.AccountNumber = txtAcNo.Text;
            ba.AccountName = txtAccountName.Text;
            ba.IfscCode = txtIfsc.Text;
            ba.Type = ddlType.SelectedValue;
            ba.Status = 1;
            ba.CreatedBy = 1;
            ba.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd");
            //ba.UpdatedBy = 1;
            //ba.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd");
            lba = objBankBL.InsertBank(ba).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnUpdate.Visible = false;
            btnSave.Visible = true;
            
                  Reset();
        }
        protected void Reset()
        {

            txtBankName.Text = "";
            txtBranch.Text = "";
            txtAddress.Text = "";
            txtAccountName.Text = "";
            txtAcNo.Text = "";
            txtIfsc.Text = "";
            ddlType.SelectedIndex = 0;
            
        }
        protected void UpdateBank()
        {
            ba.BankID = Convert.ToInt32(hdnBankID.Value);
            ba.BankName = txtBankName.Text;
            ba.Branch = txtBranch.Text;
            ba.Address = txtAddress.Text;
            ba.AccountNumber = txtAcNo.Text;
            ba.AccountName = txtAccountName.Text;
            ba.IfscCode = txtIfsc.Text;
            ba.Type = ddlType.SelectedValue;        
           // ba.Status = 1;
            //ba.CreatedBy = 1;
            //ba.CreatedDate = DateTime.Now.ToString();
            ba.UpdatedBy = 1;
            ba.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd");

            lba = objBankBL.UpdateBank(ba).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Accounts Updated Successfully');", true);
        Reset();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void GetBanksById()
        {
            int id = Convert.ToInt32(Session["BankID"]);
            Bankstbl ba = new Bankstbl();
            ba.BankID = Convert.ToInt32(id.ToString());
            List<Bankstbl> lba = new List<Bankstbl>();
            lba = objBankBL.GetBankbyId(ba).ToList();

            foreach (var el in lba)
            {
                hdnBankID.Value = Convert.ToString(el.BankID);
                txtBankName.Text = el.BankName;
                txtBranch.Text = el.Branch;
                txtAddress.Text = el.Address;
                txtAcNo.Text = el.AccountNumber;
                txtAccountName.Text = el.AccountName;
                txtIfsc.Text = el.IfscCode;
                ddlType.SelectedValue = el.Type;
                
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
            Session["BankID"] = null;

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertBank();
            Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Reset();
            Response.Redirect("BanksList.aspx");
          
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateBank();
        
        }
    }
}