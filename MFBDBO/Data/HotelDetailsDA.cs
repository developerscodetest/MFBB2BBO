using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace MFBDBO.Data
{
    public class HotelDetailsDA
    {


        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<HotelDetailstbl> HotelDetails(int type, HotelDetailstbl hd)
        {
            List<HotelDetailstbl> objHD = new List<HotelDetailstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_BD_HotelDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pHotelDetailsId", hd.HotelDetailsId);
                cmd.Parameters.AddWithValue("pHotelCode", hd.HotelCode);
                cmd.Parameters.AddWithValue("pHotelName", hd.HotelName);
                cmd.Parameters.AddWithValue("pDescription", hd.Description);
                cmd.Parameters.AddWithValue("pAddress", hd.Address);
                cmd.Parameters.AddWithValue("pCategory", hd.Category);
                cmd.Parameters.AddWithValue("pContactNumber", hd.ContactNumber);
                cmd.Parameters.AddWithValue("pCityID", hd.CityID);
                cmd.Parameters.AddWithValue("pCountryID", hd.CountryID);
                cmd.Parameters.AddWithValue("pLongitude", hd.Longitude);
                cmd.Parameters.AddWithValue("pLatitude", hd.Latitude);                   
                cmd.Parameters.AddWithValue("pCreatedBy", hd.CreatedBy);      
                cmd.Parameters.AddWithValue("pCreatedDate", hd.CreatedDate);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objHD.Add(new HotelDetailstbl
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        HotelCode = dr["HotelCode"].ToString(),
                        HotelName = dr["HotelName"].ToString(),
                        Address = dr["Address"].ToString(),
                        Description=dr["Description"].ToString(),
                        Category = Convert.ToInt32(dr["Category"]),
                        CityID=dr["CityID"].ToString(),
                        CountryID=dr["CountryID"].ToString(),
                        Longitude=dr["Longitude"].ToString(),
                        Latitude=dr["Latitude"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                objHD.Add(new HotelDetailstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objHD;
        }

    }
    public class HotelDetailstbl : Common
    {
      
      //  HotelDetailsId, HotelCode, HotelName, Description, Address, Category, ContactNumber, CityID, CountryID, Latitude, Longitude, CreatedBy, CreatedDate
        public int HotelDetailsId { get; set; }
        public string HotelCode { get; set; }
        public string HotelName { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public int Category { get; set; }   
        public string ContactNumber { get; set; }
        public string CityID { get; set; }
        public string CountryID { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
       


    }

}
    