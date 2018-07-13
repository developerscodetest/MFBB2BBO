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
    public partial class PrepareAReceiptsView : System.Web.UI.Page
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

            //divPM.Visible = false;
            //divCheque.Visible = false;
            //divDD.Visible = false;
            //divBank.Visible = false;
            //divCard.Visible = false;
            //divTD.Visible = false;
            //divRN.Visible = false;

            if (!IsPostBack)
            {
              if (Session["ReceiptID"].ToString() != null)
                {
                    int ReceiptID = Convert.ToInt32(Session["ReceiptID"]);
                    GetAccReceiptById(ReceiptID);
                }
            }
        }

        protected string GetMajorAccounts(int mjid)
        {
            List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();
            MajorAccounttbl MC = new MajorAccounttbl();
            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            lstMajor = objMajorAccountBL.GetAllAccounts(MC).ToList();
            var major = lstMajor.OfType<MajorAccounttbl>().Where(c => c.MajorAccountID == mjid);
            //return major.First().MajorAccountName;
            return major.Count() > 0 ? major.First().MajorAccountName : "";
        }

        protected string GetMinorAccounts(int maid)
        {
            List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();
            MinorAccounttbl Mn = new MinorAccounttbl();
            MinorAccountBL objMinorAccountBL = new MinorAccountBL();          
            lstMinor = objMinorAccountBL.GetAllMinorAccount(Mn).ToList();
            var minor = lstMinor.OfType<MinorAccounttbl>().Where(d => d.MinorAccountID == maid);
            //return minor.First().MinorAccountName;
            return minor.Count() > 0 ? minor.First().MinorAccountName : "";

        }

        protected string GetAgents(int agid)
        {
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl ags = new Agentstbl();
            AgentsBL objAgentsBL = new AgentsBL();
            lstAgents = objAgentsBL.GetAllAgents(ags).ToList();
            var agent = lstAgents.OfType<Agentstbl>().Where(a => a.AgentID == agid);
            //return agent.First().AgencyName;
            return agent.Count() > 0 ? agent.First().AgencyName : "";

        }

        protected string GetBank(int bkid)
        {
            List<Bankstbl> lstBank = new List<Bankstbl>();
            Bankstbl bnk = new Bankstbl();
            BankBL objbankBL = new BankBL();
            lstBank = objbankBL.GetAllBanks(bnk).ToList();
            var bank = lstBank.OfType<Bankstbl>().Where(b => b.BankID == bkid);
            //return bank.First().BankName;
            return bank.Count() > 0 ? bank.First().BankName : "";

        }

        protected void GetAccReceiptById(int ReceiptID)
        {
            AccReceiptstbl AR = new AccReceiptstbl
            {
                ReceiptID = ReceiptID
            };

            List<AccReceiptstbl> lstAccReceipts = new List<AccReceiptstbl>();
            lstAccReceipts = objAccReceiptsBL.GetAccReceiptById(AR).ToList();

            foreach (var el in lstAccReceipts)
            {
                hdnReceiptID.Value = el.ReceiptID.ToString();
                lblVNo.Text = el.VoucherNo;
                lblMaAcc.Text = GetMajorAccounts(Convert.ToInt32(el.MajorAccount));
                lblMiAcc.Text = GetMinorAccounts(Convert.ToInt32(el.MinorAccount));
                lblRDate.Text = Convert.ToDateTime(el.ReceiveDate).ToShortDateString();
                lblFromAcc.Text = GetAgents(Convert.ToInt32(el.FromAccount));
                //lblRFrom.Text = el.ReceivedFrom.ToString();

                //lblDTo.Text = el.DepositTo;
                //lblRM.Text = el.ReceiptMode;
                // Cash 
                if (Convert.ToInt32(el.ReceivedThrough) == 1)
                {
                    lblReceivedThro.Text = "Cash";
                    lblChequeNo.Visible = false;
                    lblCNo.Visible = false;
                    lblChequeDate.Visible = false;
                    lblCDate.Visible = false;
                    lblDDNo.Visible = false;
                    lblDDN.Visible = false;
                    lblDDDate.Visible = false;
                    lblDDD.Visible = false;
                    lblAccountNo.Visible = false;
                    lblAcuntNo.Visible = false;
                    lblBankName.Visible = false;
                    lblBName.Visible = false;
                    lblCardNo.Visible = false;
                    lblCardNumber.Visible = false;
                    lblTransactionDate.Visible = false;
                    lblTDate.Visible = false;
                    lblReferenceNo.Visible = false;
                    lblRefrnceNo.Visible = false;
                    lblPaymentMode.Visible = false;
                    lblPaytMode.Visible = false;

                    if(Convert.ToInt32(el.ToAccount)==1)
                    {
                        lblToAcct.Text = "Cash in hand";
                    }
                    divPM.Visible = false;

                    divCheque.Visible = false;
                    divDD.Visible = false;
                    divBank.Visible = false;
                    divCard.Visible = false;
                    divTD.Visible = false;
                    divRN.Visible = false;

                }
                // Bank
                else if (Convert.ToInt32(el.ReceivedThrough) == 2)
                {
                    divPM.Visible = true;

                    //divCheque.Visible = false;
                    //divDD.Visible = false;
                    //divBank.Visible = false;
                    //divCard.Visible = false;
                    //divTD.Visible = false;
                    //divRN.Visible = false;

                    lblReceivedThro.Text = "Bank";
                    lblToAcct.Text = GetBank(Convert.ToInt32(el.ToAccount));
                    // Cheque
                    if (Convert.ToInt32(el.PaymentMode) == 1)
                    {
                        divCheque.Visible = true;
                        divDD.Visible = false;
                        divBank.Visible = true;
                        divCard.Visible = false;
                        divTD.Visible = false;
                        divRN.Visible = false;

                        lblPaytMode.Text = "Cheque";
                        lblDDNo.Visible = false;
                        lblDDN.Visible = false;
                        lblDDDate.Visible = false;
                        lblDDD.Visible = false;
                        lblCardNo.Visible = false;
                        lblCardNumber.Visible = false;
                        lblTransactionDate.Visible = false;
                        lblTDate.Visible = false;
                        lblReferenceNo.Visible = false;
                        lblRefrnceNo.Visible = false;                      


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

                        lblPaytMode.Text = "DD";
                        lblChequeNo.Visible = false;
                        lblCNo.Visible = false;
                        lblChequeDate.Visible = false;
                        lblCDate.Visible = false;
                        lblCardNo.Visible = false;
                        lblCardNumber.Visible = false;
                        lblTransactionDate.Visible = false;
                        lblTDate.Visible = false;
                        lblReferenceNo.Visible = false;
                        lblRefrnceNo.Visible = false;
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

                        lblPaytMode.Text = "Credit/Debit card";
                        lblChequeNo.Visible = false;
                        lblCNo.Visible = false;
                        lblChequeDate.Visible = false;
                        lblCDate.Visible = false;
                        lblDDNo.Visible = false;
                        lblDDN.Visible = false;
                        lblDDDate.Visible = false;
                        lblDDD.Visible = false;
                        lblAccountNo.Visible = false;
                        lblAcuntNo.Visible = false;
                        lblBankName.Visible = false;
                        lblBName.Visible = false;
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

                        lblPaytMode.Text = "InternetBanking";
                        lblChequeNo.Visible = false;
                        lblCNo.Visible = false;
                        lblChequeDate.Visible = false;
                        lblCDate.Visible = false;
                        lblDDNo.Visible = false;
                        lblDDN.Visible = false;
                        lblDDDate.Visible = false;
                        lblDDD.Visible = false;
                        lblAccountNo.Visible = false;
                        lblAcuntNo.Visible = false;
                        lblBankName.Visible = false;
                        lblBName.Visible = false;
                        lblCardNo.Visible = false;
                        lblCardNumber.Visible = false;
                    }
                }
                lblCBalance.Text = el.CurrentBalance;
                lblReceivingAmt.Text = el.ReceivingAmount;
                //lblPaymentMode.Text = el.PaymentMode;           
                lblCNo.Text = el.ChequeNo.ToString();
                lblCDate.Text = Convert.ToDateTime(el.ChequeDate).ToShortDateString();
                lblDDN.Text = el.DDNO.ToString();
                lblDDD.Text = Convert.ToDateTime(el.Date).ToShortDateString();
                lblAcuntNo.Text = el.AccountNO;
                lblBName.Text = el.BankName;
                lblCardNumber.Text = el.CardNo;
                lblTDate.Text = el.TransactionDate == "" ? "" : Convert.ToDateTime(el.TransactionDate).ToShortDateString();
                //Convert.ToDateTime(el.TransactionDate).ToShortDateString();
                lblRefrnceNo.Text = el.ReferenceNo;
                //lblCmnt.Text = el.Comment;
                lblNrtn.Text = el.Narration;
                lblFN.Text = el.AttachFiles;
                LiteralControl lc = new LiteralControl();
                lc.Text = "<a href='../Files/Payments/" + el.AttachFiles + "' class='btn btn-success btn-file' download><i class='fa fa-download'></i></a>";
                PlaceHolder1.Controls.Add(lc);
                //GetBank();
            }
        }
    }
}
