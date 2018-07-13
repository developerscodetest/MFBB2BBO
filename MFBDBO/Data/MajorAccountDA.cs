using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace MFBDBO.Data
{

    public class MajorAccountDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<MajorAccounttbl> MajorAccountAll(int type, MajorAccounttbl ma)
        {
            List<MajorAccounttbl> objMajor = new List<MajorAccounttbl>();
            try
            {

                MySqlCommand cmd = new MySqlCommand("Sp_MajorAccount", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type",type);
                cmd.Parameters.AddWithValue("pMajorAccountID", ma.MajorAccountID);
                cmd.Parameters.AddWithValue("pMajorAccountName", ma.MajorAccountName);
                cmd.Parameters.AddWithValue("pMajorAccountCode", ma.MajorAccountCode);
                cmd.Parameters.AddWithValue("pStatus", ma.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", ma.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ma.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ma.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ma.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objMajor.Add(new MajorAccounttbl
                    {
                        MajorAccountID = Convert.ToInt32(dr["MajorAccountID"]),
                       MajorAccountName=dr["MajorAccountName"].ToString(),
                       MajorAccountCode=Convert.ToInt32(dr["MajorAccountCode"]),
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
                objMajor.Add(new MajorAccounttbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objMajor;
        }
    }






    public class MajorAccounttbl
    {
        //MajorAccountID, MajorAccountName, MajorAccountCode, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int MajorAccountID { get; set; }

        public string MajorAccountName { get; set; }

        public int MajorAccountCode { get; set; }

        public int Status { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }



}