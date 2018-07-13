using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class AccReceiptsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<AccReceiptstbl> AccReceiptsAll(int type, AccReceiptstbl ls)
        {
            List<AccReceiptstbl> obj = new List<AccReceiptstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_AccReceipts", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);

                cmd.Parameters.AddWithValue("pReceiptID", ls.ReceiptID);
                cmd.Parameters.AddWithValue("pVoucherNo", ls.VoucherNo);
                cmd.Parameters.AddWithValue("pMajorAccount", ls.MajorAccount);
                cmd.Parameters.AddWithValue("pMinorAccount", ls.MinorAccount);
                cmd.Parameters.AddWithValue("pReceiveDate", ls.ReceiveDate); 
                cmd.Parameters.AddWithValue("pFromAccount", ls.FromAccount);
                cmd.Parameters.AddWithValue("pReceivedThrough", ls.ReceivedThrough);
                cmd.Parameters.AddWithValue("pToAccount", ls.ToAccount);
                cmd.Parameters.AddWithValue("pCurrentBalance", ls.CurrentBalance);
                cmd.Parameters.AddWithValue("pReceivingAmount", ls.ReceivingAmount);                
                cmd.Parameters.AddWithValue("pPaymentMode", ls.PaymentMode);
                cmd.Parameters.AddWithValue("pNarration", ls.Narration); 
                cmd.Parameters.AddWithValue("pComment", ls.Comment);
                cmd.Parameters.AddWithValue("pAttachFiles", ls.AttachFiles);
                cmd.Parameters.AddWithValue("pChequeNo", ls.ChequeNo);
                cmd.Parameters.AddWithValue("pChequeDate", ls.ChequeDate);
                cmd.Parameters.AddWithValue("pDDNO", ls.DDNO);
                cmd.Parameters.AddWithValue("pDate", ls.Date);
                cmd.Parameters.AddWithValue("pAccountNO", ls.AccountNO);
                cmd.Parameters.AddWithValue("pBankName", ls.BankName);
                cmd.Parameters.AddWithValue("pCardNo", ls.CardNo);
                cmd.Parameters.AddWithValue("pTransactionDate", ls.TransactionDate);
                cmd.Parameters.AddWithValue("pReferenceNo", ls.ReferenceNo);
                cmd.Parameters.AddWithValue("pStatus", ls.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", ls.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ls.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ls.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ls.UpdatedDate);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj.Add(new AccReceiptstbl
                    {
                        ReceiptID = Convert.ToInt32(dr["ReceiptID"]),
                        VoucherNo = dr["VoucherNo"].ToString(),
                        MajorAccount = dr["MajorAccount"].ToString(),
                        MinorAccount = dr["MinorAccount"].ToString(),
                        ReceiveDate = dr["ReceiveDate"].ToString(),
                        FromAccount = dr["FromAccount"].ToString(),
                        ReceivedThrough = dr["ReceivedThrough"].ToString(),
                        ToAccount = dr["ToAccount"].ToString(),
                        CurrentBalance = dr["CurrentBalance"].ToString(),
                        ReceivingAmount = dr["ReceivingAmount"].ToString(),
                        PaymentMode = dr["PaymentMode"].ToString(),
                        Comment = dr["Comment"].ToString(),
                        Narration = dr["Narration"].ToString(),
                        AttachFiles = dr["AttachFiles"].ToString(),
                        ChequeNo = Convert.ToInt32(dr["ChequeNo"]),
                        ChequeDate = dr["ChequeDate"].ToString(),
                        DDNO = Convert.ToInt32(dr["DDNO"]),
                        Date = dr["Date"].ToString(),
                        AccountNO = dr["AccountNO"].ToString(),
                        BankName = dr["BankName"].ToString(),
                        CardNo = dr["CardNo"].ToString(),
                        TransactionDate = dr["TransactionDate"].ToString(),
                        ReferenceNo = dr["ReferenceNo"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",
                    });
                }

                dr.Close();
            }

            catch (Exception ex)
            {
                obj.Add(new AccReceiptstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return obj;
        }
    }

    public class AccReceiptstbl : Common
    {
        public int ReceiptID { get; set; }

        public string VoucherNo { get; set; }

        public string MajorAccount { get; set; }

        public string MinorAccount { get; set; }

        public string ReceiveDate { get; set; }
        
        public string FromAccount { get; set; }

        public string ReceivedThrough { get; set; }

        public string ToAccount { get; set; }

        public string CurrentBalance { get; set; }

        public string ReceivingAmount { get; set; }

        public string PaymentMode { get; set; }

        public string Comment { get; set; }

        public string Narration { get; set; }

        public string AttachFiles { get; set; }

        public int ChequeNo { get; set; }

        public string ChequeDate { get; set; }

        public int DDNO { get; set; }

        public string Date { get; set; }

        public string AccountNO { get; set; }

        public string BankName { get; set; }
                    
        public string CardNo { get; set; }

        public string TransactionDate { get; set; }

        public string ReferenceNo { get; set; }       
    }    
}
