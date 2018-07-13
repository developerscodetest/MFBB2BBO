using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
namespace MFBDBO.Data
{
    public class ReconfirmationDA
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Reconfirmationtbl> ReconfirmationAll(int type, Reconfirmationtbl ra)
        {
            List<Reconfirmationtbl> objRec = new List<Reconfirmationtbl>();
            try
            {
                //ReconfirmationId, BookingDetailsId, ReconfirmedBy, ReconfirmationCode, HotelEmpName, Mobile

                MySqlCommand cmd = new MySqlCommand("Sp_Reconfirmation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pReconfirmationId", ra.ReconfirmationId);
                cmd.Parameters.AddWithValue("pBookingDetailsId", ra.BookingDetailsId);
                cmd.Parameters.AddWithValue("pReconfirmedBy", ra.ReconfirmedBy);
                cmd.Parameters.AddWithValue("PReconfirmationCode", ra.ReconfirmationCode);
                cmd.Parameters.AddWithValue("pHotelEmpName", ra.HotelEmpName);
                cmd.Parameters.AddWithValue("PMobile", ra.Mobile);
                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objRec.Add(new Reconfirmationtbl
                    {
                        ReconfirmationId = Convert.ToInt32(dr["ReconfirmationId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        ReconfirmedBy = Convert.ToInt32(dr["ReconfirmedBy"]),
                        ReconfirmationCode = dr["ReconfirmationCode"].ToString(),
                        HotelEmpName = dr["HotelEmpName"].ToString(),
                        Mobile = dr["Mobile"].ToString(),
                   
                        Message = "Success",
                    });
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                objRec.Add(new Reconfirmationtbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objRec;
        }
    }

    public class  Reconfirmationtbl
    {
        //ReconfirmationId, BookingDetailsId, ReconfirmedBy, ReconfirmationCode, HotelEmpName, Mobile
        public int ReconfirmationId { get; set; }
        public int BookingDetailsId { get; set; }
        public int ReconfirmedBy { get; set; }
        public string ReconfirmationCode { get; set; }
        public string HotelEmpName { get; set; }
        public string Mobile { get; set; }
      
        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }


}






