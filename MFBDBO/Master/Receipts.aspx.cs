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
using System.IO;

namespace MFBDBO.Master
{
    public partial class Receipts : System.Web.UI.Page
    {
        AccReceiptsBL objAccReceiptsBL = new AccReceiptsBL();
        AccReceiptstbl AccR = new AccReceiptstbl();

        Bankstbl cnt = new Bankstbl();
        List<Bankstbl> lstBank = new List<Bankstbl>();

        Agentstbl cntt = new Agentstbl();
        List<Agentstbl> lstAgents = new List<Agentstbl>();

        MajorAccounttbl mt = new MajorAccounttbl();
        List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();

        MinorAccounttbl nt = new MinorAccounttbl();
        List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();

        //AccReceiptsInVoicesBL objAccReceiptsInVoicesBL = new AccReceiptsInVoicesBL();
        //AccReceiptInVoicestbl AccRIV = new AccReceiptInVoicestbl();

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
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

            //divPM.Visible = false;
            //divCheque.Visible = false;
            //divDD.Visible = false;
            //divBank.Visible = false;
            //divCard.Visible = false;
            //divTD.Visible = false;
            //divRN.Visible = false;

            if (!IsPostBack)
            {
                divPM.Visible = false;
                divCheque.Visible = false;
                divDD.Visible = false;
                divBank.Visible = false;
                divCard.Visible = false;
                divTD.Visible = false;
                divRN.Visible = false;

                lblChequeNo.Visible = false;
                txtChequeNo.Visible = false;
                lblChequeDate.Visible = false;
                txtChequeDate.Visible = false;
                lblDDNo.Visible = false;
                txtDDNo.Visible = false;
                lblDate.Visible = false;
                txtDate.Visible = false;
                lblAccountNo.Visible = false;
                txtAccountNo.Visible = false;
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
                txtVoucherNo.Text = "MFB" + num;

                GetAgents();
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
                //lc.Text = nt..ToString();
                lc.Value = nt.MinorAccountID.ToString();
                ddlMinorAccountList.Items.Add(lc);
            }
            
        }

        protected void GetAgents()
        {
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl ags = new Agentstbl();
            AgentsBL objAgentsBL = new AgentsBL();
            ags.Status = 1;
            lstAgents = objAgentsBL.GetAgentsByStatus(ags).ToList();
            ListItem m = new ListItem();
            m.Text = "--Select--";
            m.Value = 0.ToString();
            DdlFromAccount.Items.Add(m);
            foreach (var cntt in lstAgents)
            {
                ListItem la = new ListItem();
                la.Text = cntt.AgencyName;
                la.Value = cntt.AgentID.ToString();
                DdlFromAccount.Items.Add(la);
            }
        }
        
        protected void GetBank()
        {
            List<Bankstbl> lstBank = new List<Bankstbl>();
            Bankstbl bnk = new Bankstbl();
            BankBL objbankBL = new BankBL();
            bnk.Status = 1;
            lstBank = objbankBL.GetBankIsActive(bnk).ToList();
            //lstBank = objbankBL.GetAllBanks(bnk).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            DdlToAccount.Items.Add(l);
            foreach (var cnt in lstBank)
            {
                ListItem li = new ListItem();
                li.Text = cnt.BankName;
                li.Value = cnt.BankID.ToString();
                DdlToAccount.Items.Add(li);
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            AccReceiptstbl ls = new AccReceiptstbl
            //MinorAccounttbl MA = new MinorAccounttbl;
            
            {
                VoucherNo = txtVoucherNo.Text,
                MajorAccount = ddlMAccountList.Text,
                MinorAccount = ddlMinorAccountList.Text,
                ReceiveDate = txtReceiveDate.Text,
                FromAccount = DdlFromAccount.Text,
                ReceivedThrough = DdlReceivedThrough.Text,
                ToAccount = DdlToAccount.Text,
                CurrentBalance = txtCurrentBalance.Text,
                ReceivingAmount = txtReceivingAmount.Text,
                PaymentMode = DdlPaymentMode.Text,
                //Comment = txtCommentsReason.Text,
                Narration = txtNarration.Text,
                AttachFiles = UploadDoc.FileName,
                ChequeNo = string.IsNullOrEmpty(txtChequeNo.Text) ? 0 : Convert.ToInt32(txtChequeNo.Text),
                ChequeDate = txtChequeDate.Text,
                DDNO = string.IsNullOrEmpty(txtDDNo.Text) ? 0 : Convert.ToInt32(txtDDNo.Text),
                Date = txtDate.Text,
                AccountNO = txtAccountNo.Text,
                BankName = txtBankName.Text,
                CardNo = txtCardNo.Text,
                TransactionDate = txtTransactionDate.Text,
                ReferenceNo = txtReferenceNo.Text,               
                Status = 1,
                CreatedBy = 1,
                CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss")
            };
            
            //AccReceiptInVoicestbl lv = new AccReceiptInVoicestbl
            //{
                
            //    Status = 1,
            //    CreatedBy = 1,
            //    CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss")
            //};

            List<AccReceiptstbl> lst = new List<AccReceiptstbl>();
            lst = objAccReceiptsBL.SaveAccReceipt(ls).ToList();

            MinorAccountBL objMinorAccountBL = new MinorAccountBL();
            MinorAccounttbl mt = new MinorAccounttbl();
            mt.MinorAccountID = Convert.ToInt32(ddlMinorAccountList.SelectedValue);
            mt.Amount = string.IsNullOrEmpty(txtABalance.Text) ? 0 : Convert.ToInt32(txtABalance.Text);

            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            lstMinor = objMinorAccountBL.UpdateMinorAccountAmount(mt).ToList();

            //List<AccReceiptInVoicestbl> lstIV = new List<AccReceiptInVoicestbl>();
            //lstIV = objAccReceiptsInVoicesBL.SaveAccReceiptInVoices(lv).ToList();

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('AccountReciept Saved Successfully');", true);
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

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            Clear();
            //btnSave.Visible = true;
        }

        protected void Clear()
        {
            txtVoucherNo.Text = string.Empty;
            ddlMAccountList.SelectedIndex = 0;
            ddlMinorAccountList.SelectedIndex = 0;
            txtReceiveDate.Text = string.Empty;
            DdlFromAccount.SelectedIndex = 0;
            DdlReceivedThrough.SelectedIndex = 0;
            DdlToAccount.SelectedIndex = 0;
            txtCurrentBalance.Text = string.Empty;
            txtReceivingAmount.Text = string.Empty;
            txtABalance.Text = string.Empty;
            DdlPaymentMode.SelectedIndex = 0;
            //txtCommentsReason.Text = string.Empty;
            txtNarration.Text = string.Empty;
            //UploadDoc.FileName = string.Empty;
            txtChequeNo.Text = string.Empty;
            txtChequeDate.Text = string.Empty;
            txtDDNo.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtAccountNo.Text = string.Empty;
            txtBankName.Text = string.Empty;
            txtCardNo.Text = string.Empty;
            txtTransactionDate.Text = string.Empty;
            txtReferenceNo.Text = string.Empty;
        }

        //protected void GetAccReciepts()
        //{
        //    List<AccRecieptstbl> lstAccR = new List<AccRecieptstbl>();
        //    lstAccR = objAccRecieptsBL.GetAllAccReciept(AccR).ToList();
        //    gdvAccReciepts.DataSource = lstAccR;
        //    gdvAccReciepts.DataBind();
        //}

        //protected void GetAllAccReceiptInVoices()
        //{
        //    List<AccReceiptInVoicestbl> lstAccRIV = new List<AccReceiptInVoicestbl>();
        //    lstAccRIV = objAccReceiptsInVoicesBL.GetAllAccReceiptInVoices(AccRIV).ToList();
        //    gdvAccReceiptInVoices.DataSource = lstAccRIV;
        //    gdvAccReceiptInVoices.DataBind();
        //    //GetAccReceiptInVoicesByReceiptID(1);
        //}

        //protected void GetAccReceiptInVoicesByReceiptID( int id)
        //{
        //    AccReceiptInVoicestbl bd = new AccReceiptInVoicestbl();
        //    bd.ReceiptID = id;
        //    List<AccReceiptInVoicestbl> lst = new List<AccReceiptInVoicestbl>();
        //    lst = objAccReceiptsInVoicesBL.GetAccReceiptInVoicesByReceiptID(bd).ToList();
        //    gdvAccReceiptInVoices.DataSource = lst;
        //    gdvAccReceiptInVoices.DataBind();
        //}

        protected void gdvAccReceiptInVoices_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void DdlRecievedThrough_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 1 - Cash, 2 - Bank
            if(Convert.ToInt32(DdlReceivedThrough.SelectedValue) == 1)
            {
                DdlToAccount.Items.Clear();
                DdlToAccount.Items.Add(new ListItem("--Select--"));
                DdlToAccount.Items.Add(new ListItem("Cash in hand", "1"));
                lblPaymentMode.Visible = false;
                DdlPaymentMode.Visible = false;
                divPM.Visible = false;

            }
            else if (Convert.ToInt32(DdlReceivedThrough.SelectedValue) == 2)
            {
                DdlToAccount.Items.Clear();
                //DdlReceiptMode.Items.Add(new ListItem("--Select--"));
                //DdlReceiptMode.Items.Add(new ListItem("Axis Bank", "2"));
                //DdlReceiptMode.Items.Add(new ListItem("HDFC Bank", "3"));
                //DdlReceiptMode.Items.Add(new ListItem("SBI Bank", "4"));
                //DdlReceiptMode.Items.Add(new ListItem("ICICI Bank", "5"));
                GetBank();
                divPM.Visible = true;
                lblPaymentMode.Visible = true;
                DdlPaymentMode.Visible = true;

            }
            //DdlReceiptMode.SelectedIndexChanged += new EventHandler(DdlDepositTo_SelectedIndexChanged);
        }

        protected void DdlPaymentMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 1 - Cheque, 2 - DD, 3 - Credit/Debit, 4 - Internet Banking 
            if (Convert.ToInt32(DdlPaymentMode.SelectedValue) == 1)
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
                lblDate.Visible = false;
                txtDate.Visible = false;
                lblAccountNo.Visible = true;
                txtAccountNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
            }
            else if (Convert.ToInt32(DdlPaymentMode.SelectedValue) == 2)
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
                lblDate.Visible = true;
                txtDate.Visible = true;
                lblAccountNo.Visible = true;
                txtAccountNo.Visible = true;
                lblBankName.Visible = true;
                txtBankName.Visible = true;
            }
            else if (Convert.ToInt32(DdlPaymentMode.SelectedValue) == 3)
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
                lblDate.Visible = false;
                txtDate.Visible = false;
                lblAccountNo.Visible = false;
                txtAccountNo.Visible = false;
                lblBankName.Visible = false;
                txtBankName.Visible = false;
                lblCardNo.Visible = true;
                txtCardNo.Visible = true;
                lblTransactionDate.Visible = true;
                txtTransactionDate.Visible = true;
                lblReferenceNo.Visible = true;
                txtReferenceNo.Visible = true;
            }
            else if (Convert.ToInt32(DdlPaymentMode.SelectedValue) == 4)
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
                lblDate.Visible = false;
                txtDate.Visible = false;
                lblAccountNo.Visible = false;
                txtAccountNo.Visible = false;
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

        //protected void DdlReceivedFrom_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GetAccReceiptInVoicesByReceiptID(1);
        //}

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

        //protected void txtABalance_TextChanged(object sender, EventArgs e)
        //{
        //    //double txtCurrentBalance, txtReceivingAmount, total;
        //    //total = 0;
        //    //double.TryParse(txtABalance.ToString(), out txtCurrentBalance);
        //    ////double.TryParse(txtCurrentBalance.ToString, out txtCurrentBalance);
        //    ////double.TryParse(Convert.ToInt32(txtCurrentBalance).ToString(), out txtCurrentBalance);
        //    //double.TryParse(txtCurrentBalance.ToString(), out txtReceivingAmount);
        //    //total = txtCurrentBalance + txtReceivingAmount;
        //    //lblABalance.Text = total.ToString();
        //}

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
            
            txtCurrentBalance.Text = lstMinor.Count > 0 ? lstMinor[0].Amount.ToString() : "";         

        }

        protected void txtCurrentBalance_TextChanged1(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtCurrentBalance.Text)) && (!string.IsNullOrEmpty(txtReceivingAmount.Text)))
            {
                txtABalance.Text = (Convert.ToInt32(txtCurrentBalance.Text) + Convert.ToInt32(txtReceivingAmount.Text)).ToString();
            }
        }

        protected void lblReceivingAmount_DataBinding(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtCurrentBalance.Text)) && (!string.IsNullOrEmpty(txtReceivingAmount.Text)))
            {
                txtABalance.Text = (Convert.ToInt32(txtCurrentBalance.Text) + Convert.ToInt32(txtReceivingAmount.Text)).ToString();
            }
        }

        protected void txtReceivingAmount_TextChanged(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(txtCurrentBalance.Text)) && (!string.IsNullOrEmpty(txtReceivingAmount.Text)))
            {
                txtABalance.Text = (Convert.ToInt32(txtCurrentBalance.Text) + Convert.ToInt32(txtReceivingAmount.Text)).ToString();
            }
        }

        protected void txtABalance_TextChanged(object sender, EventArgs e)
        {

        }
    }
}