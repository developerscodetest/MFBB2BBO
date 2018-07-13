using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Data
{
    public class RoomDetailsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<RoomDetailstbl> RoomDetails(int type, RoomDetailstbl rd)
        {
            List<RoomDetailstbl> objRD = new List<RoomDetailstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_BD_RoomDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pRoomDetailsId", rd.RoomDetailsId);
                cmd.Parameters.AddWithValue("pBookingDetailsId", rd.BookingDetailsId);
                cmd.Parameters.AddWithValue("pAdults", rd.Adults);
                cmd.Parameters.AddWithValue("pKids", rd.Kids);
                cmd.Parameters.AddWithValue("pStatus", rd.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", rd.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", rd.CreatedDate);
                cmd.Parameters.AddWithValue("pRoomType", rd.RoomType);
                cmd.Parameters.AddWithValue("pPrice", rd.Price);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objRD.Add(new RoomDetailstbl
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                        Adults = Convert.ToInt32(dr["Adults"].ToString()),
                        Kids = Convert.ToInt32(dr["Kids"].ToString()),
                        RoomType = dr["RoomType"].ToString(),
                        Status=Convert.ToInt32(dr["Status"]),
                        CreatedBy= Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate=dr["CreatedDate"].ToString(),
                        Price = dr["Price"].ToString(),

                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                objRD.Add(new RoomDetailstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objRD;
        }
    }

    public class RoomDetailstbl
    {
        public int RoomDetailsId { get; set; }

        public int BookingDetailsId { get; set; }

        public int Adults { get; set; }

        public int Kids { get; set; }

        public string RoomType { get; set; }

        public string Price { get; set; }
         public int Status { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string Message { get; set; }

        public string ErrorMessage { get; set; }

        public List<GuestDetailstbl> GuestDetails { get; set; }
    }





}