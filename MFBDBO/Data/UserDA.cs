using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace MFBDBO.Data
{
    public class UserDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        
        public IEnumerable<Usertbl> UsersAll(int type, Usertbl ua)
        {
            List<Usertbl> objUser = new List<Usertbl>();
            try
            {
                //UserID, RoleID, LoginUserId, Username, Password, StatusId, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
                MySqlCommand cmd = new MySqlCommand("Sp_User", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pUserID", ua.UserID);
                cmd.Parameters.AddWithValue("pRoleID", ua.RoleID);
                cmd.Parameters.AddWithValue("pLoginUserId", ua.LoginUserId);
                cmd.Parameters.AddWithValue("pUsername", ua.Username);
                cmd.Parameters.AddWithValue("pPassword", ua.Password);
                cmd.Parameters.AddWithValue("pStatus", ua.Status);                
                cmd.Parameters.AddWithValue("pCreatedBy", ua.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ua.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ua.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ua.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objUser.Add(new Usertbl
                    {
                        UserID = dr["UserID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UserID"]),
                        RoleID = dr["RoleID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RoleID"]),
                        LoginUserId = dr["LoginUserId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["LoginUserId"]),
                        Username = dr["Username"].ToString(),
                        Password = dr["Password"].ToString(),
                        Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),                        
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",
                    });
                }
            }
            catch (Exception ex)
            {
                objUser.Add(new Usertbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objUser;
        }
    }

    public class Usertbl : Common
    {
        //UserID, RoleID, LoginUserId, Username, Password, StatusId, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate

        public int UserID { get; set; }
        public int RoleID { get; set; }
        public int LoginUserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }          
        public string Email { get; set; }      
    }
}