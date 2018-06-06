using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class LeadsDA
    {
        //Leadstbl objleads = new Leadstbl();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        
        public IEnumerable<Leadstbl> LeadsAll(int type, Leadstbl ls)
        {
            List<Leadstbl> obj = new List<Leadstbl>();
            try
            {                
                MySqlCommand cmd = new MySqlCommand("Sp_Leads", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);               
                
                cmd.Parameters.AddWithValue("pLID", ls.LID);
                cmd.Parameters.AddWithValue("pAgencyName", ls.AgencyName);
                cmd.Parameters.AddWithValue("pContactPerson", ls.ContactPerson);
                cmd.Parameters.AddWithValue("pMobileNo", ls.MobileNo);
                cmd.Parameters.AddWithValue("pEmail", ls.Email);
                cmd.Parameters.AddWithValue("pStatus", ls.Status);
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
                    obj.Add(new Leadstbl
                    {
                        LID = dr["LID"].ToString(),
                        AgencyName = dr["AgencyName"].ToString(),
                        ContactPerson = dr["ContactPerson"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        Email = dr["Email"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
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
                obj.Add(new Leadstbl
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

    public class Leadstbl
    {
        public string LID { get; set; }

        public string AgencyName { get; set; }

        public string ContactPerson { get; set; }

        public string MobileNo { get; set; }

        public string Email { get; set; }

        public int Status { get; set; }

        public int IsActive { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

        public Common Common { get; set; }

    }

    public class Common
    {
        public int IsActive { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }
    }
}

