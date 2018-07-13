using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Data
{
    public class TeamDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Teamtbl> TeamAll(int type, Teamtbl ta)
        {
            List<Teamtbl> objteam = new List<Teamtbl>();
            try
            {
                //-- TeamId, Type, Name, Email, MobileNo, Status, Consultant, DesignationId, RoleId

                MySqlCommand cmd = new MySqlCommand("Sp_Team", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pTeamId", ta.TeamId);
                cmd.Parameters.AddWithValue("pType", ta.Type);
                cmd.Parameters.AddWithValue("pName", ta.Name);
                cmd.Parameters.AddWithValue("PEmail", ta.Email);
                cmd.Parameters.AddWithValue("pMobileNo", ta.MobileNo);
                cmd.Parameters.AddWithValue("pStatus", ta.Status);
                cmd.Parameters.AddWithValue("PConsultant", ta.Consultant);
                cmd.Parameters.AddWithValue("pDesignationId", ta.DesignationId);
                cmd.Parameters.AddWithValue("pRoleId", ta.RoleId);
               
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objteam.Add(new Teamtbl
                    {
                        TeamId = Convert.ToInt32(dr["TeamId"]),
                        Type = Convert.ToInt32(dr["Type"]),
                        Name = dr["Branch"].ToString(),
                        Email = dr["Address"].ToString(),
                        MobileNo = dr["AccountNumber"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        Consultant = Convert.ToBoolean(dr["Consultant"]),
                        DesignationId = Convert.ToInt32(dr["DesignationId"]),
                        RoleId = Convert.ToInt32(dr["RoleId"]),
                        
                      
                        Message = "Success",
                    });
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                objteam.Add(new Teamtbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message
                });
            }
            finally
            {
                con.Close();
            }
            return objteam;
        }
    }

    public class Teamtbl
    {
        //-- TeamId, Type, Name, Email, MobileNo, Status, Consultant, DesignationId, RoleId
        public int TeamId { get; set; }
        public int Type { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string MobileNo { get; set; }
        public int Status { get; set; }

        public bool Consultant { get; set; }
        public int DesignationId { get; set; }

        public int RoleId { get; set; }

    

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

    }


}




