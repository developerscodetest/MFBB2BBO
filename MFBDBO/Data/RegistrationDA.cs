using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace MFBDBO.Data
{
    public class RegistrationDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Agentstbl> AgentsAll(int type, Agentstbl at)
        {
            List<Agentstbl> obj = new List<Agentstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Registration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pAgentID", at.AgentID);
                cmd.Parameters.AddWithValue("pAgencyCode", at.AgencyCode);
                cmd.Parameters.AddWithValue("pAgencyName", at.AgencyName);
                cmd.Parameters.AddWithValue("pAgencyEmail", at.AgencyEmail);
                cmd.Parameters.AddWithValue("pFirstName", at.FirstName);
                cmd.Parameters.AddWithValue("pLastName", at.LastName);
                cmd.Parameters.AddWithValue("pContactName", at.ContactName);
                cmd.Parameters.AddWithValue("pMobileNo", at.MobileNo);
                cmd.Parameters.AddWithValue("pCategoryId", at.CategoryId);
                cmd.Parameters.AddWithValue("pWebsite", at.Website);
                cmd.Parameters.AddWithValue("pAddress", at.Address);
                cmd.Parameters.AddWithValue("pCountryId", at.CountryId);
                cmd.Parameters.AddWithValue("pStateID", at.StateID);
                cmd.Parameters.AddWithValue("pCityId", at.CityId);
                cmd.Parameters.AddWithValue("pPreferredCurrency", at.PreferredCurrency);
                cmd.Parameters.AddWithValue("pPincode", at.Pincode);
             //   cmd.Parameters.AddWithValue("pAgencyLogo", at.AgencyLogo);
                cmd.Parameters.AddWithValue("pIATAStatus", at.IATAStatus);
                cmd.Parameters.AddWithValue("pIATARegNo", at.IATARegNo);
                cmd.Parameters.AddWithValue("pReferredBy", at.ReferredBy);
                cmd.Parameters.AddWithValue("pStatus", at.Status);
                cmd.Parameters.AddWithValue("pPayNow", at.PayNow);
                cmd.Parameters.AddWithValue("pConfirmBooking", at.ConfirmBooking);
                cmd.Parameters.AddWithValue("pOfflineRequest", at.OfflineRequest);

                cmd.Parameters.AddWithValue("pIsActive", at.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", at.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", at.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", at.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", at.UpdatedDate);
                cmd.Parameters.AddWithValue("pCommission", at.Commission);
                cmd.Parameters.AddWithValue("pUserName", at.UserName);
                cmd.Parameters.AddWithValue("pPassword", at.Password);
                cmd.Parameters.AddWithValue("pAccountsName", at.AccountsName);
                cmd.Parameters.AddWithValue("pAccountsEmail", at.AccountsEmail);
                cmd.Parameters.AddWithValue("pAccountsMobileNumber", at.AccountsMobileNo);
                cmd.Parameters.AddWithValue("pOperationsName", at.OperationsName);
                cmd.Parameters.AddWithValue("pOperationsEmail", at.OperationsEmail);
                cmd.Parameters.AddWithValue("pOperationsMobileNumber", at.OperationsMobileNo);
                cmd.Parameters.AddWithValue("pManagementsEmail", at.ManagementsEmail);
                cmd.Parameters.AddWithValue("pManagementsName", at.ManagementsName);
                cmd.Parameters.AddWithValue("pManagementsMobileNumber", at.ManagementsMobileNo);
                cmd.Parameters.AddWithValue("pMfbStaff", at.MfbStaff);
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
                        StateID = dr["StateID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["StateID"]),
                        CityId = dr["CityId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CityId"]),
                        PreferredCurrency = dr["PreferredCurrency"].ToString(),
                        Pincode = dr["Pincode"].ToString(),
                        //  AgencyLogo = dr["AgencyLogo"].ToString(),
                        IATAStatus = dr["IATAStatus"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IATAStatus"]),
                        IATARegNo = dr["IATARegNo"].ToString(),
                        ReferredBy = dr["ReferredBy"].ToString(),
                        Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
                        PayNow = dr["PayNow"] == DBNull.Value ? 0 : Convert.ToInt32(dr["PayNow"]),
                        ConfirmBooking = dr["ConfirmBooking"] == DBNull.Value ? 0 : Convert.ToInt32(dr["ConfirmBooking"]),
                        OfflineRequest = dr["OfflineRequest"] == DBNull.Value ? 0 : Convert.ToInt32(dr["OfflineRequest"]),
                        IsActive = dr["IsActive"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Commission = dr["Commission"].ToString(),
                        AccountsName = dr["AccountsName"].ToString(),
                        AccountsEmail = dr["AccountsEmail"].ToString(),
                        AccountsMobileNo = dr["AccountsMobileNumber"].ToString(),
                        OperationsName = dr["OperationsName"].ToString(),
                        OperationsEmail = dr["OperationsEmail"].ToString(),
                        OperationsMobileNo = dr["OperationsMobileNumber"].ToString(),
                        ManagementsName = dr["ManagementsName"].ToString(),
                        ManagementsEmail = dr["ManagementsEmail"].ToString(),
                        ManagementsMobileNo = dr["ManagementsMobileNumber"].ToString(),
                        MfbStaff = dr["MfbStaff"].ToString(),
                        Message = "Success"
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
        public IEnumerable<AgentDocumentstbl> AgentsDocument(int type, AgentDocumentstbl at)
        {
            List<AgentDocumentstbl> obj = new List<AgentDocumentstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_AgentDocuments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pDocumentId", at.DocumentId);
                cmd.Parameters.AddWithValue("pAgentId", at.AgentId);
                cmd.Parameters.AddWithValue("pDocumentName", at.DocumentName);
                cmd.Parameters.AddWithValue("pFileName", at.FileName);
                cmd.Parameters.AddWithValue("pIsActive", at.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", at.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", at.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", at.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", at.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj.Add(new AgentDocumentstbl
                    {
                        DocumentId = Convert.ToInt32(dr["DocumentId"]),
                        AgentId = Convert.ToInt32(dr["AgentId"]),
                        DocumentName = dr["DocumentName"].ToString(),
                        FileName = dr["FileName"].ToString(),
                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                obj.Add(new AgentDocumentstbl
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

        public IEnumerable<AgentDocs> AgentsDocsInsert(int type, AgentDocs ad)
        {
            List<AgentDocs> obj = new List<AgentDocs>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Registration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pAgentID", ad.Agentstc.AgentID);
                cmd.Parameters.AddWithValue("pAgencyName", ad.Agentstc.AgencyName);
                cmd.Parameters.AddWithValue("pAgencyEmail", ad.Agentstc.AgencyEmail);
                cmd.Parameters.AddWithValue("pFirstName", ad.Agentstc.FirstName);
                cmd.Parameters.AddWithValue("pLastName", ad.Agentstc.LastName);
                cmd.Parameters.AddWithValue("pContactName", ad.Agentstc.ContactName);
                cmd.Parameters.AddWithValue("pMobileNo", ad.Agentstc.MobileNo);
                cmd.Parameters.AddWithValue("pCategoryId", ad.Agentstc.CategoryId);
                cmd.Parameters.AddWithValue("pWebsite", ad.Agentstc.Website);
                cmd.Parameters.AddWithValue("pAddress", ad.Agentstc.Address);
                cmd.Parameters.AddWithValue("pCountryId", ad.Agentstc.CountryId);
                cmd.Parameters.AddWithValue("pCityId", ad.Agentstc.CityId);
                cmd.Parameters.AddWithValue("pPreferredCurrency", ad.Agentstc.PreferredCurrency);
                cmd.Parameters.AddWithValue("pPincode", ad.Agentstc.Pincode);
                //cmd.Parameters.AddWithValue("pAgencyLogo", ad.Agentstc.AgencyLogo);
                cmd.Parameters.AddWithValue("pIATAStatus", ad.Agentstc.IATAStatus);
                cmd.Parameters.AddWithValue("pIATARegNo", ad.Agentstc.IATARegNo);
                cmd.Parameters.AddWithValue("pReferredBy", ad.Agentstc.ReferredBy);
                cmd.Parameters.AddWithValue("pIsActive", ad.Agentstc.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", ad.Agentstc.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ad.Agentstc.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ad.Agentstc.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ad.Agentstc.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                var i = cmd.ExecuteNonQuery();
                var last = cmd.LastInsertedId;
                if (i > 0)
                {
                    AgentDocumentstbl ads = new AgentDocumentstbl();
                    ads.AgentId = (int)last;
                    ads.DocumentName = ad.AgentsDocumentstc.DocumentName;
                    ads.FileName = ad.AgentsDocumentstc.FileName;
                    ads.IsActive = ad.AgentsDocumentstc.IsActive;
                    ads.CreatedBy = ad.AgentsDocumentstc.CreatedBy;
                    ads.CreatedDate = ad.AgentsDocumentstc.CreatedDate;
                    AgentsDocument(3, ads);

                    //foreach ( var p in ad.AgentsDocumentstc)
                    //{
                    //    AgentDocumentstbl ads = new AgentDocumentstbl();
                    //    ads.AgentId = (int)last;
                    //    ads.DocumentName = p.DocumentName;
                    //    ads.FileName = p.FileName;
                    //    ads.IsActive = p.IsActive;
                    //    ads.CreatedBy = p.CreatedBy;
                    //    ads.CreatedDate = p.CreatedDate;
                    //    AgentsDocument(3, ads);
                    //}                    
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                con.Close();
            }
            return obj;
        }
    }
    public class AgentDocs
    {
        public Agentstbl Agentstc { get; set; }
        public AgentDocumentstbl AgentsDocumentstc { get; set; }
        //public List<AgentDocumentstbl> AgentsDocumentstc { get; set; }
    }
    public class Agentstbl
    {
        //AgentID, AgencyName, AgencyEmail, FirstName, LastName, ContactName, MobileNo, CategoryId, Website, Address, CountryId, CityId, PreferredCurrency, Pincode, AgencyLogo, IATAStatus, IATARegNo, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int AgentID { get; set; }
        public string AgencyCode { get; set; }
        public string AgencyName { get; set; }
        public string AgencyEmail { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ContactName { get; set; }
        public String MobileNo { get; set; }
        public int CategoryId { get; set; }
        public string Website { get; set; }
        public string Address { get; set; }
        public int CountryId { get; set; }
      
        public int StateID { get; set; }
        public int CityId { get; set; }
        public string PreferredCurrency { get; set; }
        public string Pincode { get; set; }
     //   public string AgencyLogo { get; set; }
        public int IATAStatus { get; set; }
        public string IATARegNo { get; set; }
        public string ReferredBy { get; set; }
        public int Status { get; set; }
        public int PayNow { get; set; }
        public int ConfirmBooking { get; set; }
        public int OfflineRequest { get; set; }
        public string Commission { get; set; }
        public int IsActive { get; set; }
        public string AccountsName { get; set; }

        public string AccountsEmail { get; set; }
        public string AccountsMobileNo { get; set; }

        public string OperationsName { get; set; }
        public string OperationsEmail { get; set; }
        public string OperationsMobileNo { get; set; }

        public string ManagementsName { get; set; }
        public string ManagementsEmail { get; set; }
        public string ManagementsMobileNo { get; set; }
         public string MfbStaff { get; set; }


        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

















     
         public string Message { get; set; }
        public string ErrorMessage { get; set; }
    }
    public class AgentDocumentstbl
    {
        //DocumentId, AgentId, DocumentName, FileName, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int DocumentId { get; set; }
        public String DocumentName { get; set; }
        public int AgentId { get; set; }
        public string FileName { get; set; }
        public int IsActive { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }

    }

}