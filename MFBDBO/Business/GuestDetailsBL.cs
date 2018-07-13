using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;


namespace MFBDBO.Business
{
    public class GuestDetailsBL
    {
        GuestDetailsDA objGuestDA = new GuestDetailsDA();
        List<GuestDetailstbl> gd = new List<GuestDetailstbl>();
        public IEnumerable<GuestDetailstbl> GetAllGuest(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(1, gd);
        }

        public IEnumerable<GuestDetailstbl> GetGuestbyId(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(2, gd);
        }

        public IEnumerable<GuestDetailstbl> InsertGuest(GuestDetailstbl hd)
        {
            return objGuestDA.GuestDetails(3, hd);
        }
        public IEnumerable<GuestDetailstbl> UpdateGuest(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(4, gd);
        }
        public IEnumerable<GuestDetailstbl> DeleteGuest(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(5, gd);
        }
        public IEnumerable<GuestDetailstbl> UpdateGuestIsActive(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(6, gd);
        }

        public IEnumerable<GuestDetailstbl> UpdateGuestStatus(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(7, gd);
        }

        public IEnumerable<GuestDetailstbl> GetHotelByStatus(GuestDetailstbl gd)
        {
            return objGuestDA.GuestDetails(8, gd);
        }




    }
}