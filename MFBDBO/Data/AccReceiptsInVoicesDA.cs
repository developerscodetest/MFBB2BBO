using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class AccReceiptsInVoicesDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<AccReceiptInVoicestbl> AccReceiptsInVoicesAll(int type, AccReceiptInVoicestbl lv)
        {
            List<AccReceiptInVoicestbl> obj = new List<AccReceiptInVoicestbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_AccReceiptsInVoices", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pInVoiceID", lv.InVoiceID);
                cmd.Parameters.AddWithValue("pReceiptID", lv.ReceiptID);
                cmd.Parameters.AddWithValue("pRecieved", lv.Recieved);
                cmd.Parameters.AddWithValue("pOutstanding", lv.Outstanding);
                cmd.Parameters.AddWithValue("pDueDate", lv.DueDate);
                cmd.Parameters.AddWithValue("pRecievedAmount", lv.RecievedAmount);
                cmd.Parameters.AddWithValue("pStatus", lv.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", lv.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", lv.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", lv.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", lv.UpdatedDate);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj.Add(new AccReceiptInVoicestbl
                    {
                        InVoiceID = Convert.ToInt32(dr["InVoiceID"]),
                        ReceiptID = Convert.ToInt32(dr["ReceiptID"]),
                        Recieved = dr["Recieved"].ToString(),
                        Outstanding = dr["Outstanding"].ToString(),
                        DueDate = dr["DueDate"].ToString(),
                        RecievedAmount = dr["RecievedAmount"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
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
                obj.Add(new AccReceiptInVoicestbl
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

    public class AccReceiptInVoicestbl
    {
        public int InVoiceID { get; set; }

        public int ReceiptID { get; set; }

        public string Recieved { get; set; }

        public string Outstanding { get; set; }

        public string DueDate { get; set; }

        public string RecievedAmount { get; set; }

        public int Status { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }

        //public Common Common { get; set; }

    }
}