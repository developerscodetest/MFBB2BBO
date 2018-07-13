using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Data;
using MFBDBO.Business;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace MFBDBO.Master
{
    public partial class PreparePaymentsListView : System.Web.UI.Page
    {
        Bankstbl cnt = new Bankstbl();
        List<Bankstbl> lstBank = new List<Bankstbl>();

        Supplierstbl cntt = new Supplierstbl();
        List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();

        MajorAccounttbl mt = new MajorAccounttbl();
        List<MajorAccounttbl> lstMajor = new List<MajorAccounttbl>();

        MinorAccounttbl nt = new MinorAccounttbl();
        List<MinorAccounttbl> lstMinor = new List<MinorAccounttbl>();

        AccPaymentsBL objpayBL = new AccPaymentsBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
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
                    GetPaymentsByID(PaymentID);
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

        protected string GetSuppliers(int spid)
        {
            List<Supplierstbl> lstSuppliers = new List<Supplierstbl>();
            Supplierstbl sps = new Supplierstbl();
            SuppliersBL objSuppliersBL = new SuppliersBL();
            lstSuppliers = objSuppliersBL.GetAllSuppliers(sps).ToList();
            var supplier = lstSuppliers.OfType<Supplierstbl>().Where(a => a.SupplierID == spid);
            //return supplier.First().AgencyName;
            return supplier.Count() > 0 ? supplier.First().Supplier : "";
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

        protected void GetPaymentsByID(int PaymentID)
        {
            AccPaymentstbl Pa = new AccPaymentstbl
            {
                PaymentID = PaymentID
            };

            List<AccPaymentstbl> lstPayments = new List<AccPaymentstbl>();
            lstPayments = objpayBL.GetPaymentsbyId(Pa).ToList();
            // 1- cash, 2 - Bank
            foreach (var el in lstPayments)
            {
                hdnPaymentsID.Value = el.PaymentID.ToString();
                //lblAgainstPurchase.Text= el.PaymentType;
                //if (Convert.ToInt32(el.PaymentType) == 1)
                //{
                //    el.PaymentType = "Against Purchase";
                //}
                //else if (Convert.ToInt32(el.PaymentType) == 2)
                //{
                //    el.PaymentType = "Advance Payment";
                //}
                //else if (Convert.ToInt32(el.PaymentType) == 3)
                //{
                //    el.PaymentType = "Other Payment";
                //}
                lblVNo.Text = el.VoucherNo;
                lblMaAcc.Text = GetMajorAccounts(Convert.ToInt32(el.MajorAccount));
                lblMiAcc.Text = GetMinorAccounts(Convert.ToInt32(el.MinorAccount));
                lblPDate.Text = Convert.ToDateTime(el.PaymentDate).ToShortDateString();
                lblTAccount.Text = GetSuppliers(Convert.ToInt32(el.ToAccount));
                if (Convert.ToInt32(el.PaymentThrough) == 1)
                {
                    lblPayThrough.Text = "Cash";
                    lblChequeNo.Visible = false;
                    lblCNo.Visible = false;
                    lblChequeDate.Visible = false;
                    lblCDate.Visible = false;
                    lblDDNo.Visible = false;
                    lblDDN.Visible = false;
                    lblDDDate.Visible = false;
                    lblDDD.Visible = false;
                    lblAcnt.Visible = false;
                    lblAcunt.Visible = false;
                    lblBankName.Visible = false;
                    lblBName.Visible = false;
                    lblCardNo.Visible = false;
                    lblCrdN.Visible = false;
                    lblTDate.Visible = false;
                    lblTD.Visible = false;
                    lblRNo.Visible = false;
                    lblRefNo.Visible = false;
                    lblPaymentMode.Visible = false;
                    lblPaymMode.Visible = false;                    

                    if (Convert.ToInt32(el.FromAccount) == 1)
                    {
                        lblFAccount.Text = "Cash in hand";
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
                else if (Convert.ToInt32(el.PaymentThrough) == 2)
                {
                    divPM.Visible = true;

                    lblPayThrough.Text = "Bank";
                    lblFAccount.Text = GetBank(Convert.ToInt32(el.FromAccount));
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

                        lblPaymMode.Text = "Cheque";
                        lblDDNo.Visible = false;
                        lblDDN.Visible = false;
                        lblDDDate.Visible = false;
                        lblDDD.Visible = false;
                        lblCardNo.Visible = false;
                        lblCrdN.Visible = false;
                        lblTDate.Visible = false;
                        lblTD.Visible = false;
                        lblRNo.Visible = false;
                        lblRefNo.Visible = false;
                        lblCNo.Text = el.CdNo.ToString();
                        lblCDate.Text = Convert.ToDateTime(el.CdDate).ToShortDateString();
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

                        lblPaymMode.Text = "DD";
                        lblChequeNo.Visible = false;
                        lblCNo.Visible = false;
                        lblChequeDate.Visible = false;
                        lblCDate.Visible = false;
                        lblCardNo.Visible = false;
                        lblCrdN.Visible = false;
                        lblTDate.Visible = false;
                        lblTD.Visible = false;
                        lblRNo.Visible = false;
                        lblRefNo.Visible = false;
                        lblDDN.Text = el.CdNo.ToString();
                        lblDDD.Text = Convert.ToDateTime(el.CdDate).ToShortDateString();
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

                        lblPaymMode.Text = "Credit/Debit card";
                        lblChequeNo.Visible = false;
                        lblCNo.Visible = false;
                        lblChequeDate.Visible = false;
                        lblCDate.Visible = false;
                        lblDDNo.Visible = false;
                        lblDDN.Visible = false;
                        lblDDDate.Visible = false;
                        lblDDD.Visible = false;
                        lblAcnt.Visible = false;
                        lblAcunt.Visible = false;
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

                        lblPaymMode.Text = "InternetBanking";
                        lblChequeNo.Visible = false;
                        lblCNo.Visible = false;
                        lblChequeDate.Visible = false;
                        lblCDate.Visible = false;
                        lblDDNo.Visible = false;
                        lblDDN.Visible = false;
                        lblDDDate.Visible = false;
                        lblDDD.Visible = false;
                        lblAcnt.Visible = false;
                        lblAcunt.Visible = false;
                        lblBankName.Visible = false;
                        lblBName.Visible = false;
                        lblCardNo.Visible = false;
                        lblCrdN.Visible = false;
                    }
                }
                //lblPayM.Text = el.PaymentMode;
                //lblA.Text = el.Accounts;
                lblCurrentBal.Text = el.CurrentBalance;
                lblPayingAmt.Text = el.PayingAmount;
                //lblPM.Text = el.PayMode;
                
                
                lblAcunt.Text = el.AcNo;
                lblBName.Text = el.BankName;
                lblCrdN.Text = el.CardNo;
                lblTD.Text = el.TransactionDate == "" ? "" : Convert.ToDateTime(el.TransactionDate).ToShortDateString();
                lblRefNo.Text = el.ReferenceNo;
                lblNrtn.Text = el.Narration;
                lblFN.Text = el.AttachFiles;
                LiteralControl lc = new LiteralControl();
                lc.Text = "<a href='../Files/Payments/"+ el.AttachFiles + "' class='btn btn-success btn-file' download><i class='fa fa-download'></i></a>";
                PlaceHolder1.Controls.Add(lc);
            }
        }
    }
}