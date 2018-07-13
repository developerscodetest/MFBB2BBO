using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;


namespace MFBDBO.Data
{   
    public class MinorAccountDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<MinorAccounttbl> MinorAccountAll(int type, MinorAccounttbl ls)
        {
            List<MinorAccounttbl> obj = new List<MinorAccounttbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_MinorAccount", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("PMinorAccountID", ls.MinorAccountID);
                cmd.Parameters.AddWithValue("PMinorAccountName", ls.MinorAccountName);
                cmd.Parameters.AddWithValue("PMinorAccountCode", ls.MinorAccountCode);
                cmd.Parameters.AddWithValue("PMajorAccountID", ls.MajorAccountID);
                cmd.Parameters.AddWithValue("PAmount", ls.Amount);
                cmd.Parameters.AddWithValue("PStatus", ls.Status);
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
                    obj.Add(new MinorAccounttbl
                    {
                        MinorAccountID = string.IsNullOrEmpty(dr["MinorAccountID"].ToString()) ? 0 : Convert.ToInt32(dr["MinorAccountID"]),
                        MinorAccountName = dr["MinorAccountName"].ToString(),
                        MinorAccountCode = string.IsNullOrEmpty(dr["MinorAccountCode"].ToString()) ? 0 : Convert.ToInt32(dr["MinorAccountCode"]),
                        MajorAccountID = string.IsNullOrEmpty(dr["MajorAccountID"].ToString()) ? 0 : Convert.ToInt32(dr["MajorAccountID"]),
                        Amount = string.IsNullOrEmpty(dr["Amount"].ToString()) ? 0 : Convert.ToInt32(dr["Amount"]),
                        Status = string.IsNullOrEmpty(dr["Status"].ToString()) ? 0 : Convert.ToInt32(dr["Status"]),
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
                obj.Add(new MinorAccounttbl
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

     public class MinorAccounttbl
    {
        public int MinorAccountID { get; set; }

        public string MinorAccountName { get; set; }

        public int MinorAccountCode { get; set; }

        //public string CountryCode { get; set; }

        public int MajorAccountID { get; set; }

        public int Amount { get; set; }

        public int Status { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }
    }
}