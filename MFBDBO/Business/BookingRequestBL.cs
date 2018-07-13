using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class BookingRequestBL
    {
        BookingRequestDA objBookReqDA = new BookingRequestDA();        
        List<BookingRequesttbl> Br = new List<BookingRequesttbl>();
        List<BookingReqGuestDetailstbl> BD = new List<BookingReqGuestDetailstbl>();

      
        public IEnumerable<BookingRequesttbl> GetBookRequest()
        {
            return objBookReqDA.BookingRequestGet();
        }
        public IEnumerable<BookingRequesttbl> InsertRequest(BookingRequesttbl Br)
        {
            return objBookReqDA.BookingRequestInsert(3, Br);
        }

      
        public IEnumerable<BookingRequesttbl> GetAllBookingRequest(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(1, br);
        }

        public IEnumerable<BookingRequesttbl> GetBookingRequestbyId(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(2, br);
        }

        public IEnumerable<BookingRequesttbl> InsertBookingRequest(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(3, br);
        }
        public IEnumerable<BookingRequesttbl> UpdateBookingRequest(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequestUpdate(4, br);
        }
        public IEnumerable<BookingRequesttbl> DeleteBookingRequest(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(5, br);
        }
        public IEnumerable<BookingRequesttbl> UpdateBookingRequestIsActive(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(6, br);
        }

        public IEnumerable<BookingRequesttbl> UpdateBookingRequestStatus(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(7, br);
        }

        public IEnumerable<BookingRequesttbl> GetBookingRequestByStatus(BookingRequesttbl br)
        {
            return objBookReqDA.BookingRequest(8, br);
        }















    }
}