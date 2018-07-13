using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
 
namespace MFBDBO.Data
{
    public class LoginDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<Usertbl> UsersAll(int type, Usertbl ut)
        {
            List<Usertbl> objUsers = new List<Usertbl>();
            //List<Employeetbl> objEmployee = new lsit<Employeetbl>();
            try
            { // UserID, RoleID, loginuserId, Username, Password, Status, Created By, CreatedDate, UpdatedBy, UpdatedDate
                MySqlCommand cmd = new MySqlCommand("Sp_AdminLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pUsername", ut.Username);
                cmd.Parameters.AddWithValue("pPassword", ut.Password);
                cmd.Parameters.AddWithValue("pStatus", ut.Status);
                cmd.Parameters.AddWithValue("pEmail", ut.Email);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objUsers.Add(new Usertbl
                    {                       
                        UserID = Convert.ToInt32(dr["UserID"]),
                        RoleID = Convert.ToInt32(dr["RoleID"].ToString()),
                        LoginUserId = Convert.ToInt32(dr["loginuserId"]),
                        Username = dr["Username"].ToString(),
                        Password = dr["Password"].ToString(),
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
                objUsers.Add(new Usertbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objUsers;
        }
    }
}