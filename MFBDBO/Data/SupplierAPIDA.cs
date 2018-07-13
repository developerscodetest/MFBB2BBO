using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace MFBDBO.Data
{
    public class SupplierAPIDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<SupplierAPItbl> SupplierAPIAll(int type, SupplierAPItbl sa)
        {
            List<SupplierAPItbl> objsup = new List<SupplierAPItbl>();
            try
            {
                //SupplierAPIId, SupplierId, APILink, APIKey, Username, Password, Description

                MySqlCommand cmd = new MySqlCommand("Sp_SupplierAPI", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pSupplierAPIId", sa.SupplierAPIId);
                cmd.Parameters.AddWithValue("pSupplierId", sa.SupplierId);
                cmd.Parameters.AddWithValue("pAPILink", sa.APILink);
                cmd.Parameters.AddWithValue("PAPIKey", sa.APIKey);
                cmd.Parameters.AddWithValue("pUsername", sa.Username);             
                cmd.Parameters.AddWithValue("PPassword", sa.Password);
                cmd.Parameters.AddWithValue("pDescription", sa.Description);
            
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objsup.Add(new SupplierAPItbl
                    {
                        SupplierAPIId = Convert.ToInt32(dr["SupplierAPIId"]),
                        SupplierId = Convert.ToInt32(dr["SupplierId"]),
                        APILink = dr["APILink"].ToString(),
                        APIKey = dr["APIKey"].ToString(),
                        Username = dr["Username"].ToString(),
                        Password = dr["Password"].ToString(),
                        Description = dr["Description"].ToString(),
                       
                        Message = "Success",
                    });
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                objsup.Add(new SupplierAPItbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objsup;
        }
    }

    public class SupplierAPItbl
    {
        //-- SupplierAPIId, SupplierId, APILink, APIKey, Username, Password, Description
        public int SupplierAPIId { get; set; }
        public int SupplierId { get; set; }
        public string APILink { get; set; }
        public string APIKey { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public string Description { get; set; }
      
        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }


}






