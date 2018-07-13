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
    public partial class ReceiptsEdit : System.Web.UI.Page
    {
        Bankstbl cnt = new Bankstbl();
        List<Bankstbl> lstBank = new List<Bankstbl>();

        Agentstbl cntt = new Agentstbl();
        List<Agentstbl> lstAgents = new List<Agentstbl>();

        MajorAccounttbl mt = new MajorAccounttbl();
        List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();

        MinorAccounttbl nt = new MinorAccounttbl();
        List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();

        AccReceiptsBL objAccReceiptsBL = new AccReceiptsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            BankBL objBankBL = new BankBL();
            lstBank = objBankBL.GetAllBanks(cnt).ToList();

            AgentsBL objAgentsBL = new AgentsBL();
            lstAgents = objAgentsBL.GetAllAgents(cntt).ToList();

            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            lstMajor = objMajorAccountBL.GetAllAccounts(mt).ToList();

            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            lstMinor = objMinorAccountBL.GetAllMinorAccount(nt).ToList();

            if (!IsPostBack)
            {
                if (Session["ReceiptID"].ToString() != null)
                {
                    int ReceiptID = Convert.ToInt32(Session["ReceiptID"]);
                    GetAccReceiptById(ReceiptID);
                }
            }
        }

        protected string GetMajorAccounts( int mjid )
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
            //return major.First().MajorAccountName;
            return major.Count() > 0 ? major.First().MajorAccountName : "";
        }

        protected string GetMinorAccounts( int maid)
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
            //return minor.First().MinorAccountName;
            return minor.Count() > 0 ? minor.First().MinorAccountName : "";
        }

        protected string GetAgents( int agid )
        {
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl ags = new Agentstbl();
            AgentsBL objAgentsBL = new AgentsBL();
            ags.Status = 1;
            lstAgents = objAgentsBL.GetAgentsByStatus(ags).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlFromAccount.Items.Add(l);
            foreach (var cnt in lstAgents)
            {
                ListItem li = new ListItem();
                li.Text = cnt.AgencyName;
                li.Value = cnt.AgentID.ToString();
                ddlFromAccount.Items.Add(li);
            }            
            var agent = lstAgents.OfType<Agentstbl>().Where(a => a.AgentID == agid);
            //return agent.First().AgencyName;
            return agent.Count() > 0 ? agent.First().AgencyName : "";
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
            ddlToAccount.Items.Add(l);
            foreach (var cnt in lstBank)
            {
                ListItem li = new ListItem();
                li.Text = cnt.BankName;
                li.Value = cnt.BankID.ToString();
                ddlToAccount.Items.Add(li);
            }
        }

        protected void GetAccReceiptById(int ReceiptID)
        {
            AccReceiptstbl AR = new AccReceiptstbl
            {
                ReceiptID = ReceiptID
            };

            List<AccReceiptstbl> lstAccReceipt = new List<AccReceiptstbl>();
            lstAccReceipt = objAccReceiptsBL.GetAccReceiptById(AR).ToList();

            foreach (var el in lstAccReceipt)
            {              
                hdnReceiptID.Value = el.ReceiptID.ToString();
                txtVNo.Text = el.VoucherNo;
                GetMajorAccounts(Convert.ToInt32(el.MajorAccount));
                ddlMAccountList.SelectedValue = el.MajorAccount;
                GetMinorAccounts(Convert.ToInt32(el.MinorAccount));
                ddlMinorAccountList.SelectedValue = el.MinorAccount;
                txtRDate.Text = Convert.ToDateTime(el.ReceiveDate).ToShortDateString();
                GetAgents(Convert.ToInt32(el.FromAccount));
                ddlFromAccount.SelectedValue = el.FromAccount;
                
                //ddlDepositTo.SelectedValue = el.DepositTo;     

                // Cash 
                if (Convert.ToInt32(el.ReceivedThrough) == 1)
                {
                    divPM.Visible = false;
                    divCheque.Visible = false;
                    divDD.Visible = false;
                    divBank.Visible = false;
                    divCard.Visible = false;
                    divTD.Visible = false;
                    divRN.Visible = false;

                    ddlReceivedThrough.SelectedValue = 1.ToString();
                    lblChequeNo.Visible = false;
                    txtCheckNo.Visible = false;
                    lblChequeDate.Visible = false;
                    txtChequeDate.Visible = false;
                    lblDDNo.Visible = false;
                    txtDDNo.Visible = false;
                    lblDDDate.Visible = false;
                    txtDDDate.Visible = false;
                    lblAccountNo.Visible = false;
                    txtAcNo.Visible = false;
                    lblBankName.Visible = false;
                    txtBankName.Visible = false;
                    lblCardNo.Visible = false;
                    txtCardNo.Visible = false;
                    lblTransactionDate.Visible = false;
                    txtTDate.Visible = false;
                    lblReferenceNo.Visible = false;
                    txtReferenceNo.Visible = false;
                    lblPaymentMode.Visible = false;
                    ddlPaymentMode.Visible = false;

                    ddlToAccount.Items.Clear();
                    ddlToAccount.Items.Add(new ListItem("--Select--"));
                    ddlToAccount.Items.Add(new ListItem("Cash in hand", "1"));
                    ddlToAccount.SelectedValue = 1.ToString();
                    //divPM.Visible = false;
                }
                // Bank
                else if (Convert.ToInt32(el.ReceivedThrough) == 2)
                {
                    divPM.Visible = true;

                    ddlReceivedThrough.SelectedValue = 2.ToString();
                    ddlToAccount.Items.Clear();
                    //ddlReceiptMode.Items.Add(new ListItem("--Select--"));
                    //ddlReceiptMode.Items.Add(new ListItem("Axis Bank", "2"));
                    //ddlReceiptMode.Items.Add(new ListItem("HDFC Bank", "3"));
                    //ddlReceiptMode.Items.Add(new ListItem("SBI Bank", "4"));
                    //ddlReceiptMode.Items.Add(new ListItem("ICICI Bank", "5"));
                    GetBank();
                    //divPM.Visible = true;
                    ddlToAccount.SelectedValue = el.ToAccount;
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
                        txtTDate.Visible = false;
                        lblReferenceNo.Visible = false;
                        txtReferenceNo.Visible = false;
                        txtCheckNo.Text = el.ChequeNo.ToString();
                        txtChequeDate.Text = Convert.ToDateTime(el.ChequeDate).ToShortDateString();

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
                        txtCheckNo.Visible = false;
                        lblChequeDate.Visible = false;
                        txtChequeDate.Visible = false;
                        lblCardNo.Visible = false;
                        txtCardNo.Visible = false;
                        lblTransactionDate.Visible = false;
                        txtTDate.Visible = false;
                        lblReferenceNo.Visible = false;
                        txtReferenceNo.Visible = false;
                        txtDDNo.Text = el.DDNO.ToString();
                        txtDDDate.Text = Convert.ToDateTime(el.Date).ToShortDateString();
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
                        txtCheckNo.Visible = false;
                        lblChequeDate.Visible = false;
                        txtChequeDate.Visible = false;
                        lblDDNo.Visible = false;
                        txtDDNo.Visible = false;
                        lblDDDate.Visible = false;
                        txtDDDate.Visible = false;
                        lblAccountNo.Visible = false;
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
                        txtCheckNo.Visible = false;
                        lblChequeDate.Visible = false;
                        txtChequeDate.Visible = false;
                        lblDDNo.Visible = false;
                        txtDDNo.Visible = false;
                        lblDDDate.Visible = false;
                        txtDDDate.Visible = false;
                        lblAccountNo.Visible = false;
                        txtAcNo.Visible = false;
                        lblBankName.Visible = false;
                        txtBankName.Visible = false;
                        lblCardNo.Visible = false;
                        txtCardNo.Visible = false;
                    }
                }
                //ddlReceiptMode.SelectedValue = el.ReceiptMode;
                txtCB.Text = el.CurrentBalance;
                txtReceivingAmount.Text = el.ReceivingAmount;
                ddlPaymentMode.SelectedValue = el.PaymentMode;
               
                
                txtAcNo.Text = el.AccountNO;
                txtBankName.Text = el.BankName;
                txtCardNo.Text = el.CardNo;
                txtTDate.Text = el.TransactionDate == "" ? "" : Convert.ToDateTime(el.TransactionDate).ToShortDateString();                
                txtReferenceNo.Text = el.ReferenceNo;
                //txtComments.Text = el.Comment;
                txtNrtn.Text = el.Narration;
                lblChooseF.Text = el.AttachFiles;
                //GetAgents();
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            AccReceiptstbl AR = new AccReceiptstbl();
            AR.ReceiptID = Convert.ToInt32(hdnReceiptID.Value);
            AR.VoucherNo = txtVNo.Text;
            AR.MajorAccount = ddlMAccountList.SelectedValue;
            AR.MinorAccount = ddlMinorAccountList.SelectedValue;
            AR.ReceiveDate = Convert.ToDateTime(txtRDate.Text).ToString("yyyy-MM-dd");
            AR.FromAccount = ddlFromAccount.SelectedValue;
            AR.ReceivedThrough = ddlReceivedThrough.SelectedValue;            
            AR.ToAccount = ddlToAccount.SelectedValue;
            AR.CurrentBalance  = txtCB.Text;
            AR.ReceivingAmount = txtReceivingAmount.Text;
            AR.PaymentMode = ddlPaymentMode.SelectedValue;
            //Pa.PaymentMode = ddlPaymentMode.SelectedValue;
            if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 1)
            {
                AR.ChequeNo = string.IsNullOrEmpty(txtCheckNo.Text) ? 0 : Convert.ToInt32(txtCheckNo.Text);
                AR.ChequeDate = Convert.ToDateTime(txtChequeDate.Text).ToString("yyyy-MM-dd");
                AR.AccountNO = txtAcNo.Text;
                AR.BankName = txtBankName.Text;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 2)
            {
                AR.DDNO = string.IsNullOrEmpty(txtDDNo.Text) ? 0 : Convert.ToInt32(txtDDNo.Text);
                AR.Date = Convert.ToDateTime(txtDDDate.Text).ToString("yyyy-MM-dd");
                AR.AccountNO = txtAcNo.Text;
                AR.BankName = txtBankName.Text;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 3)
            {
                AR.CardNo = txtCardNo.Text;
                AR.TransactionDate = Convert.ToDateTime(txtTDate.Text).ToString("yyyy-MM-dd");
                AR.ReferenceNo = txtReferenceNo.Text;
            }
            else if (Convert.ToInt32(ddlPaymentMode.SelectedValue) == 4)
            {
                AR.TransactionDate = Convert.ToDateTime(txtTDate.Text).ToString("yyyy-MM-dd");
                AR.ReferenceNo = txtReferenceNo.Text;
            }
            //AR.ChequeNo = string.IsNullOrEmpty(txtCheckNo.Text) ? 0 : Convert.ToInt32(txtCheckNo.Text);
            ////string.IsNullOrEmpty(txtCheckNo.Text) ? 0 : Convert.ToInt32(txtCheckNo.Text);
            //AR.ChequeDate = Convert.ToDateTime(txtChequeDate.Text).ToString("yyyy-MM-dd");
            //AR.DDNO = string.IsNullOrEmpty(txtDDNo.Text) ? 0 : Convert.ToInt32(txtDDNo.Text);
            ////string.IsNullOrEmpty(txtDDNo.Text) ? 0 : Convert.ToInt32(txtDDNo.Text);
            //AR.Date = Convert.ToDateTime(txtDDDate.Text).ToString("yyyy-MM-dd");
            //AR.AccountNO = txtAcNo.Text;
            //AR.BankName = txtBankName.Text;
            //AR.CardNo  = txtCardNo.Text;
            //AR.TransactionDate  = Convert.ToDateTime(txtTDate.Text).ToString("yyyy-MM-dd");
            //AR.ReferenceNo = txtReferenceNo.Text;
            //AR.Comment = txtComments.Text;
            AR.Narration = txtNrtn.Text;
            AR.AttachFiles = UploadDoc.FileName;
            List<AccReceiptstbl> lst = new List<AccReceiptstbl>();
            AR.IsActive = 1;
            AR.UpdatedBy = 1;
            AR.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            objAccReceiptsBL.UpdateAccReceipt(AR).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('AccountReceipts Updated Successfully');", true);
            Clear();
            //UploadFile();

            if (UploadDoc.HasFile == false)
            {

            }
            else
            {
                UploadFile();
            }

        }

        protected void ddlReceivedThrough_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 1 - Cash, 2 - Bank
            if (Convert.ToInt32(ddlReceivedThrough.SelectedValue) == 1)
            {
                divPM.Visible = false;
                divCheque.Visible = false;
                divDD.Visible = false;
                divBank.Visible = false;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

                ddlToAccount.Items.Clear();
                ddlToAccount.Items.Add(new ListItem("--Select--"));
                ddlToAccount.Items.Add(new ListItem("Cash in hand", "1"));
                lblPaymentMode.Visible = false;
                ddlPaymentMode.Visible = false;
                lblChequeNo.Visible = false;
                txtCheckNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAccountNo.Visible = false;
                txtAcNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = false;
                txtTDate.Visible = false;
                lblReferenceNo.Visible = false;
                txtReferenceNo.Visible = false;
                
            }
            else if (Convert.ToInt32(ddlReceivedThrough.SelectedValue) == 2)
            {
                ddlToAccount.Items.Clear();
                //ddlReceiptMode.Items.Add(new ListItem("--Select--"));
                //ddlReceiptMode.Items.Add(new ListItem("Axis Bank", "2"));
                //ddlReceiptMode.Items.Add(new ListItem("HDFC Bank", "3"));
                //ddlReceiptMode.Items.Add(new ListItem("SBI Bank", "4"));
                //ddlReceiptMode.Items.Add(new ListItem("ICICI Bank", "5"));
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
                txtCheckNo.Visible = true;
                lblChequeDate.Visible = true;
                txtChequeDate.Visible = true;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAccountNo.Visible = true;
                txtAcNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = false;
                txtTDate.Visible = false;
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
                txtCheckNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = true;
                txtDDNo.Visible = true;
                lblDDDate.Visible = true;
                txtDDDate.Visible = true;
                lblAccountNo.Visible = true;
                txtAcNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = false;
                txtTDate.Visible = false;
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
                txtCheckNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAccountNo.Visible = false;
                txtAcNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
                lblCardNo.Visible = true;
                txtCardNo.Visible = true;
                lblTransactionDate.Visible = true;
                txtTDate.Visible = true;
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
                txtCheckNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDDDate.Visible = false;
                txtDDDate.Visible = false;
                lblAccountNo.Visible = false;
                txtAcNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
                lblCardNo.Visible = false;
                txtCardNo.Visible = false;
                lblTransactionDate.Visible = true;
                txtTDate.Visible = true;
                lblReferenceNo.Visible = true;
                txtReferenceNo.Visible = true;
            }
        }

        protected void Clear()
        {
            txtVNo.Text = string.Empty;
            ddlMAccountList.SelectedIndex = 0;
            ddlMinorAccountList.SelectedIndex = 0;
            txtRDate.Text = string.Empty;
            ddlFromAccount.SelectedIndex = 0;
            ddlReceivedThrough.SelectedIndex = 0;
            ddlToAccount.SelectedIndex = 0;
            txtCB.Text = string.Empty;
            txtReceivingAmount.Text = string.Empty;
            ddlPaymentMode.SelectedIndex = 0;
            txtCheckNo.Text = string.Empty;
            txtChequeDate.Text = string.Empty;
            txtDDNo.Text = string.Empty;
            txtDDDate.Text = string.Empty;
            txtAcNo.Text = string.Empty;
            txtBankName.Text = string.Empty;
            txtCardNo.Text = string.Empty;
            txtTDate.Text = string.Empty;
            txtReferenceNo.Text = string.Empty;
            //txtComments.Text = string.Empty; 
            txtNrtn.Text = string.Empty;
            lblChooseF.Text = string.Empty;
        }

        protected void UploadFile()
        {
            string folderPath = Server.MapPath("~/Files/Receipts/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            UploadDoc.SaveAs(folderPath + Path.GetFileName(UploadDoc.FileName));

            ////Display the success message.
            //lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded.";
        }
    }
}