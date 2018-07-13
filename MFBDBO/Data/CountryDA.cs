using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class CountryDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Countrytbl> CountryAll(int type, Countrytbl ls)
        {
            List<Countrytbl> obj = new List<Countrytbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Country", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                
                cmd.Parameters.AddWithValue("pCountryID", ls.CountryID);
                cmd.Parameters.AddWithValue("pCountryName", ls.CountryName);
                cmd.Parameters.AddWithValue("pCurrency", ls.Currency);
                cmd.Parameters.AddWithValue("pCountryCode", ls.CountryCode);
                cmd.Parameters.AddWithValue("pFlag", ls.Flag);
                cmd.Parameters.AddWithValue("pCurrencyName", ls.CurrencyName);
                cmd.Parameters.AddWithValue("pIsActive", ls.IsActive);
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
                    obj.Add(new Countrytbl
                    {
                        CountryID = Convert.ToInt32(dr["CountryID"]),
                        CountryName = dr["CountryName"].ToString(),
                        Currency = dr["Currency"].ToString(),
                        CountryCode = dr["CountryCode"].ToString(),
                        Flag = dr["Flag"].ToString(),
                        CurrencyName = dr["CurrencyName"].ToString(),
                        IsActive = Convert.ToInt32(dr["IsActive"]),
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
                obj.Add(new Countrytbl
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
    public class Countrytbl
    {
        public int CountryID { get; set; }

        public string CountryName { get; set; }

        public string Currency { get; set; }

        public string CountryCode { get; set; }

        public string Flag { get; set; }

        public string CurrencyName { get; set; }

        public int IsActive { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

        //public Common Common { get; set; }

    }
}






