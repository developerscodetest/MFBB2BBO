using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace MFBDBO.Data
{
    public class BankDA
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Bankstbl> BanksAll(int type, Bankstbl ba)
        {
            List<Bankstbl> objBanks = new List<Bankstbl>();
            try
            {

                MySqlCommand cmd = new MySqlCommand("Sp_Banks", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pBankID", ba.BankID);
                cmd.Parameters.AddWithValue("pBankName", ba.BankName);
                cmd.Parameters.AddWithValue("pBranch", ba.Branch);
                cmd.Parameters.AddWithValue("PAddress", ba.Address);
                cmd.Parameters.AddWithValue("pAccountNumber", ba.AccountNumber);
                cmd.Parameters.AddWithValue("pAccountName", ba.AccountName);
                cmd.Parameters.AddWithValue("PIfscCode", ba.IfscCode);
                cmd.Parameters.AddWithValue("pType", ba.Type);      
                cmd.Parameters.AddWithValue("pStatus", ba.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", ba.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ba.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ba.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ba.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objBanks.Add(new Bankstbl
                    {
                       BankID= Convert.ToInt32(dr["BankID"]),
                        BankName = dr["BankName"].ToString(),
                        Branch = dr["Branch"].ToString(),
                        Address = dr["Address"].ToString(),
                        AccountNumber = dr["AccountNumber"].ToString(),
                        AccountName=dr["AccountName"].ToString(),
                        IfscCode=dr["IfscCode"].ToString(),
                        Type=dr["Type"].ToString(),       
                        Status = Convert.ToInt32(dr["Status"]),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",
                    });
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                objBanks.Add(new Bankstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objBanks;
        }
    }

    public class Bankstbl
    {
        //BankID, BankName, Branch, Address, AccountNumber, IfscCode, Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int BankID { get; set; }
        public string BankName { get; set; }
        public string Branch { get; set; }
        public string Address { get; set; }
        public string AccountNumber { get; set; }
        public string AccountName { get; set; }

        public string IfscCode { get; set; }
        public string Type { get; set; }
   
        public int Status { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }


}
