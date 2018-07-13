using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class AllBookingsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Booking> AllBookings(int type, AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        //Gueststbl gs, Hoteagtbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            List<AllBookingstbl> obj = new List<AllBookingstbl>();
            List<Gueststbl> obj1 = new List<Gueststbl>();
            List<Hotelstbl> obj2 = new List<Hotelstbl>();
            List<Roomstbl> obj3 = new List<Roomstbl>();
            List<Supplierstbl> obj4 = new List<Supplierstbl>();
            List<Agentstbl> obj5 = new List<Agentstbl>();
            List<Booking> objBook = new List<Booking>();
            try
            {       
                MySqlCommand cmd = new MySqlCommand("Sp_BookingsAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);          
                cmd.Parameters.AddWithValue("pBookingDetailsId", ls.BookingDetailsId);
                //cmd.Parameters.AddWithValue("pBookingId", ls.BookingId);
                cmd.Parameters.AddWithValue("pAgentBookingId", ls.AgentBookingId);
                cmd.Parameters.AddWithValue("pSupBookingId", ls.SupBookingId);
                cmd.Parameters.AddWithValue("pAgentPrice", ls.AgentPrice); 
                cmd.Parameters.AddWithValue("pHotelDetailsId", ls.HotelDetailsId);
                cmd.Parameters.AddWithValue("pCheckinDate", ls.CheckinDate);
                cmd.Parameters.AddWithValue("pChekoutDate", ls.ChekoutDate);
                cmd.Parameters.AddWithValue("pNoofRooms", ls.NoofRooms);
                cmd.Parameters.AddWithValue("pTotalPrice", ls.TotalPrice);
                cmd.Parameters.AddWithValue("pStatus", ls.Status);
                cmd.Parameters.AddWithValue("pAgentID", ls.AgentID);
                cmd.Parameters.AddWithValue("pCreatedBy", ls.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", ls.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", ls.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", ls.UpdatedDate);
                cmd.Parameters.AddWithValue("pConfirmationID", ls.ConfirmationID);
                cmd.Parameters.AddWithValue("pReConfirmationID", ls.ReConfirmationID);
                cmd.Parameters.AddWithValue("pSupplierID", sp.SupplierID);
                cmd.Parameters.AddWithValue("pBookingDate", ls.BookingDate);

                cmd.Parameters.AddWithValue("pGuestId", gs.GuestId);
                //cmd.Parameters.AddWithValue("pRoomDetailsId", gs.RoomDetailsId);
                cmd.Parameters.AddWithValue("pgFirstName", gs.FirstName);
                cmd.Parameters.AddWithValue("pgLastName", gs.LastName);
                cmd.Parameters.AddWithValue("pSalutation", gs.Salutation);
                cmd.Parameters.AddWithValue("pType", gs.Type);
                cmd.Parameters.AddWithValue("pAge", gs.Age);

                cmd.Parameters.AddWithValue("pHotelId", hs.HotelId);
                cmd.Parameters.AddWithValue("pHotelName", hs.HotelName);
                cmd.Parameters.AddWithValue("pHotelAddress", hs.HotelAddress);
                cmd.Parameters.AddWithValue("pHotelLocation", hs.HotelLocation);
                cmd.Parameters.AddWithValue("pContactNumber", hs.ContactNumber);

                cmd.Parameters.AddWithValue("pRoomDetailsId", rs.RoomDetailsId);
                //cmd.Parameters.AddWithValue("pBookingDetailsId", rs.BookingDetailsId);
                cmd.Parameters.AddWithValue("pAdults", rs.Adults);
                cmd.Parameters.AddWithValue("pKids", rs.Kids);
                cmd.Parameters.AddWithValue("pRoomType", rs.RoomType);
                cmd.Parameters.AddWithValue("pPrice", rs.Price);

                cmd.Parameters.AddWithValue("pSupplier", sp.Supplier);
                cmd.Parameters.AddWithValue("pPersonName", sp.PersonName);
                cmd.Parameters.AddWithValue("pEmail", sp.Email);
                cmd.Parameters.AddWithValue("pMobileNo", sp.MobileNo);
                cmd.Parameters.AddWithValue("pAddress", sp.Address);
                cmd.Parameters.AddWithValue("pApiPurchaseDate", sp.ApiPurchaseDate);
                cmd.Parameters.AddWithValue("pApiKey", sp.ApiKey);
                cmd.Parameters.AddWithValue("pApiPurchaseValue", sp.ApiPurchaseValue);
                cmd.Parameters.AddWithValue("pAgentLink", sp.AgentLink);
                cmd.Parameters.AddWithValue("pSupplierCode", sp.SupplierCode);
                cmd.Parameters.AddWithValue("pUserName", sp.UserName);
                cmd.Parameters.AddWithValue("pPassword", sp.Password);
                cmd.Parameters.AddWithValue("pAcntName", sp.AcntName);
                cmd.Parameters.AddWithValue("pAcntEmail", sp.AcntEmail);
                cmd.Parameters.AddWithValue("pAcntNumber", sp.AcntNumber);
                cmd.Parameters.AddWithValue("pOperationName", sp.OperationName);
                cmd.Parameters.AddWithValue("pOperationEmail", sp.OperationEmail);
                cmd.Parameters.AddWithValue("pOperationNumber", sp.OperationNumber);
                cmd.Parameters.AddWithValue("pMngmtName", sp.MngmtName);
                cmd.Parameters.AddWithValue("pMngmtEmail", sp.MngmtEmail);
                cmd.Parameters.AddWithValue("pMngmtNumber", sp.MngmtNumber);
                cmd.Parameters.AddWithValue("pIsActive", sp.IsActive);

                //cmd.Parameters.AddWithValue("pAgentID", ag.AgentID);
                cmd.Parameters.AddWithValue("pAgencyName", ag.AgencyName);
                cmd.Parameters.AddWithValue("pAgencyCode", ag.AgencyCode);
                cmd.Parameters.AddWithValue("pAgencyEmail", ag.AgencyEmail);
                cmd.Parameters.AddWithValue("pFirstName", ag.FirstName);
                cmd.Parameters.AddWithValue("pLastName", ag.LastName);
                cmd.Parameters.AddWithValue("pContactName", ag.ContactName);
                cmd.Parameters.AddWithValue("pCategoryId", ag.CategoryId);
                cmd.Parameters.AddWithValue("pWebsite", ag.Website);
                cmd.Parameters.AddWithValue("pCountryId", ag.CountryId);
                cmd.Parameters.AddWithValue("pCityId", ag.CityId);
                cmd.Parameters.AddWithValue("pPreferredCurrency", ag.PreferredCurrency);
                cmd.Parameters.AddWithValue("pPincode", ag.Pincode);
                //cmd.Parameters.AddWithValue("pAgencyLogo", ag.AgencyLogo);
                cmd.Parameters.AddWithValue("pIATAStatus", ag.IATAStatus);
                cmd.Parameters.AddWithValue("pIATARegNo", ag.IATARegNo);
                cmd.Parameters.AddWithValue("pReferredBy", ag.ReferredBy);
                cmd.Parameters.AddWithValue("pCommission", ag.Commission);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Booking bg = new Booking();
                    AllBookingstbl abt = new AllBookingstbl
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        SupBookingId = dr["SupBookingId"].ToString(),
                        AgentBookingId = dr["AgentBookingId"].ToString(),
                        AgentPrice = dr["AgentPrice"].ToString(),
                        HotelDetailsId = dr["HotelDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["HotelDetailsId"]),
                        CheckinDate = dr["Checkin"].ToString(),
                        ChekoutDate = dr["Checkout"].ToString(),
                        BookingDate = dr["BookingDate"].ToString(),
                        NoofRooms = dr["NoofRooms"] == DBNull.Value ? 0 : Convert.ToInt32(dr["NoofRooms"].ToString()),
                        TotalPrice = dr["AgentPrice"].ToString(),
                        Status = dr["Status"].ToString(),
                        AgentID = dr["AgentID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentID"].ToString()),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        SupplierID = Convert.ToInt32(dr["SupplierID"].ToString()),
                        ConfirmationID = dr["ConfirmationID"].ToString(),
                        ReConfirmationID = dr["ReConfirmationID"].ToString(),
                        Message = "Success",
                    };
                    bg.AllBookingstc = abt;

                    Gueststbl gst = new Gueststbl
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"].ToString()),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Salutation = dr["Salutation"].ToString(),
                        Type = dr["Type"].ToString(),                        
                        Age = Convert.ToInt32(dr["Age"].ToString()),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        Message = "Success",
                    };
                    bg.Gueststc = gst;

                    Hotelstbl hst = new Hotelstbl
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"].ToString()),
                        HotelName = dr["HotelName"].ToString(),
                        HotelAddress = dr["HotelAddress"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        Message = "Success",
                    };
                    bg.Hotelstc = hst;

                    Roomstbl rms = new Roomstbl
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                        Adults = Convert.ToInt32(dr["Adults"].ToString()),
                        Kids = Convert.ToInt32(dr["Kids"].ToString()),
                        RoomType = dr["RoomType"].ToString(),
                        Price = dr["Price"].ToString(),
                        Message = "Success",
                    };
                    bg.Roomstc = rms;

                    Supplierstbl sps = new Supplierstbl
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
                    };
                    bg.Supplierstc = sps;

                    Agentstbl ats = new Agentstbl
                    {
                        AgentID = dr["AgentID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),
                        AgencyName = dr["AgencyName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        //CategoryId = dr["CategoryId"].ToString(),
                        //CategoryId = dr["CategoryId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CategoryId"]),
                        Website = dr["Website"].ToString(),
                        Address = dr["Address"].ToString(),
                        //CountryId = dr["CountryId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CountryId"]),
                        //CityId = dr["CityId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CityId"]),
                        //PreferredCurrency = dr["PreferredCurrency"].ToString(),
                        Pincode = dr["Pincode"].ToString(),
                        //AgencyLogo = dr["AgencyLogo"].ToString(),
                        IATAStatus = Convert.ToInt32(dr["IATAStatus"]), 
                        IATARegNo = dr["IATARegNo"].ToString(),
                        ReferredBy = dr["ReferredBy"].ToString(),
                        Commission = dr["Commission"].ToString(),
                        IsActive = dr["IsActive"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",

                    };
                    bg.Agentstc = ats;
                    objBook.Add(bg);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new AllBookingstbl
                //objBook.Add(new Booking
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objBook;
        }

        public IEnumerable<Booking> AllBookingsWithSearch(int type, AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        //Gueststbl gs, Hoteagtbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            List<AllBookingstbl> obj = new List<AllBookingstbl>();
            List<Gueststbl> obj1 = new List<Gueststbl>();
            List<Hotelstbl> obj2 = new List<Hotelstbl>();
            List<Roomstbl> obj3 = new List<Roomstbl>();
            List<Supplierstbl> obj4 = new List<Supplierstbl>();
            List<Agentstbl> obj5 = new List<Agentstbl>();
            List<Booking> objBook = new List<Booking>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_BookingsAllWithSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pBookingDetailsId", ls.BookingDetailsId);
                //cmd.Parameters.AddWithValue("pBookingId", ls.BookingId);
                //cmd.Parameters.AddWithValue("pSupBookingId", ls.SupBookingId);
                //cmd.Parameters.AddWithValue("pHotelDetailsId", ls.HotelDetailsId);
                //cmd.Parameters.AddWithValue("pCheckinDate", ls.CheckinDate);
                //cmd.Parameters.AddWithValue("pChekoutDate", ls.ChekoutDate);
                //cmd.Parameters.AddWithValue("pNoofRooms", ls.NoofRooms);
                //cmd.Parameters.AddWithValue("pTotalPrice", ls.TotalPrice);
                //cmd.Parameters.AddWithValue("pStatus", ls.Status);
                //cmd.Parameters.AddWithValue("pAgentID", ls.AgentID);
                //cmd.Parameters.AddWithValue("pCreatedBy", ls.CreatedBy);
                //cmd.Parameters.AddWithValue("pCreatedDate", ls.CreatedDate);
                //cmd.Parameters.AddWithValue("pUpdatedBy", ls.UpdatedBy);
                //cmd.Parameters.AddWithValue("pUpdatedDate", ls.UpdatedDate);
                //cmd.Parameters.AddWithValue("pConfirmationID", ls.ConfirmationID);
                //cmd.Parameters.AddWithValue("pReConfirmationID", ls.ReConfirmationID);
                //cmd.Parameters.AddWithValue("pSupplierID", sp.SupplierID);

                //cmd.Parameters.AddWithValue("pGuestId", gs.GuestId);
                ////cmd.Parameters.AddWithValue("pRoomDetailsId", gs.RoomDetailsId);
                //cmd.Parameters.AddWithValue("pgFirstName", gs.FirstName);
                //cmd.Parameters.AddWithValue("pgLastName", gs.LastName);
                //cmd.Parameters.AddWithValue("pSalutation", gs.Salutation);
                //cmd.Parameters.AddWithValue("pType", gs.Type);
                //cmd.Parameters.AddWithValue("pAge", gs.Age);

                //cmd.Parameters.AddWithValue("pHotelId", hs.HotelId);
                //cmd.Parameters.AddWithValue("pHotelName", hs.HotelName);
                //cmd.Parameters.AddWithValue("pHotelAddress", hs.HotelAddress);
                //cmd.Parameters.AddWithValue("pHotelLocation", hs.HotelLocation);
                //cmd.Parameters.AddWithValue("pContactNumber", hs.ContactNumber);

                //cmd.Parameters.AddWithValue("pRoomDetailsId", rs.RoomDetailsId);
                ////cmd.Parameters.AddWithValue("pBookingDetailsId", rs.BookingDetailsId);
                //cmd.Parameters.AddWithValue("pAdults", rs.Adults);
                //cmd.Parameters.AddWithValue("pKids", rs.Kids);
                //cmd.Parameters.AddWithValue("pRoomType", rs.RoomType);
                //cmd.Parameters.AddWithValue("pPrice", rs.Price);

                //cmd.Parameters.AddWithValue("pAgencyName", sp.AgencyName);
                //cmd.Parameters.AddWithValue("pPersonName", sp.PersonName);
                //cmd.Parameters.AddWithValue("pEmail", sp.Email);
                //cmd.Parameters.AddWithValue("pMobileNo", sp.MobileNo);
                //cmd.Parameters.AddWithValue("pAddress", sp.Address);
                //cmd.Parameters.AddWithValue("pApiPurchaseDate", sp.ApiPurchaseDate);
                //cmd.Parameters.AddWithValue("pApiKey", sp.ApiKey);
                //cmd.Parameters.AddWithValue("pApiPurchaseValue", sp.ApiPurchaseValue);
                //cmd.Parameters.AddWithValue("pAgentLink", sp.AgentLink);
                //cmd.Parameters.AddWithValue("pAgentCode", sp.AgentCode);
                //cmd.Parameters.AddWithValue("pUserName", sp.UserName);
                //cmd.Parameters.AddWithValue("pPassword", sp.Password);
                //cmd.Parameters.AddWithValue("pAcntName", sp.AcntName);
                //cmd.Parameters.AddWithValue("pAcntEmail", sp.AcntEmail);
                //cmd.Parameters.AddWithValue("pAcntNumber", sp.AcntNumber);
                //cmd.Parameters.AddWithValue("pOperationName", sp.OperationName);
                //cmd.Parameters.AddWithValue("pOperationEmail", sp.OperationEmail);
                //cmd.Parameters.AddWithValue("pOperationNumber", sp.OperationNumber);
                //cmd.Parameters.AddWithValue("pMngmtName", sp.MngmtName);
                //cmd.Parameters.AddWithValue("pMngmtEmail", sp.MngmtEmail);
                //cmd.Parameters.AddWithValue("pMngmtNumber", sp.MngmtNumber);
                //cmd.Parameters.AddWithValue("pIsActive", sp.IsActive);

                ////cmd.Parameters.AddWithValue("pAgentID", ag.AgentID);
                //cmd.Parameters.AddWithValue("pAgencyCode", ag.AgencyCode);
                //cmd.Parameters.AddWithValue("pAgencyEmail", ag.AgencyEmail);
                //cmd.Parameters.AddWithValue("pFirstName", ag.FirstName);
                //cmd.Parameters.AddWithValue("pLastName", ag.LastName);
                //cmd.Parameters.AddWithValue("pContactName", ag.ContactName);
                //cmd.Parameters.AddWithValue("pCategoryId", ag.CategoryId);
                //cmd.Parameters.AddWithValue("pWebsite", ag.Website);
                //cmd.Parameters.AddWithValue("pCountryId", ag.CountryId);
                //cmd.Parameters.AddWithValue("pCityId", ag.CityId);
                //cmd.Parameters.AddWithValue("pPreferredCurrency", ag.PreferredCurrency);
                //cmd.Parameters.AddWithValue("pPincode", ag.Pincode);
                //cmd.Parameters.AddWithValue("pAgencyLogo", ag.AgencyLogo);
                //cmd.Parameters.AddWithValue("pIATAStatus", ag.IATAStatus);
                //cmd.Parameters.AddWithValue("pIATARegNo", ag.IATARegNo);
                //cmd.Parameters.AddWithValue("pReferredBy", ag.ReferredBy);
                //cmd.Parameters.AddWithValue("pCommission", ag.Commission);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Booking bg = new Booking();
                    AllBookingstbl abt = new AllBookingstbl
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        SupBookingId = dr["SupBookingId"].ToString(),
                        AgentBookingId = dr["AgentBookingId"].ToString(),
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        CheckinDate = dr["Checkin"].ToString(),
                        ChekoutDate = dr["Checkout"].ToString(),
                        NoofRooms = Convert.ToInt32(dr["NoofRooms"].ToString()),
                        TotalPrice = dr["AgentPrice"].ToString(),
                        Status = dr["Status"].ToString(),
                        AgentID = Convert.ToInt32(dr["AgentID"].ToString()),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        SupplierID = Convert.ToInt32(dr["SupplierID"].ToString()),
                        ConfirmationID = dr["ConfirmationID"].ToString(),
                        ReConfirmationID = dr["ReConfirmationID"].ToString(),
                        Message = "Success",
                    };
                    bg.AllBookingstc = abt;

                    //Gueststbl gst = new Gueststbl
                    //{
                    //    GuestId = Convert.ToInt32(dr["GuestId"]),
                    //    BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                    //    RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"].ToString()),
                    //    FirstName = dr["FirstName"].ToString(),
                    //    LastName = dr["LastName"].ToString(),
                    //    Salutation = dr["Salutation"].ToString(),
                    //    Type = dr["Type"].ToString(),
                    //    Age = Convert.ToInt32(dr["Age"].ToString()),
                    //    CreatedDate = dr["CreatedDate"].ToString(),
                    //    Message = "Success",
                    //};
                    //bg.Gueststc = gst;

                    Hotelstbl hst = new Hotelstbl
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"].ToString()),
                        HotelName = dr["HotelName"].ToString(),
                        HotelAddress = dr["Address"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        Message = "Success",
                    };
                    bg.Hotelstc = hst;

                    //Roomstbl rms = new Roomstbl
                    //{
                    //    RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                    //    BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                    //    Adults = Convert.ToInt32(dr["Adults"].ToString()),
                    //    Kids = Convert.ToInt32(dr["Kids"].ToString()),
                    //    RoomType = dr["RoomType"].ToString(),
                    //    Price = dr["Price"].ToString(),
                    //    Message = "Success",
                    //};
                    //bg.Roomstc = rms;

                    Supplierstbl sps = new Supplierstbl
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
                        IsActive = dr["IsActive"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",
                    };
                    bg.Supplierstc = sps;

                    Agentstbl ats = new Agentstbl
                    {                      
                        AgentID = dr["AgentID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),
                        AgencyName = dr["AgencyName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        CategoryId =Convert.ToInt32(dr["CategoryId"]),
                        Website = dr["Website"].ToString(),
                        Address = dr["Address"].ToString(),
                        //CountryId = dr["CountryId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CountryId"]),
                        //CityId = dr["CityId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CityId"]),
                        //PreferredCurrency = dr["PreferredCurrency"].ToString(),
                        Pincode = dr["Pincode"].ToString(),
                        //AgencyLogo = dr["AgencyLogo"].ToString(),
                        IATAStatus =Convert.ToInt32 (dr["IATAStatus"]),
                        //dr["IATAStatus"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IATAStatus"]),
                        IATARegNo = dr["IATARegNo"].ToString(),
                        ReferredBy = dr["ReferredBy"].ToString(),
                        Commission = dr["Commission"].ToString(),
                        IsActive = dr["IsActive"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",

                    };
                    bg.Agentstc = ats;
                    objBook.Add(bg);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new AllBookingstbl
                //objBook.Add(new Booking
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objBook;
        }

        public IEnumerable<Booking> AllBookingsSearch(int type, AllBookingsSearchtbl als)
        //Gueststbl gs, Hoteagtbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            List<Booking> obj1 = new List<Booking>();            
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_AllBookingSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);                
                cmd.Parameters.AddWithValue("pStatus", als.BStatus);
                cmd.Parameters.AddWithValue("pAgentID", als.AgentID);
                cmd.Parameters.AddWithValue("pSupplierID", als.SupplierID);
                cmd.Parameters.AddWithValue("pSupBookingID", als.SupBookingID);
                cmd.Parameters.AddWithValue("pAgentBookingID", als.AgentBookingID);
                cmd.Parameters.AddWithValue("pStaff", als.Staff);
                cmd.Parameters.AddWithValue("pFromDate", als.FromDate);
                cmd.Parameters.AddWithValue("pToDate", als.ToDate);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    AllBookingstbl bdtbl = new AllBookingstbl()
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        SupBookingId = dr["SupBookingId"].ToString(),
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        CheckinDate = dr["Checkin"].ToString(),
                        ChekoutDate = dr["Checkout"].ToString(),
                        NoofRooms = Convert.ToInt32(dr["NoofRooms"].ToString()),
                        TotalPrice = dr["AgentPrice"].ToString(),
                        Status = dr["Status"].ToString(),
                        AgentID = Convert.ToInt32(dr["AgentID"].ToString()),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        SupplierID = Convert.ToInt32(dr["SupplierID"].ToString()),
                        ConfirmationID = dr["ConfirmationID"].ToString(),
                        ReConfirmationID = dr["ReConfirmationID"].ToString(),
                        Message = "Success",
                    };
                    Hotelstbl hdtbl = new Hotelstbl()
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"].ToString()),
                        HotelName = dr["HotelName"].ToString(),
                        HotelAddress = dr["HotelAddress"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        Message = "Success",
                    };
                    Supplierstbl sptbl = new Supplierstbl()
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
                    };
                    Agentstbl atbl = new Agentstbl()
                    {
                        AgentID = dr["AgentID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),
                        AgencyName = dr["AgencyName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        CategoryId =Convert.ToInt32(dr["CategoryId"]),
                        Website = dr["Website"].ToString(),
                        Address = dr["Address"].ToString(),
                        //CountryId = dr["CountryId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CountryId"]),
                        //CityId = dr["CityId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CityId"]),
                        //PreferredCurrency = dr["PreferredCurrency"].ToString(),
                        Pincode = dr["Pincode"].ToString(),
                        //AgencyLogo = dr["AgencyLogo"].ToString(),
                        //IATAStatus = dr["IATAStatus"].ToString(),
                        IATARegNo = dr["IATARegNo"].ToString(),
                        ReferredBy = dr["ReferredBy"].ToString(),
                        Commission = dr["Commission"].ToString(),
                        IsActive = dr["IsActive"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",
                    };
                    Roomstbl rtbl = new Roomstbl()
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                        Adults = Convert.ToInt32(dr["Adults"].ToString()),
                        Kids = Convert.ToInt32(dr["Kids"].ToString()),
                        RoomType = dr["RoomType"].ToString(),
                        Price = dr["Price"].ToString(),
                        Message = "Success",
                    };
                    Gueststbl gtbl = new Gueststbl()
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"].ToString()),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"].ToString()),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Salutation = dr["Salutation"].ToString(),
                        Type = dr["Type"].ToString(),
                        Age = Convert.ToInt32(dr["Age"].ToString()),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        Message = "Success",

                    };
                    obj1.Add(new Booking
                    {
                        AllBookingstc = bdtbl,
                        Hotelstc = hdtbl,
                        Supplierstc = sptbl,
                        Agentstc = atbl,
                        Roomstc = rtbl,
                        Gueststc = gtbl,
                        Message = "Success"                       
                        
                    });

                    //AllBookingsSearchtbl albt = new AllBookingsSearchtbl
                    //{
                    //    //Status = dr["Status"].ToString(),
                    //    Agent = dr["Agent"].ToString(),
                    //    SupBookingID = dr["SupBookingID"].ToString(),
                    //    AgentBookingID = dr["AgentBookingID"].ToString(),
                    //    Staff = dr["Staff"].ToString(),
                    //    FromDate = dr["FromDate"].ToString(),
                    //    ToDate = dr["ToDate"].ToString(),
                    //    Message = "Success",
                    //};                

                    //obj1.Add(als);
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj1.Add(new Booking
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return obj1;
        }
    }

    public class Booking
    {
        public Hotelstbl Hotelstc { get; set; }
        public AllBookingstbl AllBookingstc { get; set; }
        public Roomstbl Roomstc { get; set; }
        public Gueststbl Gueststc { get; set; }
        public Supplierstbl Supplierstc { get; set; }
        public Agentstbl Agentstc { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }
    }

    public class AllBookingstbl
    {
        public int BookingDetailsId { get; set; }

        //public string BookingId { get; set; }

        public string SupBookingId { get; set; }

        public string AgentBookingId { get; set; }

        public string AgentPrice { get; set; }

        public int HotelDetailsId { get; set; }

        public string CheckinDate { get; set; }

        public string ChekoutDate { get; set; }

        public int NoofRooms { get; set; }

        public string TotalPrice { get; set; }

        public string Status { get; set; }

        public int AgentID { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public int UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }

        public int SupplierID { get; set; }

        public string ConfirmationID { get; set; }

        public string ReConfirmationID  { get; set; }

        public string BookingDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }
    }

    public class Gueststbl
    {
        public int GuestId { get; set; }

        public int BookingDetailsId { get; set; }

        public int RoomDetailsId { get; set; }        

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Salutation { get; set; }

        public string Type { get; set; }

        public int Age { get; set; }

        public string CreatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }
    }

    public class Hotelstbl
    {
        public int HotelDetailsId { get; set; }

        public int HotelId { get; set; }

        public string HotelName { get; set; }

        public string HotelAddress { get; set; }

        public string HotelLocation { get; set; }

        public string ContactNumber { get; set; }

        public int CreatedBy { get; set; }

        public string CreatedDate { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }
    }

    public class Roomstbl
    {
        public int RoomDetailsId { get; set; }

        public int BookingDetailsId { get; set; }

        public int Adults { get; set; }

        public int Kids { get; set; }

        public string RoomType { get; set; }

        public string Price { get; set; }

        public string Message { get; set; }

        public string ErrorMessage { get; set; }      
    }

    public class AllBookingsSearchtbl : Common
    {
        //public string Status { get; set; }
        public int AgentID { get; set; }
        public int SupplierID { get; set; }
        public string SupBookingID { get; set; }
        public string AgentBookingID { get; set; }
        public string Staff { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string BStatus { get; set; }
    }

}