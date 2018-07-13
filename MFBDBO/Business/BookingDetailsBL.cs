using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class BookingDetailsBL
    {
        BookingDetailsDA objBookingDA = new BookingDetailsDA();
        List<BookingDetailstbl> bd = new List<BookingDetailstbl>();
        public IEnumerable<BookingDetailstbl> GetAllBooking(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(1, bd);
        }

        public IEnumerable<BookingDetailstbl> GetBookingbyId(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(2, bd);
        }

        public IEnumerable<BookingDetailstbl> InsertBooking(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(3, bd);
        }
        public IEnumerable<BookingDetailstbl> UpdateHotel(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(4, bd);
        }
        public IEnumerable<BookingDetailstbl> DeleteBooking(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(5, bd);
        }
        public IEnumerable<BookingDetailstbl> UpdateBookingIsActive(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(6, bd);
        }

        public IEnumerable<BookingDetailstbl> UpdateBookingStatus(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(7, bd);
        }

        public IEnumerable<BookingDetailstbl> GetBookingByStatus(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(8, bd);
        }
        public IEnumerable<BookingDetailstbl> GetMaxBooking(BookingDetailstbl bd)
        {
            return objBookingDA.BookingDetails(9, bd);
        }




    }
}