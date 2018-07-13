using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Data
{
    public class BookingDetailsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<BookingDetailstbl> BookingDetails(int type, BookingDetailstbl bd)
        {
            List<BookingDetailstbl> objBD = new List<BookingDetailstbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_BD_BookingDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pBookingDetailsId", bd.BookingDetailsId);
                cmd.Parameters.AddWithValue("pHotelDetailsId", bd.HotelDetailsId);
                cmd.Parameters.AddWithValue("pAgentID", bd.AgentID);
                cmd.Parameters.AddWithValue("pSupplierID", bd.SupplierID);
                cmd.Parameters.AddWithValue("pSupBookingId", bd.SupBookingId);
                cmd.Parameters.AddWithValue("pAgentBookingId", bd.AgentBookingId);
                cmd.Parameters.AddWithValue("pCheckin", bd.Checkin);
                cmd.Parameters.AddWithValue("pCheckout", bd.Checkout);
                cmd.Parameters.AddWithValue("pNoofRooms", bd.NoofRooms);
                cmd.Parameters.AddWithValue("pAgentPrice", bd.AgentPrice);
                cmd.Parameters.AddWithValue("pSupplierPrice", bd.SupplierPrice);
                cmd.Parameters.AddWithValue("pStatus", bd.Status);
                cmd.Parameters.AddWithValue("pCancellation", bd.Cancellation);
                cmd.Parameters.AddWithValue("pAmendment", bd.Amendment);
                cmd.Parameters.AddWithValue("pPaymentType", bd.PaymentType);
                cmd.Parameters.AddWithValue("pPaymentStatus", bd.PaymentStatus);
                cmd.Parameters.AddWithValue("pNonRefundable", bd.NonRefundable);
                cmd.Parameters.AddWithValue("pCurrency", bd.Currency);
                cmd.Parameters.AddWithValue("pSupBookRef", bd.SupBookRef);
                cmd.Parameters.AddWithValue("pBookingDate", bd.BookingDate);
                cmd.Parameters.AddWithValue("pBookingComment", bd.BookingComment);
                cmd.Parameters.AddWithValue("pAdditionalInfo", bd.AdditionalInfo);
                cmd.Parameters.AddWithValue("pTitle", bd.Title);
                cmd.Parameters.AddWithValue("pName", bd.Name);
                cmd.Parameters.AddWithValue("pSurName", bd.SurName);
                cmd.Parameters.AddWithValue("pNationality", bd.Nationality);
                cmd.Parameters.AddWithValue("pMobileNumber", bd.MobileNumber);
                cmd.Parameters.AddWithValue("pEmailID", bd.EmailID);
                cmd.Parameters.AddWithValue("pBookingType", bd.BookingType);
                cmd.Parameters.AddWithValue("pConfirmationID", bd.ConfirmationID);
                cmd.Parameters.AddWithValue("pReConfirmationID", bd.ReConfirmationID);
                cmd.Parameters.AddWithValue("pCreatedBy", bd.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", bd.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", bd.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", bd.UpdatedDate);
           
                
               if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objBD.Add(new BookingDetailstbl
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        HotelDetailsId = dr["HotelDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["HotelDetailsId"]),
                        AgentID = dr["AgentID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentID"].ToString()),
                        SupplierID = dr["SupplierID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["SupplierID"].ToString()),
                         SupBookingId= dr["SupBookingId"].ToString(),
                         AgentBookingId=dr["AgentBookingId"].ToString(),
                         Checkin=dr["Checkin"].ToString(),
                         Checkout=dr["Checkout"].ToString(),
                        NoofRooms = dr["NoofRooms"] == DBNull.Value ? 0 : Convert.ToInt32(dr["NoofRooms"].ToString()),
                        AgentPrice=dr["AgentPrice"].ToString(),
                        SupplierPrice=dr["SupplierPrice"].ToString(),
                        Status = dr["Status"].ToString(),
                        Cancellation=dr["Cancellation"].ToString(),
                        Amendment=dr["Amendment"].ToString(),
                        PaymentType=dr["PaymentType"].ToString(),
                        PaymentStatus=dr["PaymentStatus"].ToString(),
                        NonRefundable=dr["NonRefundable"].ToString(),
                        Currency=dr["Currency"].ToString(),
                        SupBookRef = dr["SupBookRef"].ToString(),
                        BookingDate = dr["BookingDate"].ToString(),
                        BookingComment = dr["BookingComment"].ToString(),
                        AdditionalInfo = dr["AdditionalInfo"].ToString(),
                        Title = dr["Title"].ToString(),
                        Name = dr["Name"].ToString(),
                        SurName = dr["SurName"].ToString(),
                        //Nationality = dr["Nationality"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Nationality"]),
                        BookingType = dr["BookingType"].ToString(),
                        MobileNumber = dr["MobileNumber"].ToString(),
                        EmailID = dr["EmailID"].ToString(),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        ConfirmationID = dr["ConfirmationID"].ToString(),
                        ReConfirmationID = dr["ReConfirmationID"].ToString(),
                        Message = "Success",
                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                objBD.Add(new BookingDetailstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objBD;
        }
    }

  public class BookingDetailstbl

        {

        //BookingDetailsId, HotelDetailsId, AgentID, SupplierID, SupBookingId, AgentBookingId, Checkin, Checkout, NoofRooms, AgentPrice, SupplierPrice, Status, Cancellation, Amendment, PaymentType, PaymentStatus, NonRefundable, Currency, SupBookRef, BookingDate, BookingComment, AdditionalInfo, Title, Name, SurName, Nationality, MobileNumber, EmailID, BookingType, ConfirmationID, ReConfirmationID, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int BookingDetailsId { get; set; }
        public int HotelDetailsId { get; set; }
        public int AgentID { get; set; }
        public int SupplierID { get; set; }
        public string SupBookingId { get; set; }
        public string AgentBookingId { get; set; }
        public string Checkin { get; set; }
        public string Checkout{ get; set; }
        public int NoofRooms { get; set; }
        public string AgentPrice { get; set; }
        public string SupplierPrice { get; set; }
        public string Status { get; set; }
        public string Cancellation { get; set; }
        public string Amendment { get; set; }
        public string PaymentType { get; set; }
        public string PaymentStatus { get; set; }
        public string NonRefundable { get; set; }
        public string Currency { get; set; }
        public string SupBookRef { get; set; }
        public string BookingDate { get; set; }
        public string BookingComment { get; set; }
        public string AdditionalInfo { get; set; }
        public string Title { get; set; }
        public string Name { get; set; }
        public string SurName { get; set; }
        public int Nationality { get; set; }
        public string MobileNumber { get; set; }
        public string EmailID { get; set; }
        public string BookingType { get; set; }
        public string ConfirmationID { get; set; }
        public string ReConfirmationID { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }
        }
    }