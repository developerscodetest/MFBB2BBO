using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace MFBDBO.Data
{
    public class CuntryDocumentDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<CuntryDocumenttbl> CuntryDocuAll(int type, CuntryDocumenttbl st)
        {
            List<CuntryDocumenttbl> obj = new List<CuntryDocumenttbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_CuntryDocuments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pCDocumentId", st.CDocumentId);
                cmd.Parameters.AddWithValue("pCountryID", st.CountryID);
                cmd.Parameters.AddWithValue("pDocumentName", st.DocumentName);
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
                    obj.Add(new CuntryDocumenttbl
                    {
                        CDocumentId = Convert.ToInt32(dr["CDocumentId"]),
                        CountryID = Convert.ToInt32(dr["CountryID"]),
                        DocumentName = dr["DocumentName"].ToString(),
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
                obj.Add(new CuntryDocumenttbl
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
    public class CuntryDocumenttbl
    {
        //StateID, StateName, CountryID, IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int CDocumentId { get; set; }
        public int CountryID { get; set; }
        public string DocumentName { get; set; }
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