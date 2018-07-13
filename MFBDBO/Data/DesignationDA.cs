using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace MFBDBO.Data
{
    public class DesignationDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Designationtbl> DesignationAll(int type, Designationtbl st)
        {
            List<Designationtbl> obj = new List<Designationtbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Designation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pDesignationId", st.DesignationId);
                cmd.Parameters.AddWithValue("pDepartmentId", st.DepartmentId);
                cmd.Parameters.AddWithValue("pDesignationName", st.DesignationName);
                cmd.Parameters.AddWithValue("pIsActive", st.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", st.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", st.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", st.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", st.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj.Add(new Designationtbl
                    {
                        DesignationId = Convert.ToInt32(dr["DesignationId"]),
                        DepartmentId = Convert.ToInt32(dr["DepartmentId"]),
                        DesignationName = dr["DesignationName"].ToString(),
                        IsActive = Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",

                    });
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new Designationtbl
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
    public class Designationtbl
    {
        //DesignationId, DepartmentId, DesignationName, IsActive, CreatedDate, CreatedBy, UpdatedDate, UpdatedBy, ParentDesignationId
        public int DesignationId { get; set; }
        public int DepartmentId { get; set; }
        public string DesignationName { get; set; }
        public int IsActive { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }
        //public Countrytbl Country { get; set; }

    }
}