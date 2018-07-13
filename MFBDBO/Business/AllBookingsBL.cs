using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class AllBookingsBL
    {
        AllBookingsDA objAllBookingsDA = new AllBookingsDA();
        List<AllBookingstbl> ls = new List<AllBookingstbl>();
        List<Gueststbl> gs = new List<Gueststbl>();
        List<Hotelstbl> hs = new List<Hotelstbl>();
        List<Roomstbl> rs = new List<Roomstbl>();
        List<Supplierstbl> sp = new List<Supplierstbl>();
        List<Agentstbl> ag = new List<Agentstbl>();
        public IEnumerable<Booking> GetAllBookings(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(1, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> GetAllBookingsById(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(2, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> SaveAllBookings(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(3, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> UpdateAllBookings(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(4, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> DeleteBookings(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(5, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> UpdateAllBookingsIsActive(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(6, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> UpdateAllBookingsStatus(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(7, ls, gs, hs, rs, sp, ag);
        }

        //, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag
        // gs, hs, rs, sp, ag

        public IEnumerable<Booking> GetAllBookingsByStatus(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookings(8, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> GetAllBookingsWithSearch(AllBookingstbl ls, Gueststbl gs, Hotelstbl hs, Roomstbl rs, Supplierstbl sp, Agentstbl ag)
        {
            return objAllBookingsDA.AllBookingsWithSearch(1, ls, gs, hs, rs, sp, ag);
        }

        public IEnumerable<Booking> GetAllBookingsSearchWithSearch(AllBookingsSearchtbl abs)
        {
            return objAllBookingsDA.AllBookingsSearch(1, abs);
        }
    }   
}