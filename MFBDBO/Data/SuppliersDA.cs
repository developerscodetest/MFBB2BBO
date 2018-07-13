using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class SuppliersDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Supplierstbl> SuppliersAll(int type, Supplierstbl ls)
        {
            List<Supplierstbl> obj = new List<Supplierstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Suppliers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);                
                cmd.Parameters.AddWithValue("pSupplierID", ls.SupplierID);
                cmd.Parameters.AddWithValue("pSupplier", ls.Supplier);
                cmd.Parameters.AddWithValue("pPersonName", ls.PersonName);
                cmd.Parameters.AddWithValue("pEmail", ls.Email);
                cmd.Parameters.AddWithValue("pMobileNo", ls.MobileNo);
                cmd.Parameters.AddWithValue("pAddress", ls.Address);
                cmd.Parameters.AddWithValue("pApiPurchaseDate", ls.ApiPurchaseDate);
                cmd.Parameters.AddWithValue("pApiKey", ls.ApiKey);
                cmd.Parameters.AddWithValue("pApiPurchaseValue", ls.ApiPurchaseValue);
                cmd.Parameters.AddWithValue("pAgentLink", ls.AgentLink);
                cmd.Parameters.AddWithValue("pSupplierCode", ls.SupplierCode);
                cmd.Parameters.AddWithValue("pUserName", ls.UserName);
                cmd.Parameters.AddWithValue("pPassword", ls.Password);
                cmd.Parameters.AddWithValue("pAcntName", ls.AcntName);
                cmd.Parameters.AddWithValue("pAcntEmail", ls.AcntEmail);
                cmd.Parameters.AddWithValue("pAcntNumber", ls.AcntNumber);
                cmd.Parameters.AddWithValue("pOperationName", ls.OperationName);
                cmd.Parameters.AddWithValue("pOperationEmail", ls.OperationEmail);
                cmd.Parameters.AddWithValue("pOperationNumber", ls.OperationNumber);
                cmd.Parameters.AddWithValue("pMngmtName", ls.MngmtName);
                cmd.Parameters.AddWithValue("pMngmtEmail", ls.MngmtEmail);
                cmd.Parameters.AddWithValue("pMngmtNumber", ls.MngmtNumber);
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
                    obj.Add(new Supplierstbl
                    {
                        SupplierID = Convert.ToInt32(dr["SupplierID"]),
                        Supplier = dr["Supplier"].ToString(),
                        PersonName = dr["PersonName"].ToString(),
                        Email = dr["Email"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        Address = dr["Address"].ToString(),
                        ApiPurchaseDate = dr["ApiPurchaseDate"].ToString(),
                        ApiKey = dr["ApiKey"].ToString(),
                        ApiPurchaseValue = dr["ApiPurchaseValue"].ToString(),
                        AgentLink = dr["AgentLink"].ToString(),
                        SupplierCode = dr["SupplierCode"].ToString(),
                        UserName = dr["UserName"].ToString(),
                        Password = dr["Password"].ToString(),
                        AcntName = dr["AcntName"].ToString(),
                        AcntEmail = dr["AcntEmail"].ToString(),
                        AcntNumber = dr["AcntNumber"].ToString(),
                        OperationName = dr["OperationName"].ToString(),
                        OperationEmail = dr["OperationEmail"].ToString(),
                        OperationNumber = dr["OperationNumber"].ToString(),
                        MngmtName = dr["MngmtName"].ToString(),
                        MngmtEmail = dr["MngmtEmail"].ToString(),
                        MngmtNumber = dr["MngmtNumber"].ToString(),
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
                obj.Add(new Supplierstbl
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
    public class Supplierstbl
    {
        public int SupplierID { get; set; }

        public string Supplier { get; set; }

        public string PersonName { get; set; }

        public string Email { get; set; }

        public string MobileNo { get; set; }

        public string Address { get; set; }

        public string ApiPurchaseDate { get; set; }

        public string ApiKey { get; set; }

        public string ApiPurchaseValue { get; set; }

        public string AgentLink { get; set; }

        public string SupplierCode { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

        public string AcntName { get; set; }

        public string AcntEmail { get; set; }

        public string AcntNumber { get; set; }

        public string OperationName { get; set; }

        public string OperationEmail { get; set; }

        public string OperationNumber { get; set; }

        public string MngmtName { get; set; }

        public string MngmtEmail { get; set; }

        public string MngmtNumber { get; set; }

        public int IsActive { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

        //public Common Common { get; set; }

    }
}