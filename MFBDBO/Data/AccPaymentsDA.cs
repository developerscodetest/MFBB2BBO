using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Data
{
    public class AccPaymentsDA
    {


        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<AccPaymentstbl> PaymentsAll(int type, AccPaymentstbl pa)
        {
            List<AccPaymentstbl> objPay = new List<AccPaymentstbl>();
            try
            {

                MySqlCommand cmd = new MySqlCommand("Sp_AccPayments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pPaymentID", pa.PaymentID);
                cmd.Parameters.AddWithValue("pPaymentType", pa.PaymentType);
                cmd.Parameters.AddWithValue("pVoucherNo", pa.VoucherNo);
                cmd.Parameters.AddWithValue("pMajorAccount", pa.MajorAccount);
                cmd.Parameters.AddWithValue("pMinorAccount", pa.MinorAccount);
                cmd.Parameters.AddWithValue("pPaymentDate", pa.PaymentDate);
                cmd.Parameters.AddWithValue("pToAccount", pa.ToAccount);
                cmd.Parameters.AddWithValue("pPaymentThrough", pa.PaymentThrough);
                cmd.Parameters.AddWithValue("pFromAccount", pa.FromAccount);
                cmd.Parameters.AddWithValue("pCurrentBalance", pa.CurrentBalance);
                cmd.Parameters.AddWithValue("pPaymentMode", pa.PaymentMode);
                cmd.Parameters.AddWithValue("pCdNo", pa.CdNo);
                cmd.Parameters.AddWithValue("pCdDate", pa.CdDate);
                cmd.Parameters.AddWithValue("pAcNo", pa.AcNo);
                cmd.Parameters.AddWithValue("pCardNo", pa.CardNo);
                cmd.Parameters.AddWithValue("pTransactionDate", pa.TransactionDate);
                cmd.Parameters.AddWithValue("pReferenceNo", pa.ReferenceNo);
                cmd.Parameters.AddWithValue("pNarration", pa.Narration);
                cmd.Parameters.AddWithValue("pAttachFiles", pa.AttachFiles);
                cmd.Parameters.AddWithValue("pPayingAmount", pa.PayingAmount);
                cmd.Parameters.AddWithValue("pBankName", pa.BankName);
                cmd.Parameters.AddWithValue("pStatus", pa.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", pa.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", pa.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", pa.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", pa.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objPay.Add(new AccPaymentstbl
                    {
                        PaymentID = Convert.ToInt32(dr["PaymentID"]),
                        PaymentType = dr["PaymentType"].ToString(),
                        VoucherNo = dr["VoucherNo"].ToString(),
                        MajorAccount = dr["MajorAccount"].ToString(),
                        MinorAccount = dr["MinorAccount"].ToString(),
                        PaymentDate = dr["PaymentDate"].ToString(),
                        ToAccount = dr["ToAccount"].ToString(),
                        PaymentThrough = dr["PaymentThrough"].ToString(),
                        FromAccount = dr["FromAccount"].ToString(),
                        CurrentBalance = dr["CurrentBalance"].ToString(),
                        PayingAmount = dr["PayingAmount"].ToString(),
                        PaymentMode = dr["PaymentMode"].ToString(),
                        CdNo = dr["CdNo"].ToString(),
                        CdDate = dr["CdDate"].ToString(),
                        AcNo = dr["AcNo"].ToString(),
                        CardNo = dr["CardNo"].ToString(),
                        BankName = dr["BankName"].ToString(),
                        TransactionDate = dr["TransactionDate"].ToString(),
                        ReferenceNo = dr["ReferenceNo"].ToString(),
                        Narration = dr["Narration"].ToString(),
                        AttachFiles = dr["AttachFiles"].ToString(),
                        Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
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
                objPay.Add(new AccPaymentstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objPay;
        }
    }


public class AccPaymentstbl
    {
        //PaymentID, PaymentType, VoucherNo, PaymentDate, PayTo, PaymentMode, Accounts, CurrentBalance, PayMode, CdNo,
        //    CdDate, AcNo, CardNo, TransactionDate, ReferenceNo, Narration, AttachFiles, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int PaymentID { get; set; }

        public string PaymentType { get; set; }

        public string VoucherNo { get; set; }

        public string MajorAccount { get; set; }

        public string MinorAccount { get; set; }

        public string PaymentDate { get; set; }

        public string ToAccount { get; set; }

        public string PaymentThrough { get; set; }

        public string FromAccount { get; set; }

        public string CurrentBalance { get; set; }

        public string PayingAmount { get; set; }

        public string PaymentMode { get; set; }

        public string CdNo { get; set; }

        public string CdDate { get; set; }

        public string AcNo { get; set; }

        public string CardNo { get; set; }

        public string BankName { get; set; }

        public string TransactionDate { get; set; }

        public string ReferenceNo { get; set; }

        public string Narration { get; set; }

        public string AttachFiles { get; set; }

        public int Status { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }

}
