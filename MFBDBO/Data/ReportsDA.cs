using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class ReportsDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        public IEnumerable<BookingGuestRpt> RequestReportAll(int type, BookingGuestRpt bg)
        {
            List<BookingGuestRpt> obj = new List<BookingGuestRpt>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_rpt_BookingBySupplier", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pFromDate", bg.FromDate);
                cmd.Parameters.AddWithValue("pToDate", bg.ToDate);
                cmd.Parameters.AddWithValue("pSupplierId", bg.SupId);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    HotelDetailstbl hd = new HotelDetailstbl()
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"]),
                        HotelName = dr["HotelName"].ToString(),
                        Address = dr["Address"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                    };
                    BookingDetailstbl bd = new BookingDetailstbl()
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        Checkin = dr["Checkin"].ToString(),
                        Checkout = dr["Checkout"].ToString(),
                        NoofRooms = Convert.ToInt32(dr["NoofRooms"]),
                        AgentPrice = dr["AgentPrice"].ToString(),
                        AgentID = Convert.ToInt32(dr["AgentId"]),
                    };
                    List<RoomDetailstbl> lstrd = new List<RoomDetailstbl>();
                    List<GuestDetailstbl> lstgd = new List<GuestDetailstbl>();
                    Supplierstbl s = new Supplierstbl()
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
                    };

                    lstrd.Add(new RoomDetailstbl
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        Adults = Convert.ToInt32(dr["Adults"]),
                        Kids = Convert.ToInt32(dr["Kids"]),
                        RoomType = dr["RoomType"].ToString(),
                        Price = dr["Price"].ToString(),
                    });
                    lstgd.Add(new GuestDetailstbl
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Salutation=dr["Salutation"].ToString(),
                        Type=dr["Type"].ToString(),
                        Status=Convert.ToInt32(dr["Status"]),

                        Age = Convert.ToInt32(dr["Age"]),
                    });

                    obj.Add(new BookingGuestRpt
                    {
                        HotelDetailscls = hd,
                        BookingDetailscls = bd,
                        RoomDetailscls = lstrd,
                        Supplierscls = s

                    });
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new BookingGuestRpt
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
        public IEnumerable<BookingGuestRpt> RequestReportAllAgents(int type, BookingGuestRpt bg)
        {
            List<BookingGuestRpt> obj = new List<BookingGuestRpt>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_rpt_BookingByAgents", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pFromDate", bg.FromDate);
                cmd.Parameters.AddWithValue("pToDate", bg.ToDate);
                cmd.Parameters.AddWithValue("pAgentId", bg.AgentId);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    HotelDetailstbl hd = new HotelDetailstbl()
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"]),
                        HotelName = dr["HotelName"].ToString(),
                        Address = dr["Address"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                    };
                    BookingDetailstbl bd = new BookingDetailstbl()
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        Checkin = dr["Checkin"].ToString(),
                        Checkout = dr["Checkout"].ToString(),
                        NoofRooms = Convert.ToInt32(dr["NoofRooms"]),
                        AgentPrice = dr["AgentPrice"].ToString(),
                        AgentID = Convert.ToInt32(dr["AgentId"]),
                    };
                    List<RoomDetailstbl> lstrd = new List<RoomDetailstbl>();
                    List<GuestDetailstbl> lstgd = new List<GuestDetailstbl>();
                    Agentstbl a = new Agentstbl()
                    {
                        AgentID = Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),
                        AgencyName = dr["AgencyName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        UserName = dr["UserName"].ToString(),
                        Password = dr["Password"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        CategoryId = Convert.ToInt32(dr["CategoryId"]),
                        Address = dr["Address"].ToString(),
                    };
                    lstrd.Add(new RoomDetailstbl
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        Adults = Convert.ToInt32(dr["Adults"]),
                        Kids = Convert.ToInt32(dr["Kids"]),
                        RoomType = dr["RoomType"].ToString(),
                        Price = dr["Price"].ToString(),
                    });
                    lstgd.Add(new GuestDetailstbl
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Salutation = dr["Salutation"].ToString(),
                        Type = dr["Type"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        Age = Convert.ToInt32(dr["Age"]),
                    });
                    obj.Add(new BookingGuestRpt
                    {
                        HotelDetailscls = hd,
                        BookingDetailscls = bd,
                        RoomDetailscls = lstrd,
                        Agentscls = a
                    });
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new BookingGuestRpt
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

        public IEnumerable<BookingGuestRpt> BookingReportAll(int type, BookingGuestRpt bg)
        {
            List<BookingGuestRpt> obj = new List<BookingGuestRpt>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_rpt_BookingBySupAgt", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pFromDate", bg.FromDate);
                cmd.Parameters.AddWithValue("pToDate", bg.ToDate);
                cmd.Parameters.AddWithValue("pSupplierID", bg.SupId);
                cmd.Parameters.AddWithValue("pAgentId", bg.AgentId);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    HotelDetailstbl hd = new HotelDetailstbl()
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"]),
                        HotelName = dr["HotelName"].ToString(),
                        Address = dr["Address"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                    };
                    BookingDetailstbl bd = new BookingDetailstbl()
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        Checkin = dr["Checkin"].ToString(),
                        Checkout = dr["Checkout"].ToString(),
                        NoofRooms = Convert.ToInt32(dr["NoofRooms"]),
                        AgentPrice = dr["AgentPrice"].ToString(),
                        AgentID = Convert.ToInt32(dr["AgentId"]),
                    };
                    List<RoomDetailstbl> lstrd = new List<RoomDetailstbl>();
                    List<GuestDetailstbl> lstgd = new List<GuestDetailstbl>();
                    Supplierstbl s = new Supplierstbl()
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
                    };
                    Agentstbl a = new Agentstbl()
                    {
                        AgentID = Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),
                        AgencyName = dr["AgentName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        UserName = dr["UserName"].ToString(),
                        Password = dr["Password"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        CategoryId = Convert.ToInt32(dr["CategoryId"]),
                        Address = dr["Address"].ToString(),
                    };
                    lstrd.Add(new RoomDetailstbl
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        Adults = Convert.ToInt32(dr["Adults"]),
                        Kids = Convert.ToInt32(dr["Kids"]),
                        RoomType = dr["RoomType"].ToString(),
                        Price = dr["Price"].ToString(),
                    });
                    lstgd.Add(new GuestDetailstbl
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Salutation = dr["Salutation"].ToString(),
                        Type = dr["Type"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        Age = Convert.ToInt32(dr["Age"]),
                    });

                    obj.Add(new BookingGuestRpt
                    {
                        HotelDetailscls = hd,
                        BookingDetailscls = bd,
                        RoomDetailscls = lstrd,
                        Supplierscls= s,
                        Agentscls = a

                    });
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new BookingGuestRpt
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

        public IEnumerable<BookingGuestRpt> CheckinReportAll(int type, BookingGuestRpt bg)
        {
            List<BookingGuestRpt> obj = new List<BookingGuestRpt>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("sp_rpt_BookingByCheckinReport", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pCheckinDate", bg.FromDate);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    HotelDetailstbl hd = new HotelDetailstbl()
                    {
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        //HotelId = Convert.ToInt32(dr["HotelId"]),
                        HotelName = dr["HotelName"].ToString(),
                        Address = dr["Address"].ToString(),
                        //HotelLocation = dr["HotelLocation"].ToString(),
                        ContactNumber = dr["ContactNumber"].ToString(),
                    };
                    BookingDetailstbl bd = new BookingDetailstbl()
                    {
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        //BookingId = dr["BookingId"].ToString(),
                        HotelDetailsId = Convert.ToInt32(dr["HotelDetailsId"]),
                        Checkin = dr["Checkin"].ToString(),
                        Checkout = dr["Checkout"].ToString(),
                        NoofRooms = Convert.ToInt32(dr["NoofRooms"]),
                        AgentPrice = dr["AgentPrice"].ToString(),
                        AgentID = Convert.ToInt32(dr["AgentId"]),
                    };
                    List<RoomDetailstbl> lstrd = new List<RoomDetailstbl>();
                    List<GuestDetailstbl> lstgd = new List<GuestDetailstbl>();
                    Supplierstbl s = new Supplierstbl()
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
                    };
                    Agentstbl a = new Agentstbl()
                    {
                        AgentID = Convert.ToInt32(dr["AgentID"]),
                        AgencyCode = dr["AgencyCode"].ToString(),
                        AgencyName = dr["AgentName"].ToString(),
                        AgencyEmail = dr["AgencyEmail"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        UserName = dr["UserName"].ToString(),
                        Password = dr["Password"].ToString(),
                        ContactName = dr["ContactName"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        CategoryId = Convert.ToInt32(dr["CategoryId"]),
                        Address = dr["Address"].ToString(),
                    };
                    lstrd.Add(new RoomDetailstbl
                    {
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        Adults = Convert.ToInt32(dr["Adults"]),
                        Kids = Convert.ToInt32(dr["Kids"]),
                        RoomType = dr["RoomType"].ToString(),
                        Price = dr["Price"].ToString(),
                    });
                    lstgd.Add(new GuestDetailstbl
                    {
                        GuestId = Convert.ToInt32(dr["GuestId"]),
                        BookingDetailsId = Convert.ToInt32(dr["BookingDetailsId"]),
                        RoomDetailsId = Convert.ToInt32(dr["RoomDetailsId"]),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Salutation = dr["Salutation"].ToString(),
                        Type = dr["Type"].ToString(),
                        Status = Convert.ToInt32(dr["Status"]),
                        Age = Convert.ToInt32(dr["Age"]),
                    });

                    obj.Add(new BookingGuestRpt
                    {
                        HotelDetailscls = hd,
                        BookingDetailscls = bd,
                        RoomDetailscls = lstrd,
                        GuestDetailscls = lstgd,
                        Supplierscls = s,
                        Agentscls = a

                    });
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new BookingGuestRpt
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
    public class BookingGuestRpt : Common
    {
        public HotelDetailstbl HotelDetailscls { get; set; }
        public BookingDetailstbl BookingDetailscls { get; set; }
        public List<GuestDetailstbl> GuestDetailscls { get; set; }
        public List<RoomDetailstbl> RoomDetailscls { get; set; }
        public Supplierstbl Supplierscls { get; set; }
        public Agentstbl Agentscls { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public int AgentId { get; set; }
        public int SupId { get; set; }
    }

}
