using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;
using System.IO;

namespace MFBDBO.Master
{
    public partial class PreparePaymentsEdit : System.Web.UI.Page
    {
        Bankstbl cnt = new Bankstbl();
        List<Bankstbl> lstBank = new List<Bankstbl>();

        Supplierstbl cntt = new Supplierstbl();
        List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();

        MajorAccounttbl mt = new MajorAccounttbl();
        List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();

        MinorAccounttbl nt = new MinorAccounttbl();
        List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();

        AccPaymentsBL objAccPaymentsBL = new AccPaymentsBL();
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
                if (Session["PaymentID"].ToString() != null)
                {
                    int PaymentID = Convert.ToInt32(Session["PaymentID"]);
                    GetPaymentsbyId(PaymentID);
                }
            }
        }

        protected string GetMajorAccounts(int mjid)
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
            var major = lstMajor.OfType<MajorAccounttbl>().Where(a => a.MajorAccountID == mjid);
            return major.Count() > 0 ? major.First().MajorAccountName : "";
        }

        protected string GetMinorAccounts(int maid)
        {
            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            MinorAccounttbl Mn = new MinorAccounttbl();
            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            Mn.Status = 1;
            lstMinor = objMinorAccountBL.GetMinorAccountByStatus(Mn).ToList();
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
            var minor = lstMinor.OfType<MinorAccounttbl>().Where(a => a.MinorAccountID == maid);
            return minor.Count() > 0 ? minor.First().MinorAccountName : "";
        }

        protected string GetSuppliers(int spid)
        {
            List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
            Supplierstbl sps = new Supplierstbl();
            SuppliersBL objSuppliersBL = new SuppliersBL();
            sps.IsActive = 1;
            lstSuppliers = objSuppliersBL.GetSuppliersByStatus(sps).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlToAccount.Items.Add(l);
            foreach (var cnt in lstSuppliers)
            {
                ListItem li = new ListItem();
                li.Text = cnt.Supplier;
                li.Value = cnt.SupplierID.ToString();
                ddlToAccount.Items.Add(li);
            }
            var suppliers = lstSuppliers.OfType<Supplierstbl>().Where(a => a.SupplierID == spid);
            return suppliers.Count() > 0 ? suppliers.First().Supplier : "";            
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

        protected void GetPaymentsbyId( int PaymentID)
        {
            AccPaymentstbl Pa = new AccPaymentstbl
            {
                PaymentID = PaymentID
            };

            List<AccPaymentstbl> lstPayments = new List<AccPaymentstbl>();
            lstPayments = objAccPaymentsBL.GetPaymentsbyId(Pa).ToList();

            foreach (var el in lstPayments)
            {
                hdnPaymentsID.Value = el.PaymentID.ToString();
                //ddlPaymentType.SelectedValue = el.PaymentType;
                txtVoucherNumber.Text = el.VoucherNo;
                GetMajorAccounts(Convert.ToInt32(el.MajorAccount));
                ddlMAccountList.SelectedValue = el.MajorAccount;
                GetMinorAccounts(Convert.ToInt32(el.MinorAccount));
                ddlMinorAccountList.SelectedValue = el.MinorAccount;
                txtPaymentDate.Text = Convert.ToDateTime(el.PaymentDate).ToShortDateString();
                GetSuppliers(Convert.ToInt32(el.ToAccount));
                ddlToAccount.SelectedValue = el.ToAccount;
                //ddlPaymentMode.SelectedValue = el.PaymentMode;
                //ddlAccount.SelectedValue = el.Accounts;
                
                // Cash 
                if (Convert.ToInt32(el.PaymentThrough) == 1)
                {

                    divPM.Visible = false;
                    divCheque.Visible = false;
                    divDD.Visible = false;
                    divBank.Visible = false;
                    divCard.Visible = false;
                    divTD.Visible = false;
                    divRN.Visible = false;

                    ddlPaymentThrough.SelectedValue = 1.ToString();
                    lblChequeNo.Visible = false;
                    txtChequeNo.Visible = false;
                    lblChequeDate.Visible = false;
                    txtChequeDate.Visible = false;
                    lblDDNo.Visible = false;
                    txtDDNo.Visible = false;
                    lblDDDate.Visible = false;
                    txtDDDate.Visible = false;
                    lblAcNO.Visible = false;
                    txtAcNo.Visible = false;
                    lblBankName.Visible = false;
                    txtBankName.Visible = false;
                    lblCardNo.Visible = false;
                    txtCardNo.Visible = false;
                    lblTransactionDate.Visible = false;
                    txtTransactionDate.Visible = false;
                    lblReferenceNo.Visible = false;
                    txtReferenceNo.Visible = false;
                    lblPaymentMode.Visible = false;
                    ddlPaymentMode.Visible = false;

                    ddlFromAccount.Items.Clear();
                    ddlFromAccount.Items.Add(new ListItem("--Select--"));
                    ddlFromAccount.Items.Add(new ListItem("Cash in hand", "1"));
                    ddlFromAccount.SelectedValue = 1.ToString();
                }
                // Bank
                else if (Convert.ToInt32(el.PaymentThrough) == 2)
                {
                    divPM.Visible = true;

                    ddlPaymentThrough.SelectedValue = 2.ToString();
                    ddlFromAccount.Items.Clear();
                    //ddlAccount.Items.Add(new ListItem("--Select--"));
                    //ddlAccount.Items.Add(new ListItem("Axis Bank", "1"));
                    //ddlAccount.Items.Add(new ListItem("SBI Bank", "2"));
                    GetBank();
                    ddlFromAccount.SelectedValue = el.FromAccount;
                    // Cheque
                    if (Convert.ToInt32(el.PaymentMode) == 1)
                    {
                        divPM.Visible = true;
                        divCheque.Visible = true;
                        divDD.Visible = false;
                        divBank.Visible = true;
                        divCard.Visible = false;
                        divTD.Visible = false;
                        divRN.Visible = false;

                        lblDDNo.Visible = false;
                        txtDDNo.Visible = false;
                        lblDDDate.Visible = false;
                        txtDDDate.Visible = false;
                        lblCardNo.Visible = false;
                        txtCardNo.Visible = false;
                        lblTransactionDate.Visible = false;
                        txtTransactionDate.Visible = false;
                        lblReferenceNo.Visible = false;
                        txtReferenceNo.Visible = false;
                        txtChequeNo.Text = el.CdNo;
                        txtChequeDate.Text = Convert.ToDateTime(el.CdDate).ToShortDateString();
                    }
                    // DD
                    else if (Convert.ToInt32(el.PaymentMode) == 2)
                    {
                        divPM.Visible = true;
                        divCheque.Visible = false;
                        divDD.Visible = true;
                        divBank.Visible = true;
                        divCard.Visible = false;
                        divTD.Visible = false;
                        divRN.Visible = false;

                        lblChequeNo.Visible = false;
                        txtChequeNo.Visible = false;
                        lblChequeDate.Visible = false;
                        txtChequeDate.Visible = false;
                        lblCardNo.Visible = false;
                        txtCardNo.Visible = false;
                        lblTransactionDate.Visible = false;
                        txtTransactionDate.Visible = false;
                        lblReferenceNo.Visible = false;
                        txtReferenceNo.Visible = false;
                        txtDDNo.Text = el.CdNo;
                        txtDDDate.Text = Convert.ToDateTime(el.CdDate).ToShortDateString();

                    }
                    // Credit/ Debit Card
                    else if (Convert.ToInt32(el.PaymentMode) == 3)
                    {
                        divPM.Visible = true;
                        divCheque.Visible = false;
                        divDD.Visible = false;
                        divBank.Visible = false;
                        divCard.Visible = true;
                        divTD.Visible = true;
                        divRN.Visible = true;

                        lblChequeNo.Visible = false;
                        txtChequeNo.Visible = false;
                        lblChequeDate.Visible = false;
                        txtChequeDate.Visible = false;
                        lblDDNo.Visible = false;
                        txtDDNo.Visible = false;
                        lblDDDate.Visible = false;
                        txtDDDate.Visible = false;
                        lblAcNO.Visible = false;
                        txtAcNo.Visible = false;
                        lblBankName.Visible = false;
                        txtBankName.Visible = false;
                    }
                    // Internet Banking
                    else if (Convert.ToInt32(el.PaymentMode) == 4)
                    {
                        divPM.Visible = true;
                        divCheque.Visible = false;
                        divDD.Visible = false;
                        divBank.Visible = false;
                        divCard.Visible = false;
                        divTD.Visible = true;
                        divRN.Visible = true;

                        lblChequeNo.Visible = false;
                        txtChequeNo.Visible = false;
                        lblChequeDate.Visible = false;
                        txtChequeDate.Visible = false;
                        lblDDNo.Visible = false;
                        txtDDNo.Visible = false;
                        lblDDDate.Visible = false;
                        txtDDDate.Visible = false;
                        lblAcNO.Visible = false;
                        txtAcNo.Visible = false;
                        lblBankName.Visible = false;
                        txtBankName.Visible = false;
                        lblCardNo.Visible = false;
                        txtCardNo.Visible = false;
                    }
                }
                txtCurrentBal.Text = el.CurrentBalance;
                txtPayingAmount.Text = el.PayingAmount;
                ddlPaymentMode.SelectedValue = el.PaymentMode;              
                
                txtAcNo.Text = el.AcNo;
                txtBankName.Text = el.BankName;
                txtCardNo.Text = el.CardNo;
                txtTransactionDate.Text = el.TransactionDate == "" ? "" : Convert.ToDateTime(el.TransactionDate).ToShortDateString();
                txtReferenceNo.Text = el.ReferenceNo;
                txtNarration.Text = el.Narration;
                lblChooseF.Text = el.AttachFiles;        

            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            AccPaymentstbl Pa = new AccPaymentstbl();

            Pa.PaymentID = Convert.ToInt32(hdnPaymentsID.Value);
            //Pa.PaymentType = ddlPaymentType.SelectedValue;
            Pa.VoucherNo = txtVoucherNumber.Text;
            Pa.MajorAccount = ddlMAccountList.SelectedValue;
            Pa.MinorAccount = ddlMinorAccountList.SelectedValue;
            Pa.PaymentDate = Convert.ToDateTime(txtPaymentDate.Text).ToString("yyyy-MM-dd");
            Pa.ToAccount = ddlToAccount.SelectedValue;
            Pa.PaymentThrough = ddlPaymentThrough.SelectedValue;
            Pa.FromAccount = ddlFromAccount.SelectedValue;
            Pa.CurrentBalance = txtCurrentBal.Text;
            Pa.PayingAmount = txtPayingAmount.Text;
            Pa.PaymentMode = ddlPaymentMode.SelectedValue;
            if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 1)
            {
                Pa.CdNo = txtChequeNo.Text;
                Pa.CdDate = Convert.ToDateTime(txtChequeDate.Text).ToString("yyyy-MM-dd");
                Pa.AcNo = txtAcNo.Text;
                Pa.BankName = txtBankName.Text;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 2)
            {
                Pa.CdNo = txtDDNo.Text;
                Pa.CdDate = Convert.ToDateTime(txtDDDate.Text).ToString("yyyy-MM-dd");
                Pa.AcNo = txtAcNo.Text;
                Pa.BankName = txtBankName.Text;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 3)
            {
                Pa.CardNo = txtCardNo.Text;
                Pa.TransactionDate = Convert.ToDateTime(txtTransactionDate.Text).ToString("yyyy-MM-dd");
                Pa.ReferenceNo = txtReferenceNo.Text;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 4)
            {
                Pa.TransactionDate = Convert.ToDateTime(txtTransactionDate.Text).ToString("yyyy-MM-dd");
                Pa.ReferenceNo = txtReferenceNo.Text;
            }
            //Pa.CdNo = Convert.ToInt32(txtChequeNo.Text);
            //Pa.CdDate = txtChequeDate.Text;
            //Pa.CdNo = Convert.ToInt32(txtDDNo.Text);
            //Pa.CdDate = txtDDDate.Text;
            //Pa.AcNo = txtAcNo.Text;
            ////Pa.BankName = txtBankName.Text;
            //Pa.CardNo = txtCardNo.Text;
            //Pa.TransactionDate = txtTransactionDate.Text;
            //Pa.ReferenceNo = txtReferenceNo.Text;
            //Pa.Comment = txtComments.Text;
            Pa.Narration = txtNarration.Text;
            Pa.AttachFiles = BrowseFile.FileName;
            List<AccPaymentstbl> lst = new List<AccPaymentstbl>();
            Pa.Status = 1;
            Pa.UpdatedBy = 1;
            Pa.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            objAccPaymentsBL.UpdatePayments(Pa).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Payments Updated Successfully');", true);
            Clear();
            //UploadFile();
            if (BrowseFile.HasFile == false)
            {

            }
            else
            {
                UploadFile();
            }

        }

        protected void ddlPaymentThrough_SelectedIndexChanged(object sender, EventArgs e)
        {

            // 1 - Cash, 2 - Bank
            if (Convert.ToInt32(ddlPaymentThrough.SelectedValue) == 1)
            {
                divPM.Visible = false;
                divCheque.Visible = false;
                divDD.Visible = false;
                divBank.Visible = false;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

                ddlFromAccount.Items.Clear();
                ddlFromAccount.Items.Add(new ListItem("--Select--"));
                ddlFromAccount.Items.Add(new ListItem("Cash in hand", "1"));
                lblPaymentMode.Visible = false;
                ddlPaymentMode.Visible = false;
                lblChequeNo.Visible = false;
                txtChequeNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAcNO.Visible = false;
                txtAcNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = false;
                txtTransactionDate.Visible = false;
                lblReferenceNo.Visible = false;
                txtReferenceNo.Visible = false;
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

        protected void ddlPaymentMode_SelectedIndexChanged(object sender, EventArgs e)
        {

            // 1 - Cheque, 2 - DD, 3 - Credit/Debit, 4 - Internet Banking 
            if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 1)
            {
                divPM.Visible = true;
                divCheque.Visible = true;
                divDD.Visible = false;
                divBank.Visible = true;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

                lblChequeNo.Visible = true;
                txtChequeNo.Visible = true;
                lblChequeDate.Visible = true;
                txtChequeDate.Visible = true;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAcNO.Visible = true;
                txtAcNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = false;
                txtTransactionDate.Visible = false;
                lblReferenceNo.Visible = false;
                txtReferenceNo.Visible = false;
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

                lblChequeNo.Visible = false;
                txtChequeNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = true;
                txtDDNo.Visible = true;
                lblDDDate.Visible = true;
                txtDDDate.Visible = true;
                lblAcNO.Visible = true;
                txtAcNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = false;
                txtTransactionDate.Visible = false;
                lblReferenceNo.Visible = false;
                txtReferenceNo.Visible = false;
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

                lblChequeNo.Visible = false;
                txtChequeNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAcNO.Visible = false;
                txtAcNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
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

                lblChequeNo.Visible = false;
                txtChequeNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAcNO.Visible = false;
                txtAcNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = true;
                txtTransactionDate.Visible = true;
                lblReferenceNo.Visible = true;
                txtReferenceNo.Visible = true;
            }
        }

        protected void Clear()
        {
            //PaymentID, PaymentType, VoucherNo, PaymentDate, PayTo, PaymentMode, Accounts, CurrentBalance,
            //PayMode, CdNo, CdDate, AcNo, CardNo, TransactionDate, ReferenceNo, Narration, 

            //ddlPaymentType.SelectedIndex = 0;
            txtVoucherNumber.Text = string.Empty;
            ddlMAccountList.SelectedIndex = 0;
            ddlMinorAccountList.SelectedIndex = 0;
            txtPaymentDate.Text = string.Empty;
            ddlToAccount.SelectedIndex = 0;
            ddlPaymentThrough.SelectedIndex = 0;
            ddlFromAccount.SelectedIndex = 0;            
            txtCurrentBal.Text = string.Empty;
            txtPayingAmount.Text = string.Empty;
            ddlPaymentMode.SelectedIndex = 0;
            txtChequeNo.Text = string.Empty;
            txtChequeDate.Text = string.Empty;
            txtDDNo.Text = string.Empty;
            txtDDDate.Text = string.Empty;
            txtAcNo.Text = string.Empty;
            txtBankName.Text = string.Empty;
            txtCardNo.Text = string.Empty;
            txtTransactionDate.Text = string.Empty;
            txtReferenceNo.Text = string.Empty;
            //txtComments.Text = string.Empty;
            txtNarration.Text = string.Empty;
            lblChooseF.Text = string.Empty;
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


    }
}