using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class RoleDA
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Roletbl> RoleAll(int type, Roletbl ls)
        {
            List<Roletbl> obj = new List<Roletbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Role", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pRoleId", ls.RoleId);
                cmd.Parameters.AddWithValue("pRoleName", ls.RoleName);
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
                    obj.Add(new Roletbl
                    {
                        RoleId = Convert.ToInt32(dr["RoleId"]),
                        RoleName = dr["RoleName"].ToString(),
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
                obj.Add(new Roletbl
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

    public class Roletbl
    {
        // RoleId, RoleName, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int RoleId { get; set; }

        public string RoleName { get; set; }

        public int IsActive { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }
}