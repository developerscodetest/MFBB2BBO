using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class AgentsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<Agentstbl> AgentsAll(int type, Agentstbl ls)
        {
            List<Agentstbl> obj = new List<Agentstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Agents", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pAgentID", ls.AgentID);
                cmd.Parameters.AddWithValue("pAgencyCode", ls.AgencyCode); 
                cmd.Parameters.AddWithValue("pAgencyName", ls.AgencyName);
                cmd.Parameters.AddWithValue("pAgencyEmail", ls.AgencyEmail);
                cmd.Parameters.AddWithValue("pFirstName", ls.FirstName);
                cmd.Parameters.AddWithValue("pLastName", ls.LastName);
                cmd.Parameters.AddWithValue("pContactName", ls.ContactName);
                cmd.Parameters.AddWithValue("pMobileNo", ls.MobileNo);
                cmd.Parameters.AddWithValue("pCategoryId", ls.CategoryId);
                cmd.Parameters.AddWithValue("pWebsite", ls.Website);
                cmd.Parameters.AddWithValue("pAddress", ls.Address);
                cmd.Parameters.AddWithValue("pCountryId", ls.CountryId);
                cmd.Parameters.AddWithValue("pCityId", ls.CityId);
                cmd.Parameters.AddWithValue("pPreferredCurrency", ls.PreferredCurrency);
                cmd.Parameters.AddWithValue("pPincode", ls.Pincode);
              //  cmd.Parameters.AddWithValue("pAgencyLogo", ls.AgencyLogo);
                cmd.Parameters.AddWithValue("pIATAStatus", ls.IATAStatus);
                cmd.Parameters.AddWithValue("pIATARegNo", ls.IATARegNo);
                cmd.Parameters.AddWithValue("pReferredBy", ls.ReferredBy);
                cmd.Parameters.AddWithValue("pStatus", ls.Status);
                cmd.Parameters.AddWithValue("pPayNow", ls.PayNow);
                cmd.Parameters.AddWithValue("pConfirmBooking", ls.ConfirmBooking);
                cmd.Parameters.AddWithValue("pOfflineRequest", ls.OfflineRequest);
                cmd.Parameters.AddWithValue("pIsActive", ls.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", ls.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ls.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ls.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ls.UpdatedDate);
                cmd.Parameters.AddWithValue("pCommission", ls.Commission);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj.Add(new Agentstbl
                    {
                        AgentID = dr["AgentID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),                        
                        AgencyName = dr["AgencyName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        CategoryId = dr["CategoryId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CategoryId"]),
                        Website = dr["Website"].ToString(),
                        Address = dr["Address"].ToString(),
                        CountryId = dr["CountryId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CountryId"]),
                        CityId = dr["CityId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CityId"]),
                        PreferredCurrency = dr["PreferredCurrency"].ToString(),
                        Pincode = dr["Pincode"].ToString(),
                        //AgencyLogo = dr["AgencyLogo"].ToString(),
                        IATAStatus = dr["IATAStatus"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IATAStatus"]),
                        IATARegNo = dr["IATARegNo"].ToString(),
                        ReferredBy = dr["ReferredBy"].ToString(),
                        Commission = dr["Commission"].ToString(),
                        IsActive = dr["IsActive"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsActive"]),
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
                obj.Add(new Agentstbl
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
    
    //public class Agentstbl
    //{
    //    public int AgentID { get; set; }

    //    public string AgencyCode { get; set; }

    //    public string AgencyName { get; set; }

    //    public string AgencyEmail { get; set; }

    //    public string FirstName { get; set; }

    //    public string LastName { get; set; }

    //    public string ContactName { get; set; }

    //    public string MobileNo { get; set; }

    //    public int CategoryId { get; set; }

    //    public string Website { get; set; }

    //    public string Address { get; set; }

    //    public int CountryId { get; set; }

    //    public int CityId { get; set; }

    //    public string PreferredCurrency { get; set; }

    //    public int Pincode { get; set; }

    //    public string AgencyLogo { get; set; }

    //    public int IATAStatus { get; set; }

    //    public string IATARegNo { get; set; }

    //    public string ReferredBy { get; set; }

    //    public string Commission { get; set; }

    //    public int IsActive { get; set; }

    //    public int CreatedBy { get; set; }

    //    public string CreatedDate { get; set; }

    //    public int UpdatedBy { get; set; }

    //    public string UpdatedDate { get; set; }

    //    public string Message { get; set; }

    //    public string ErrorMessage { get; set; }

    //    //public Common Common { get; set; }

    //}
}