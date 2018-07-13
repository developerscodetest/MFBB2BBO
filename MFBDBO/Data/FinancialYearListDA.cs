using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace MFBDBO.Data
{
    public class FinancialYearListDA
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<FinancialYearListtbl> FinancialListAll(int type, FinancialYearListtbl fa)
        {
            List<FinancialYearListtbl> objFYear = new List<FinancialYearListtbl>();
            try
            {

                MySqlCommand cmd = new MySqlCommand("Sp_FinancialYearList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pFyID", fa.FyID);
                cmd.Parameters.AddWithValue("pFromYear", fa.FromYear);
                cmd.Parameters.AddWithValue("pToYear", fa.ToYear);
                cmd.Parameters.AddWithValue("PFromMonth", fa.FromMonth);
                cmd.Parameters.AddWithValue("pToMonth", fa.ToMonth);
                cmd.Parameters.AddWithValue("pStatus", fa.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", fa.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", fa.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", fa.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", fa.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objFYear.Add(new FinancialYearListtbl
                    {
                        FyID = Convert.ToInt32(dr["FyID"]),
                        FromYear = dr["FromYear"].ToString(),
                        ToYear=dr["ToYear"].ToString(),
                        FromMonth=dr["FromMonth"].ToString(),
                        ToMonth=dr["ToMonth"].ToString(),
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
                objFYear.Add(new FinancialYearListtbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objFYear;
        }
    }

public class FinancialYearListtbl
    {
       // FyID, FromYear, ToYear, FromMonth, ToMonth, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int FyID { get; set; }

        public string FromYear { get; set; }

        public string ToYear { get; set; }
        public string FromMonth { get; set; }
        public string ToMonth { get; set; }

        public int Status { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }



}