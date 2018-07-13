using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class BookingRequestDA 
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        //public IEnumerable<BookingRequesttbl> BookingRequestAll(int type, BookingRequesttbl Br, BookingReqGuestDetailstbl Bd)
        //{
        //    List<BookingRequesttbl> obj = new List<BookingRequesttbl>();
        //    List<BookingReqGuestDetailstbl> objRd = new List<BookingReqGuestDetailstbl>();
        //    try
        //    {
        //        // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
        //        //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, PreferedHotels, IsDeleted, SightSeeing
        //        //Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
        //        //Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        //        MySqlCommand cmd = new MySqlCommand("Sp_BookingRequest", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("type", type);
        //        cmd.Parameters.AddWithValue("pId", Bd.Id);
        //        cmd.Parameters.AddWithValue("pRequestId", Br.RequestId);
        //        cmd.Parameters.AddWithValue("pRoomNo", Bd.RoomNo);
        //        cmd.Parameters.AddWithValue("pSalutation", Bd.Salutation);
        //        cmd.Parameters.AddWithValue("pFirstName", Bd.FirstName);
        //        cmd.Parameters.AddWithValue("pLastName", Bd.LastName);
        //        cmd.Parameters.AddWithValue("pAges", Bd.Age);
        //        cmd.Parameters.AddWithValue("pType", Bd.Type);
        //        cmd.Parameters.AddWithValue("pGstRequestId", Bd.RequestId);
        //        cmd.Parameters.AddWithValue("pAgentId", Br.AgentId);
        //        cmd.Parameters.AddWithValue("pDestination", Br.Destination);
        //        cmd.Parameters.AddWithValue("pCheckin", Br.Checkin);
        //        cmd.Parameters.AddWithValue("pCheckout", Br.Checkout);
        //        cmd.Parameters.AddWithValue("pNationality", Br.Nationality);
        //        cmd.Parameters.AddWithValue("pRating", Br.Rating);
        //        cmd.Parameters.AddWithValue("pCountryId", Br.CountryId);
        //        cmd.Parameters.AddWithValue("pCityId", Br.CityId);
        //        cmd.Parameters.AddWithValue("pStatus", Br.Status);
        //        cmd.Parameters.AddWithValue("pCreatedBy", Br.CreatedBy);
        //        cmd.Parameters.AddWithValue("pCreatedDate", Br.CreatedDate);
        //        cmd.Parameters.AddWithValue("pUpdatedBy", Br.UpdatedBy);
        //        cmd.Parameters.AddWithValue("pUpdatedDate", Br.UpdatedDate);
        //        cmd.Parameters.AddWithValue("pBookingDetailsId", Br.BookingDetailsId);
        //        cmd.Parameters.AddWithValue("pPreferedHotels", Br.PreferedHotels);
        //        cmd.Parameters.AddWithValue("pIsDeleted", Br.IsDeleted);
        //        cmd.Parameters.AddWithValue("pSightSeeing", Br.SightSeeing);

        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        MySqlDataReader dr = cmd.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            obj.Add(new BookingRequesttbl
        //            {
        //                RequestId = Convert.ToInt32(dr["RequestId"]),
        //                AgentId = Convert.ToInt32(dr["AgentId"]),
        //                Destination = dr["Destination"].ToString(),
        //                Checkin = dr["Checkin"].ToString(),
        //                Checkout = dr["Checkout"].ToString(),
        //                Nationality = dr["Nationality"].ToString(),
        //                Rating = dr["Rating"].ToString(),
        //                CountryId = dr["CountryId"].ToString(),
        //                CityId = dr["CityId"].ToString(),
        //                Status = Convert.ToInt32(dr["Status"]),
        //                CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
        //                CreatedDate = dr["CreatedDate"].ToString(),
        //                UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
        //                UpdatedDate = dr["UpdatedDate"].ToString(),
        //                BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
        //                PreferedHotels = dr["PreferedHotels"].ToString(),
        //                IsDeleted = Convert.ToInt32(dr["IsDeleted"]),
        //                SightSeeing = dr["SightSeeing"].ToString(),
        //                Message = "Success",

        //            });

        //            objRd.Add(new BookingReqGuestDetailstbl
        //            {
        //                Id = Convert.ToInt32(dr["Id"]),
        //                RequestId = Convert.ToInt32(dr["RequestId"]),
        //                RoomNo = Convert.ToInt32(dr["RoomNo"]),
        //                Salutation = dr["Salutation"].ToString(),
        //                FirstName = dr["FirstName "].ToString(),
        //                LastName = dr["LastName"].ToString(),
        //                Age = dr["Age"].ToString(),
        //                Type = dr["Type"].ToString(),
        //                Status = Convert.ToInt32(dr["Status"]),
        //                CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
        //                CreatedDate = dr["CreatedDate"].ToString(),
        //                UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
        //                UpdatedDate = dr["UpdatedDate"].ToString(),
        //                Message = "Success",

        //            });
        //        }
        //        dr.Close();
        //    }

        //    finally
        //    {
        //        con.Close();
        //    }
        //    return obj;
        //}
        //public IEnumerable<BookingReqGuestDetailstbl> BookingReqGuestGet()
        //{
        //    List<BookingReqGuestDetailstbl> obj = new List<BookingReqGuestDetailstbl>();

        //    try
        //    {
        //        // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
        //        //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, PreferedHotels, IsDeleted, SightSeeing
        //        //Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
        //        //Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        //        MySqlCommand cmd = new MySqlCommand("Sp_BR_BookReqGuestGet", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        MySqlDataReader dr = cmd.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            obj.Add(new BookingReqGuestDetailstbl
        //            {
        //                Id = Convert.ToInt32(dr["Id"]),
        //                RequestId = Convert.ToInt32(dr["RequestId"]),
        //                RoomNo = Convert.ToInt32(dr["RoomNo"]),
        //                Salutation = dr["Salutation"].ToString(),
        //                FirstName = dr["FirstName "].ToString(),
        //                LastName = dr["LastName"].ToString(),
        //                Age = dr["Age"].ToString(),
        //                Type = dr["Type"].ToString(),
        //                Status = Convert.ToInt32(dr["Status"]),
        //                Message = "Success",
        //            });
        //        }
        //        dr.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        obj.Add(new BookingReqGuestDetailstbl
        //        {
        //            Message = "Error",
        //            ErrorMessage = ex.Message,
        //        });
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return obj;
        //}
        public IEnumerable<BookingRequesttbl> BookingRequestGet()
        {
            List<BookingRequesttbl> obj1 = new List<BookingRequesttbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_BR_BookReqGet", con);





                cmd.CommandType = CommandType.StoredProcedure;
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj1.Add(new BookingRequesttbl
                    {
                        RequestId = dr["RequestId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RequestId"]),
                        AgentId = dr["AgentId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentId"]),
                        Destination = dr["Destination"].ToString(),
                        Checkin = dr["Checkin"].ToString(),
                        Checkout = dr["Checkout"].ToString(),
                        Nationality = dr["Nationality"].ToString(),
                        Rating = dr["Rating"].ToString(),
                        CountryId = dr["CountryId"].ToString(),
                        CityId = dr["CityId"].ToString(),
                        Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        BookingDetailsId = dr["BookingDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BookingDetailsId"]),
                        PreferedHotels = dr["PreferedHotels"].ToString(),
                        IsDeleted = dr["IsDeleted"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsDeleted"]),
                        SightSeeing = dr["SightSeeing"].ToString(),
                    });
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                obj1.Add(new BookingRequesttbl
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
        //public IEnumerable<BookingRequesttbl> BookingDetails(BookingRequesttbl Br)
        //{
        //    List<BookingRequesttbl> obj2 = new List<BookingRequesttbl>();
        //    try
        //    {
        //        MySqlCommand cmd = new MySqlCommand("Sp_BR_BookingDetails", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("pRequestId", Br.RequestId);
        //        cmd.Parameters.AddWithValue("pDestination", Br.Destination);
        //        cmd.Parameters.AddWithValue("pNationality", Br.Nationality);
        //        cmd.Parameters.AddWithValue("pPreferedHotels", Br.PreferedHotels);
        //        cmd.Parameters.AddWithValue("pCheckin", Br.Checkin);
        //        cmd.Parameters.AddWithValue("pCheckout", Br.Checkout);


        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        MySqlDataReader dr = cmd.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            obj2.Add(new BookingRequesttbl
        //            {
        //                RequestId = Convert.ToInt32(dr["RequestId"]),
        //                AgentId = dr["AgentId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentId"]),
        //                Destination = dr["Destination"].ToString(),
        //                Checkin = dr["Checkin"].ToString(),
        //                Checkout = dr["Checkout"].ToString(),
        //                Nationality = dr["Nationality"].ToString(),
        //                Rating = dr["Rating"].ToString(),
        //                CountryId = dr["CountryId"].ToString(),
        //                CityId = dr["CityId"].ToString(),
        //                Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
        //                CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
        //                CreatedDate = dr["CreatedDate"].ToString(),
        //                UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
        //                UpdatedDate = dr["UpdatedDate"].ToString(),
        //                BookingDetailsId = dr["BookingDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BookingDetailsId"]),
        //                PreferedHotels = dr["PreferedHotels"].ToString(),
        //                IsDeleted = dr["IsDeleted"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsDeleted"]),
        //                SightSeeing = dr["SightSeeing"].ToString(),
        //            });
        //        }
        //        dr.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        obj2.Add(new BookingRequesttbl
        //        {
        //            Message = "Error",
        //            ErrorMessage = ex.Message,
        //        });
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return obj2;
        //}
        //public IEnumerable<BookingRequesttbl> BookingRequestUpdate(BookingRequesttbl Br)
        //{
        //    List<BookingRequesttbl> obj3 = new List<BookingRequesttbl>();
        //    try
        //    {
        //        MySqlCommand cmd = new MySqlCommand("Sp_BR_BookingRequestUpdate", con);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        cmd.Parameters.AddWithValue("pRequestId", Br.RequestId);
        //        cmd.Parameters.AddWithValue("pAgentId", Br.AgentId);
        //        cmd.Parameters.AddWithValue("pDestination", Br.Destination);
        //        cmd.Parameters.AddWithValue("pCheckin", Br.Checkin);
        //        cmd.Parameters.AddWithValue("pCheckout", Br.Checkout);
        //        cmd.Parameters.AddWithValue("pNationality", Br.Nationality);
        //        cmd.Parameters.AddWithValue("pPreferedHotels", Br.PreferedHotels);
        //        cmd.Parameters.AddWithValue("pSightSeeing", Br.SightSeeing);

        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        MySqlDataReader dr = cmd.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            obj3.Add(new BookingRequesttbl
        //            {
        //                // RequestId = Convert.ToInt32(dr["RequestId"]),
        //                AgentId = dr["AgentId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentId"]),
        //                Destination = dr["Destination"].ToString(),
        //                Checkin = dr["Checkin"].ToString(),
        //                Checkout = dr["Checkout"].ToString(),
        //                Nationality = dr["Nationality"].ToString(),
        //                //Rating = dr["Rating"].ToString(),
        //                // CountryId = dr["CountryId"].ToString(),
        //                // CityId = dr["CityId"].ToString(),
        //                //  Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
        //                //  CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
        //                //  CreatedDate = dr["CreatedDate"].ToString(),
        //                ////  UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
        //                //  UpdatedDate = dr["UpdatedDate"].ToString(),
        //                // BookingDetailsId = dr["BookingDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BookingDetailsId"]),
        //                PreferedHotels = dr["PreferedHotels"].ToString(),
        //                //IsDeleted = dr["IsDeleted"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsDeleted"]),
        //                SightSeeing = dr["SightSeeing"].ToString(),
        //            });
        //        }
        //        dr.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        obj3.Add(new BookingRequesttbl
        //        {
        //            Message = "Error",
        //            ErrorMessage = ex.Message,
        //        });
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return obj3;
        //}        
        public IEnumerable<BookingRequesttbl> BookingRequestInsert(int type, BookingRequesttbl brd)
        {
            List<BookingRequesttbl> objBrd = new List<BookingRequesttbl>();
            
            try
            {
                // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
                //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, 
                // PreferedHotels, IsDeleted, SightSeeing
                // Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
                // Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
                        
                MySqlCommand cmd = new MySqlCommand("Sp_BR_RequestAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);                
                cmd.Parameters.AddWithValue("pRequestId", brd.RequestId);
                cmd.Parameters.AddWithValue("pAgentId", brd.AgentId);
                cmd.Parameters.AddWithValue("pDestination", brd.Destination);
                cmd.Parameters.AddWithValue("pCheckin", brd.Checkin);
                cmd.Parameters.AddWithValue("pCheckout", brd.Checkout);
                cmd.Parameters.AddWithValue("pNationality", brd.Nationality);
                cmd.Parameters.AddWithValue("pRating", brd.Rating);
                cmd.Parameters.AddWithValue("pCountryId", brd.CountryId);
                cmd.Parameters.AddWithValue("pCityId", brd.CityId);
                cmd.Parameters.AddWithValue("pBookingDetailsId", brd.BookingDetailsId);
                cmd.Parameters.AddWithValue("pPreferedHotels", brd.PreferedHotels);
                cmd.Parameters.AddWithValue("pIsDeleted", brd.IsDeleted);
                cmd.Parameters.AddWithValue("pSightSeeing", brd.SightSeeing);
                cmd.Parameters.AddWithValue("pStatus", brd.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", brd.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", brd.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", brd.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", brd.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                var res = cmd.ExecuteNonQuery();
                
                //cmd.CommandText = "Sp_BR_RequestAll";
                //cmd.Connection = con;
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.RemoveAt(0);
                //cmd.Parameters.AddWithValue("type", 8);

                cmd.Parameters.Clear();
                cmd.CommandText = "Select max(RequestId) as RequestId from tblBookingRequest";
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;               
                

                MySqlDataReader dr = cmd.ExecuteReader();
                int max = 0;
                while(dr.Read())
                {
                    max = dr["RequestId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RequestId"]);
                }
                dr.Close();
                

                int Req = Convert.ToInt32(max);
                
                {                  
                    
                    foreach(var gst in brd.GuestDetails)
                    {
                        cmd.Parameters.Clear();
                        cmd.Connection = con;
                        cmd.CommandText = "Sp_BR_GuestAll";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("type", type);
                        cmd.Parameters.AddWithValue("pRequestId", Req);
                        cmd.Parameters.AddWithValue("pGuestId", gst.GuestId);
                        cmd.Parameters.AddWithValue("pRoomNo", gst.RoomNo);
                        cmd.Parameters.AddWithValue("pSalutation", gst.Salutation);
                        cmd.Parameters.AddWithValue("pFirstName", gst.FirstName);
                        cmd.Parameters.AddWithValue("pLastName", gst.LastName);
                        cmd.Parameters.AddWithValue("pAges", gst.Age);
                        cmd.Parameters.AddWithValue("pType", gst.Type);                        
                        cmd.Parameters.AddWithValue("pStatus", gst.Status);
                        cmd.Parameters.AddWithValue("pCreatedBy", gst.CreatedBy);
                        cmd.Parameters.AddWithValue("pCreatedDate", gst.CreatedDate);
                        cmd.Parameters.AddWithValue("pUpdatedBy", gst.UpdatedBy);
                        cmd.Parameters.AddWithValue("pUpdatedDate", gst.UpdatedDate);
                        cmd.ExecuteNonQuery();
                    }
                }         

                
                //MySqlDataReader dr = cmd.ExecuteReader();
                //while (dr.Read())
                //{
                    //objBrd.Add(new BookingRequesttbl
                    //{
                    //    RequestId = Convert.ToInt32(dr["RequestId"]),
                    //    AgentId = Convert.ToInt32(dr["AgentId"]),
                    //    Destination = dr["Destination"].ToString(),
                    //    Checkin = dr["Checkin"].ToString(),
                    //    Checkout = dr["Checkout"].ToString(),
                    //    Nationality = dr["Nationality"].ToString(),
                    //    Rating = dr["Rating"].ToString(),
                    //    CountryId = dr["CountryId"].ToString(),
                    //    CityId = dr["CityId"].ToString(),
                    //    Status = Convert.ToInt32(dr["Status"]),
                    //    CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                    //    CreatedDate = dr["CreatedDate"].ToString(),
                    //    UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                    //    UpdatedDate = dr["UpdatedDate"].ToString(),
                    //    BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                    //    PreferedHotels = dr["PreferedHotels"].ToString(),
                    //    IsDeleted = Convert.ToInt32(dr["IsDeleted"]),
                    //    SightSeeing = dr["SightSeeing"].ToString(),
                    //    Message = "Success",

                    //});

                    //objRd.Add(new BookingReqGuestDetailstbl
                    //{
                    //    Id = Convert.ToInt32(dr["Id"]),
                    //    RequestId = Convert.ToInt32(dr["RequestId"]),
                    //    RoomNo = Convert.ToInt32(dr["RoomNo"]),
                    //    Salutation = dr["Salutation"].ToString(),
                    //    FirstName = dr["FirstName "].ToString(),
                    //    LastName = dr["LastName"].ToString(),
                    //    Age = dr["Age"].ToString(),
                    //    Type = dr["Type"].ToString(),
                    //    Status = Convert.ToInt32(dr["Status"]),
                    //    CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                    //    CreatedDate = dr["CreatedDate"].ToString(),
                    //    UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                    //    UpdatedDate = dr["UpdatedDate"].ToString(),
                    //    Message = "Success",

                    //});
                //}
                //dr.Close();
            }
            finally
            {
                con.Close();
            }
            return objBrd;
        }
        public IEnumerable<BookingRequesttbl> BookingRequestGet(int type, BookingRequesttbl brd)
        {
            List<BookingRequesttbl> objBrd = new List<BookingRequesttbl>();

            try
            {
                // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
                //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, 
                // PreferedHotels, IsDeleted, SightSeeing
                // Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
                // Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate

                MySqlCommand cmd = new MySqlCommand("Sp_BR_RequestAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {                    
                    BookingReqGuestDetailstbl bgd = new BookingReqGuestDetailstbl()
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        RequestId = Convert.ToInt32(dr["RequestId"]),
                        RoomNo=Convert.ToInt32(dr["RoomNo"]),
                        Salutation = dr["Salutation"].ToString(),
                        FirstName=dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Type = dr["Type"].ToString(),
                        Age = dr["Age"].ToString(),                       
                    };

                    objBrd.Add(new BookingRequesttbl
                    {
                        RequestId = Convert.ToInt32(dr["RequestId"]),
                        AgentId = Convert.ToInt32(dr["AgentId"]),
                        Destination = dr["Destination"].ToString(),
                        Checkin = dr["Checkin"].ToString(),
                        Checkout = dr["Checkout"].ToString(),
                        Nationality = dr["Nationality"].ToString(),
                        Rating = dr["Rating"].ToString(),
                        CountryId = dr["CountryId"].ToString(),
                        CityId = dr["CityId"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        PreferedHotels = dr["PreferedHotels"].ToString(),
                        IsDeleted = Convert.ToInt32(dr["IsDeleted"]),
                        SightSeeing = dr["SightSeeing"].ToString(),
                        Message = "Success",
                    });

                    
                }
                dr.Close();
            }
            finally
            {
                con.Close();
            }
            return objBrd;
        }

        public IEnumerable<BookingRequesttbl> BookingRequest(int type, BookingRequesttbl br)
        {
            List<BookingRequesttbl> objBrd = new List<BookingRequesttbl>();

            try
            {
                // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
                //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, 
                // PreferedHotels, IsDeleted, SightSeeing
                // Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
                // Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString))
                {

                    using (MySqlCommand cmd = new MySqlCommand("Sp_BookingRequestNew", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("type", type);
                        cmd.Parameters.AddWithValue("pRequestId", br.RequestId);
                        cmd.Parameters.AddWithValue("pAgentId", br.AgentId);
                        cmd.Parameters.AddWithValue("pDestination", br.Destination);
                        cmd.Parameters.AddWithValue("pCheckin", br.Checkin);
                        cmd.Parameters.AddWithValue("pCheckout", br.Checkout);
                        cmd.Parameters.AddWithValue("pNationality", br.Nationality);
                        cmd.Parameters.AddWithValue("pMobileNumber", br.MobileNumber);
                        cmd.Parameters.AddWithValue("pEmailID", br.EmailID);
                        cmd.Parameters.AddWithValue("pRating", br.Rating);
                        cmd.Parameters.AddWithValue("pCountryId", br.CountryId);
                        cmd.Parameters.AddWithValue("pCityId", br.CityId);
                        cmd.Parameters.AddWithValue("pBookingDetailsId", br.BookingDetailsId);
                        cmd.Parameters.AddWithValue("pPreferedHotels", br.PreferedHotels);
                        cmd.Parameters.AddWithValue("pIsDeleted", br.IsDeleted);
                        cmd.Parameters.AddWithValue("pSightSeeing", br.SightSeeing);
                        cmd.Parameters.AddWithValue("pStatus", br.Status);
                        cmd.Parameters.AddWithValue("pCreatedBy", br.CreatedBy);
                        cmd.Parameters.AddWithValue("pCreatedDate", br.CreatedDate);
                        cmd.Parameters.AddWithValue("pUpdatedBy", br.UpdatedBy);
                        cmd.Parameters.AddWithValue("pUpdatedDate", br.UpdatedDate);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        using (MySqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {

                                objBrd.Add(new BookingRequesttbl
                                {
                                    RequestId = dr["RequestId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RequestId"]),
                                    AgentId = dr["AgentId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentId"]),
                                    Destination = dr["Destination"].ToString(),
                                    Checkin = dr["Checkin"].ToString(),
                                    Checkout = dr["Checkout"].ToString(),
                                    Nationality = dr["Nationality"].ToString(),
                                    MobileNumber = dr["MobileNumber"] == DBNull.Value ? 0 : Convert.ToInt32(dr["MobileNumber"]),
                                    EmailID = dr["EmailID"].ToString(),
                                    Rating = dr["Rating"].ToString(),
                                    CountryId = dr["CountryId"].ToString(),
                                    CityId = dr["CityId"].ToString(),
                                    Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
                                    CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                                    CreatedDate = dr["CreatedDate"].ToString(),
                                    UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                                    UpdatedDate = dr["UpdatedDate"].ToString(),
                                    BookingDetailsId = dr["BookingDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BookingDetailsId"]),
                                    PreferedHotels = dr["PreferedHotels"].ToString(),
                                    IsDeleted = dr["IsDeleted"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsDeleted"]),
                                    SightSeeing = dr["SightSeeing"].ToString(),
                                    Message = "Success",
                                    GuestDetails = (List<BookingReqGuestDetailstbl>)BookingRequestGuestDetails(8, new BookingReqGuestDetailstbl() { RequestId = br.RequestId }),

                                });
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
             {
                objBrd.Add(new BookingRequesttbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objBrd;
        }

        public IEnumerable<BookingRequesttbl> BookingRequestUpdate(int type, BookingRequesttbl br)
        {
            List<BookingRequesttbl> objBrd = new List<BookingRequesttbl>();

            try
            {
                // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
                //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, 
                // PreferedHotels, IsDeleted, SightSeeing
                // Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
                // Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
                using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString))
                {

                    using (MySqlCommand cmd = new MySqlCommand("Sp_BookingRequestNew", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("type", type);
                        cmd.Parameters.AddWithValue("pRequestId", br.RequestId);
                        cmd.Parameters.AddWithValue("pAgentId", br.AgentId);
                        cmd.Parameters.AddWithValue("pDestination", br.Destination);
                        cmd.Parameters.AddWithValue("pCheckin", br.Checkin);
                        cmd.Parameters.AddWithValue("pCheckout", br.Checkout);
                        cmd.Parameters.AddWithValue("pNationality", br.Nationality);
                        cmd.Parameters.AddWithValue("pMobileNumber", br.MobileNumber);
                        cmd.Parameters.AddWithValue("pEmailID", br.EmailID);
                        cmd.Parameters.AddWithValue("pRating", br.Rating);
                        cmd.Parameters.AddWithValue("pCountryId", br.CountryId);
                        cmd.Parameters.AddWithValue("pCityId", br.CityId);
                        cmd.Parameters.AddWithValue("pBookingDetailsId", br.BookingDetailsId);
                        cmd.Parameters.AddWithValue("pPreferedHotels", br.PreferedHotels);
                        cmd.Parameters.AddWithValue("pIsDeleted", br.IsDeleted);
                        cmd.Parameters.AddWithValue("pSightSeeing", br.SightSeeing);
                        cmd.Parameters.AddWithValue("pStatus", br.Status);
                        cmd.Parameters.AddWithValue("pCreatedBy", br.CreatedBy);
                        cmd.Parameters.AddWithValue("pCreatedDate", br.CreatedDate);
                        cmd.Parameters.AddWithValue("pUpdatedBy", br.UpdatedBy);
                        cmd.Parameters.AddWithValue("pUpdatedDate", br.UpdatedDate);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        using (MySqlDataReader dr = cmd.ExecuteReader())
                        {
                            for (int i = 0; i < br.GuestDetails.Count; i++)
                            {
                                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                                brg = br.GuestDetails[i];
                                List<BookingReqGuestDetailstbl> lstbrgd = new List<BookingReqGuestDetailstbl>();

                                lstbrgd = BookingRequestGuestDetails(4, brg).ToList();
                            }
                            while (dr.Read())
                            {

                                objBrd.Add(new BookingRequesttbl
                                {
                                    RequestId = dr["RequestId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RequestId"]),
                                    AgentId = dr["AgentId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["AgentId"]),
                                    Destination = dr["Destination"].ToString(),
                                    Checkin = dr["Checkin"].ToString(),
                                    Checkout = dr["Checkout"].ToString(),
                                    Nationality = dr["Nationality"].ToString(),
                                    MobileNumber = dr["MobileNumber"] == DBNull.Value ? 0 : Convert.ToInt32(dr["MobileNumber"]),
                                    EmailID = dr["EmailID"].ToString(),
                                    Rating = dr["Rating"].ToString(),
                                    CountryId = dr["CountryId"].ToString(),
                                    CityId = dr["CityId"].ToString(),
                                    Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
                                    CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                                    CreatedDate = dr["CreatedDate"].ToString(),
                                    UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                                    UpdatedDate = dr["UpdatedDate"].ToString(),
                                    BookingDetailsId = dr["BookingDetailsId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["BookingDetailsId"]),
                                    PreferedHotels = dr["PreferedHotels"].ToString(),
                                    IsDeleted = dr["IsDeleted"] == DBNull.Value ? 0 : Convert.ToInt32(dr["IsDeleted"]),
                                    SightSeeing = dr["SightSeeing"].ToString(),
                                    Message = "Success",
                                    GuestDetails = (List<BookingReqGuestDetailstbl>)BookingRequestGuestDetails(4, new BookingReqGuestDetailstbl() { RequestId = br.RequestId }),

                                });
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                objBrd.Add(new BookingRequesttbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objBrd;
        }


        public IEnumerable<BookingReqGuestDetailstbl> BookingRequestGuestDetails(int type, BookingReqGuestDetailstbl brg)
        {
            List<BookingReqGuestDetailstbl> objBrd = new List<BookingReqGuestDetailstbl>();

            try
            {                           

                MySqlCommand cmd = new MySqlCommand("Sp_BR_GuestAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pGuestId", brg.GuestId);
                cmd.Parameters.AddWithValue("pRequestId", brg.RequestId);
                cmd.Parameters.AddWithValue("pRoomNo", brg.RoomNo);
                cmd.Parameters.AddWithValue("pSalutation", brg.Salutation);
                cmd.Parameters.AddWithValue("pFirstName", brg.FirstName);
                cmd.Parameters.AddWithValue("pLastName", brg.LastName);
                cmd.Parameters.AddWithValue("pAges", brg.Age);
                cmd.Parameters.AddWithValue("pType", brg.Type);
                cmd.Parameters.AddWithValue("pStatus", brg.Status);
                cmd.Parameters.AddWithValue("pCreatedBy", brg.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", brg.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", brg.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", brg.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objBrd.Add(new BookingReqGuestDetailstbl
                    {
                        
                        RequestId = dr["RequestId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RequestId"]),
                        GuestId = dr["GuestId"] == DBNull.Value ? 0 : Convert.ToInt32(dr["GuestId"]),
                        RoomNo = dr["RoomNo"] == DBNull.Value ? 0 : Convert.ToInt32(dr["RoomNo"]),
                        Salutation = dr["Salutation"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Age = dr["Age"].ToString(),
                        Type = dr["Type"].ToString(),                       
                        Status = dr["Status"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Status"]),
                        CreatedBy = dr["CreatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = dr["UpdatedBy"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UpdatedBy"]),                        
                        Message = "Success",

                    });

                }
                dr.Close();

            }
            catch (Exception ex)
            {
                objBrd.Add(new BookingReqGuestDetailstbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return objBrd;
        }

    }          
    public class BookingRequesttbl : Common
    {
        // RequestId, AgentId, Destination, Checkin, Checkout, Nationality, Rating, CountryId, CityId,
        //  Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, BookingDetailsId, PreferedHotels, IsDeleted, SightSeeing
        public int RequestId { get; set; }
        public int AgentId { get; set; }
        public string Destination { get; set; }
        public string Checkin { get; set; }
        public string Checkout { get; set; }
        public string Nationality { get; set; }
        public int MobileNumber { get; set; }
        public string EmailID { get; set; }
        public string Rating { get; set; }
        public string CountryId { get; set; }
        public string CityId { get; set; }        
        public int BookingDetailsId { get; set; }
        public string PreferedHotels { get; set; }
        public int IsDeleted { get; set; }
        public string SightSeeing { get; set; }
        public List<BookingReqGuestDetailstbl> GuestDetails { get; set; }
        
    }
    public class BookingReqGuestDetailstbl : Common
    {
        //Id, RequestId, RoomNo, Salutation, FirstName, LastName, Age, 
        //Type, Status, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
        public int GuestId { get; set; }
        public int RequestId { get; set; }
        public int RoomNo { get; set; }
        public string Salutation { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Age { get; set; }
        public string Type { get; set; }        

    }    
}