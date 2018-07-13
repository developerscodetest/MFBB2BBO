using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class UsersDA
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<Userstbl> UsersAll(int type, Userstbl ua)
        {
            List<Userstbl> objUsers = new List<Userstbl>();
            try
            {
                //UsersId, RoleId, Name, Username, Password, StatusId, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
                MySqlCommand cmd = new MySqlCommand("Sp_Users", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pUsersId", ua.UsersId);
                cmd.Parameters.AddWithValue("pRoleId", ua.RoleId);
                cmd.Parameters.AddWithValue("pName", ua.Name);
                cmd.Parameters.AddWithValue("pUsername", ua.Username);
                cmd.Parameters.AddWithValue("pPassword", ua.Password);
                cmd.Parameters.AddWithValue("pStatusId", ua.StatusId);
                cmd.Parameters.AddWithValue("pIsActive", ua.IsActive);
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
                    objUsers.Add(new Userstbl
                    {
                        UsersId = Convert.ToInt32(dr["UsersId"]),
                        RoleId = Convert.ToInt32(dr["RoleId"]),
                        Name = dr["Name"].ToString(),
                        Username = dr["Username"].ToString(),
                        Password = dr["Password"].ToString(),
                        StatusId = Convert.ToInt32(dr["StatusId"]),
                        IsActive = Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",
                    });
                }
            }
            catch (Exception ex)
            {
                objUsers.Add(new Userstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objUsers;
        }
    }

    public class Userstbl : Common
    {
        //UsersId, RoleId, Name, Username, Password, StatusId, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate

        public int UsersId { get; set; }
        public int RoleId { get; set; }
        public string Name { get; set; }
        public String Username { get; set; }
        public string Password { get; set; }
        public int StatusId { get; set; }
    }
}