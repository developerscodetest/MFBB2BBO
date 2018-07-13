using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using MFBDBO.Data;
using MFBDBO.Business;
using System.IO;

namespace MFBDBO.Master
{
    public partial class PreparePayments : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        AccPaymentsBL objPaymentstBL = new AccPaymentsBL();
        List<AccPaymentstbl> lpa = new List<AccPaymentstbl>();

        Bankstbl cnt = new Bankstbl();
        List<Bankstbl> lstBank = new List<Bankstbl>();

        Supplierstbl cntt = new Supplierstbl();
        List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();

        MajorAccounttbl mt = new MajorAccounttbl();
        List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();

        MinorAccounttbl nt = new MinorAccounttbl();
        List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();

        protected void Page_Load(object sender, EventArgs e)
        {
            BankBL objBankBL = new BankBL();
            lstBank = objBankBL.GetAllBanks(cnt).ToList();

            SuppliersBL objSuppliersBL = new SuppliersBL();
            lstSuppliers = objSuppliersBL.GetAllSuppliers(cntt).ToList();

            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            lstMajor = objMajorAccountBL.GetAllAccounts(mt).ToList();

            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            lstMinor = objMinorAccountBL.GetAllMinorAccount(nt).ToList();

            if (!IsPostBack)
            {
                divPM.Visible = false;
                divCheque.Visible = false;
                divDD.Visible = false;
                divBank.Visible = false;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

            //divCheque.Attributes.Remove("class");
            //divDD.Attributes.Remove("class");
            //divBank.Attributes.Remove("class");
            //divCard.Attributes.Remove("class");
            //divTD.Attributes.Remove("class");
            //divRN.Attributes.Remove("class");

            lblPaymentMode.Visible = false;
            ddlPaymentMode.Visible = false;
            lblChequeNo.Visible = false;
            txtChequeNo.Visible = false;
            lblChequeDate.Visible = false;
            txtChequeDate.Visible = false;
            lblAcNO.Visible = false;
            txtAcNo.Visible = false;
            lblDDNo.Visible = false;
            txtDDNo.Visible = false;
            lblDDDate.Visible = false;
            txtDDDate.Visible = false;
            lblBankName.Visible = false;
            txtBankName.Visible = false;
            lblCardNo.Visible = false;
            txtCardNo.Visible = false;
            lblTransactionDate.Visible = false;
            txtTransactionDate.Visible = false;
            lblReferenceNo.Visible = false;
            txtReferenceNo.Visible = false;
            Random rnd = new Random();
            int num = rnd.Next(10000);
            txtVoucherNumber.Text = "MFB" + num;
            
                GetSuppliers();
                GetMajorAccounts();
                GetMinorAccounts();                
            }            
        }

        protected void GetMajorAccounts()
        {
            List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();
            MajorAccounttbl MC = new MajorAccounttbl();
            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            MC.Status = 1;
            lstMajor = objMajorAccountBL.GetAccountsByStatus(MC).ToList();
            ListItem ma = new ListItem();
            ma.Text = "--Select--";
            ma.Value = 0.ToString();
            ddlMAccountList.Items.Add(ma);
            foreach (var mt in lstMajor)
            {
                ListItem lb = new ListItem();
                lb.Text = mt.MajorAccountName;
                lb.Value = mt.MajorAccountID.ToString();
                ddlMAccountList.Items.Add(lb);
            }
        }

        protected void GetMinorAccounts()
        {
            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            MinorAccounttbl Mn = new MinorAccounttbl();
            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            Mn.Status = 1;
            lstMinor = objMinorAccountBL.MajorAccountIDByStatus(Mn).ToList();
            ListItem mn = new ListItem();
            mn.Text = "--Select--";
            mn.Value = 0.ToString();
            ddlMinorAccountList.Items.Add(mn);
            foreach (var nt in lstMinor)
            {
                ListItem lc = new ListItem();
                lc.Text = nt.MinorAccountName;
                lc.Value = nt.MinorAccountID.ToString();
                ddlMinorAccountList.Items.Add(lc);
            }
        }

        protected void GetSuppliers()
        {
            List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
            Supplierstbl sup = new Supplierstbl();
            SuppliersBL objSuppliersBL = new SuppliersBL();
            sup.IsActive = 1;
            lstSuppliers = objSuppliersBL.GetSuppliersByStatus(sup).ToList();
            ddlToAccount.Items.Clear();
            ListItem m = new ListItem();
            m.Text = "--Select--";
            m.Value = 0.ToString();
            ddlToAccount.Items.Add(m);
            foreach (var cntt in lstSuppliers)
            {
                ListItem la = new ListItem();
                la.Text = cntt.Supplier;
                la.Value = cntt.SupplierID.ToString();
                ddlToAccount.Items.Add(la);
            }
        }        

        protected void GetBank()
        {
            List<Bankstbl> lstBank = new List<Bankstbl>();
            Bankstbl bnk = new Bankstbl();
            BankBL objbankBL = new BankBL();
            bnk.Status = 1;
            lstBank = objbankBL.GetBankIsActive(bnk).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlFromAccount.Items.Add(l);
            foreach (var cnt in lstBank)
            {
                ListItem li = new ListItem();
                li.Text = cnt.BankName;
                li.Value = cnt.BankID.ToString();
                ddlFromAccount.Items.Add(li);
            }
        }        

        protected void Reset()
        {
            //ddlPaymentType.SelectedIndex = 0;
            txtVoucherNumber.Text = string.Empty;
            ddlMAccountList.SelectedIndex = 0;
            ddlMinorAccountList.SelectedIndex = 0;
            txtPaymentDate.Text = "";
            ddlToAccount.SelectedIndex = 0;
            ddlPaymentThrough.SelectedIndex = 0;
            ddlFromAccount.SelectedIndex = 0;
            txtCurrentBal.Text = "";
            txtPayingAmount.Text = "";
            txtTotalBalance.Text = "";
            ddlPaymentMode.SelectedIndex = 0;
            txtCardNo.Text = "";
            txtChequeDate.Text = "";
            txtChequeNo.Text = "";
            txtBankName.Text = "";
            txtReferenceNo.Text = "";
            txtTransactionDate.Text = "";
            txtDDDate.Text = "";
            txtDDNo.Text = "";
            txtNarration.Text = "";
            txtAcNo.Text = "";
            BrowseFile.Attributes.Clear();
        }

        protected void InsertPayments()
        {
            AccPaymentstbl pa = new AccPaymentstbl();
            {
                //pa.PaymentType = ddlPaymentType.SelectedValue;
                pa.VoucherNo = txtVoucherNumber.Text;
                pa.MajorAccount = ddlMAccountList.Text;
                pa.MinorAccount = ddlMinorAccountList.Text;
                pa.PaymentDate = txtPaymentDate.Text;
                pa.ToAccount = ddlToAccount.SelectedValue;
                pa.PaymentThrough = ddlPaymentThrough.SelectedValue;
                pa.FromAccount = ddlFromAccount.SelectedValue;
                pa.CurrentBalance = txtCurrentBal.Text;
                pa.PayingAmount = txtPayingAmount.Text;
                pa.PaymentMode = ddlPaymentMode.SelectedValue;
                if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 1)
                {
                    pa.CdNo = txtChequeNo.Text;
                    pa.CdDate = txtChequeDate.Text;
                    pa.AcNo = txtAcNo.Text;
                    pa.BankName = txtBankName.Text;
                }
                else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 2)
                {
                    pa.CdNo = txtDDNo.Text;
                    pa.CdDate = txtDDDate.Text;
                    pa.AcNo = txtAcNo.Text;
                    pa.BankName = txtBankName.Text;
                }
                else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 3)
                {
                    pa.CardNo = txtCardNo.Text;
                    pa.TransactionDate = txtTransactionDate.Text;
                    pa.ReferenceNo = txtReferenceNo.Text;
                }
                else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 4)
                {
                    pa.TransactionDate = txtTransactionDate.Text;
                    pa.ReferenceNo = txtReferenceNo.Text;
                }
                pa.Narration = txtNarration.Text;
                pa.AttachFiles = BrowseFile.FileName;
                pa.Status = 1;
                pa.CreatedBy = 1;
                pa.CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");
            }            

            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            MinorAccounttbl mt = new MinorAccounttbl();
            mt.MinorAccountID = Convert.ToInt32(ddlMinorAccountList.SelectedValue);
            mt.Amount = string.IsNullOrEmpty(txtTotalBalance.Text) ? 0 : Convert.ToInt32(txtTotalBalance.Text);

            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            lstMinor = objMinorAccountBL.UpdateMinorAccountAmount(mt).ToList();

            List<AccPaymentstbl> lst = new List<AccPaymentstbl>();
            lst = objPaymentstBL.InsertPayments(pa).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Payments Saved Successfully');", true);
            btnSave.Visible = true;
            Reset();
        }

       

        protected void ddlPaymentThrough_SelectedIndexChanged(object sender, EventArgs e)
        {
             // 1 - Cash, 2- Bank
            if(Convert.ToInt32(ddlPaymentThrough.SelectedValue) == 1)
            {
                ddlFromAccount.Items.Clear();
                ddlFromAccount.Items.Add(new ListItem("--Select--"));
                ddlFromAccount.Items.Add(new ListItem("Cash in Hand", "1"));
                lblPaymentMode.Visible = false;
                ddlPaymentMode.Visible = false;
                divPM.Visible = false;
            }
            else if (Convert.ToInt32(ddlPaymentThrough.SelectedValue) == 2)
            {
                ddlFromAccount.Items.Clear();
                //ddlAccount.Items.Add(new ListItem("--Select--"));
                //ddlAccount.Items.Add(new ListItem("Axis Bank", "1"));
                //ddlAccount.Items.Add(new ListItem("SBI Bank", "2"));
                GetBank();
                divPM.Visible = true;
                lblPaymentMode.Visible = true;
                ddlPaymentMode.Visible = true;
            }
        }

        //protected void ddlFromAccount_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        //protected void ddlToAccount_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        protected void ddlPaymentMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 1 - Cheque, 2 - DD, 3 - Credit/Debit Card, 4 - Internet Banking
            if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 1)
            {
                divPM.Visible = true;
                divCheque.Visible = true;
                divDD.Visible = false;
                divBank.Visible = true;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

                lblPaymentMode.Visible = true;
                ddlPaymentMode.Visible = true;
                lblChequeNo.Visible = true;
                txtChequeNo.Visible = true;
                lblChequeDate.Visible = true;
                txtChequeDate.Visible = true;
                lblAcNO.Visible = true;
                txtAcNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 2)
            {
                divPM.Visible = true;
                divCheque.Visible = false;
                divDD.Visible = true;
                divBank.Visible = true;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

                lblPaymentMode.Visible = true;
                ddlPaymentMode.Visible = true;
                lblDDNo.Visible = true;
                txtDDNo.Visible = true;
                lblDDDate.Visible = true;
                txtDDDate.Visible = true;
                lblAcNO.Visible = true;
                txtAcNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 3)
            {
                divPM.Visible = true;
                divCheque.Visible = false;
                divDD.Visible = false;
                divBank.Visible = false;
                divCard.Visible = true;
                divTD.Visible = true;
                divRN.Visible = true;

                lblPaymentMode.Visible = true;
                ddlPaymentMode.Visible = true;
                lblCardNo.Visible = true;
                txtCardNo.Visible = true;
                lblTransactionDate.Visible = true;
                txtTransactionDate.Visible = true;
                lblReferenceNo.Visible = true;
                txtReferenceNo.Visible = true;

            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 4)
            {
                divPM.Visible = true;
                divCheque.Visible = false;
                divDD.Visible = false;
                divBank.Visible = false;
                divCard.Visible = false;
                divTD.Visible = true;
                divRN.Visible = true;

                lblPaymentMode.Visible = true;
                ddlPaymentMode.Visible = true;
                lblTransactionDate.Visible = true;
                txtTransactionDate.Visible = true;
                lblReferenceNo.Visible = true;
                txtReferenceNo.Visible = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertPayments();
           // UploadFile();
            if (BrowseFile.HasFile == false)
            {

            }
            else
            {
                UploadFile();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void UploadFile()
        {
            string folderPath = Server.MapPath("~/Files/Payments/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            BrowseFile.SaveAs(folderPath + Path.GetFileName(BrowseFile.FileName));

            ////Display the success message.
            //lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded.";
        }

        protected void ddlMAccountList_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            MinorAccounttbl Mn = new MinorAccounttbl();
            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            Mn.Status = 1;
            Mn.MajorAccountID = Convert.ToInt32(ddlMAccountList.SelectedValue);
            lstMinor = objMinorAccountBL.MajorAccountIDByStatus(Mn).ToList();
            ddlMinorAccountList.Items.Clear();
            ListItem mn = new ListItem();
            mn.Text = "--Select--";
            mn.Value = 0.ToString();
            ddlMinorAccountList.Items.Add(mn);
            foreach (var nt in lstMinor)
            {
                ListItem lc = new ListItem();
                lc.Text = nt.MinorAccountName;
                //lc.Text = nt..ToString();
                lc.Value = nt.MinorAccountID.ToString();
                ddlMinorAccountList.Items.Add(lc);
            }
        }

        protected void ddlMinorAccountList_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            MinorAccounttbl Mn = new MinorAccounttbl();
            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            Mn.Status = 1;
            Mn.MinorAccountID = Convert.ToInt32(ddlMinorAccountList.SelectedValue);
            lstMinor = objMinorAccountBL.GetMinorAccountById(Mn).ToList();

            txtCurrentBal.Text = lstMinor[0].Amount.ToString();
        }

        protected void txtCurrentBal_TextChanged(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtCurrentBal.Text)) && (!string.IsNullOrEmpty(txtPayingAmount.Text)))
            {
                txtTotalBalance.Text = (Convert.ToInt32(txtCurrentBal.Text) - Convert.ToInt32(txtPayingAmount.Text)).ToString();
            }
        }

        protected void txtPayingAmount_TextChanged(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtCurrentBal.Text)) && (!string.IsNullOrEmpty(txtPayingAmount.Text)))
                if(Convert.ToInt32(txtCurrentBal.Text) >= Convert.ToInt32(txtPayingAmount.Text))
                
            {
                txtTotalBalance.Text = (Convert.ToInt32(txtCurrentBal.Text) - Convert.ToInt32(txtPayingAmount.Text)).ToString();
            }
                else
                {
                    //System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "alert('alert to be displayed');", true);
                    //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('PayingAmount Shouldn't be Less than Currentbalance');", true);
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Paying Amount Shouldn't be Greaterthan Current Ballence');", true);
                }
        }        

        protected void lblPayingAmount_DataBinding1(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtCurrentBal.Text)) && (!string.IsNullOrEmpty(txtPayingAmount.Text)))
            {
                txtTotalBalance.Text = (Convert.ToInt32(txtCurrentBal.Text) - Convert.ToInt32(txtPayingAmount.Text)).ToString();
            }
        }

        protected void txtTotalBalance_TextChanged(object sender, EventArgs e)
        {

        }
    }
}