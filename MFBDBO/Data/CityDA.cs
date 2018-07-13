using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;


namespace MFBDBO.Data
{
    public class CityDA
    {

          MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
            public IEnumerable<Citytbl> CityAll(int type, Citytbl ct)
            {
                List<Citytbl> objCity = new List<Citytbl>();
                try
                {
                  //  CityID, CityName, StateID, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
                    MySqlCommand cmd = new MySqlCommand("Sp_City", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("type", type);
                    cmd.Parameters.AddWithValue("pCityID", ct.CityID);
                    cmd.Parameters.AddWithValue("pCityName", ct.CityName);
                    cmd.Parameters.AddWithValue("pStateID", ct.StateID);
                    cmd.Parameters.AddWithValue("pIsActive", ct.IsActive);
                    cmd.Parameters.AddWithValue("pCreatedBy", ct.CreatedBy);
                    cmd.Parameters.AddWithValue("pCreatedDate", ct.CreatedDate);
                    cmd.Parameters.AddWithValue("pUpdatedBy", ct.UpdatedBy);
                    cmd.Parameters.AddWithValue("pUpdatedDate", ct.UpdatedDate);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        objCity.Add(new Citytbl
                        {
                            CityID = Convert.ToInt32(dr["CityID"]),
                            CityName = dr["CityName"].ToString(),
                            StateID=Convert.ToInt32(dr["StateID"]),
                            //StateName = dr["StateName"].ToString(),
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
                    objCity.Add(new Citytbl
                    {
                        Message = "Error",
                        ErrorMessage = ex.Message
                    });
                }
                finally
                {
                    con.Close();
                }
                return objCity;
            }
        }

        public class Citytbl
    {
            //CityID, CityName, StateID, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
            public int CityID { get; set; }

            public string CityName { get; set; }

            public int StateID { get; set; }

            public string StateName { get; set; }

            public int IsActive { get; set; }

            public int CreatedBy { get; set; }

            public string CreatedDate { get; set; }

            public int UpdatedBy { get; set; }

            public string UpdatedDate { get; set; }

            public string Message { get; set; }

            public string ErrorMessage { get; set; }

        }
    }