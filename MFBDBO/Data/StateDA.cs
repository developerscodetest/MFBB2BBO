using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace MFBDBO.Data
{
    public class StateDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Statetbl>  StateAll(int type, Statetbl st)
        {
            List<Statetbl> obj = new List<Statetbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_State", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pStateID", st.StateID);
                cmd.Parameters.AddWithValue("pStateName", st.StateName);
                cmd.Parameters.AddWithValue("pCountryID", st.CountryID);
                cmd.Parameters.AddWithValue("pIsActive", st.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", st.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", st.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", st.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", st.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                if (!dr.HasRows)
                {
                    obj.Add(new Statetbl
                    {
                        Message = "Success",
                    });
                }
                while (dr.Read())
                {
                    obj.Add(new Statetbl
                    {
                        StateID = Convert.ToInt32(dr["StateID"]),
                        StateName = dr["StateName"].ToString(),                        
                        CountryID = Convert.ToInt32(dr["CountryID"]),
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
                obj.Add(new Statetbl
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
    public class Statetbl
    {
        //StateID, StateName, CountryID, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int StateID { get; set; }
        public string StateName { get; set; }
        public int CountryID { get; set; }
        public int IsActive { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }
        //public Countrytbl Country { get; set; }

    }
}