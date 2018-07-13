using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class GuestDetailsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<GuestDetailstbl> GuestDetails(int type, GuestDetailstbl gd)
        {
            List<GuestDetailstbl> objGD = new List<GuestDetailstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_BD_GuestDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pGuestId", gd.GuestId);
                cmd.Parameters.AddWithValue("pBookingDetailsId", gd.BookingDetailsId);
                cmd.Parameters.AddWithValue("pRoomDetailsId", gd.RoomDetailsId);
                cmd.Parameters.AddWithValue("pFirstName", gd.FirstName);
                cmd.Parameters.AddWithValue("pLastName", gd.LastName);
                cmd.Parameters.AddWithValue("pSalutation", gd.Salutation);
                cmd.Parameters.AddWithValue("pType", gd.Type);
                cmd.Parameters.AddWithValue("pStatus", gd.Status);
                cmd.Parameters.AddWithValue("pUpdatedBy", gd.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", gd.UpdatedDate);
                cmd.Parameters.AddWithValue("pAge", gd.Age);
                cmd.Parameters.AddWithValue("pCreatedDate", gd.CreatedDate);
                cmd.Parameters.AddWithValue("pCreatedBy", gd.CreatedBy);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objGD.Add(new GuestDetailstbl
                    {

                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"].ToString()),
                        FirstName=dr["FirstName"].ToString(),
                        LastName=dr["LastName"].ToString(),
                        Type=dr["Type"].ToString(),
                        Salutation=dr["Salutation"].ToString(),
                        CreatedBy=Convert.ToInt32(dr[""]),                
                        Age = Convert.ToInt32(dr["Age"].ToString()),
                        Status=Convert.ToInt32(dr["Status"]),
                        UpdatedBy=dr["UpdatedBy"].ToString(),
                        UpdatedDate=dr["UpdatedDate"].ToString(),

                        CreatedDate = dr["CreatedDate"].ToString(),
                        Message = "Success",
                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                objGD.Add(new GuestDetailstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objGD;
        }

    }
    public class GuestDetailstbl
    {
        public int GuestId { get; set; }

        public int BookingDetailsId { get; set; }

        public int RoomDetailsId { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Salutation { get; set; }
        public string Type { get; set; }
        public int Age { get; set; }
        public int Status { get; set; }
        public string CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }
    }


}