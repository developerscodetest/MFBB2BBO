using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;


namespace MFBDBO.Business
{
    public class HotelDetailsBL
    {
        HotelDetailsDA objHotelDA = new HotelDetailsDA();
        List<HotelDetailstbl> hd = new List<HotelDetailstbl>();
        public IEnumerable<HotelDetailstbl> GetAllHotel(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(1,hd);
        }

        public IEnumerable<HotelDetailstbl> GetHotelbyId(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(2, hd);
        }

        public IEnumerable<HotelDetailstbl> InsertHotel(HotelDetailstbl hd)
        {
            return   objHotelDA.HotelDetails(3, hd);
        }
        public IEnumerable<HotelDetailstbl> UpdateHotel(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(4, hd);
        }
        public IEnumerable<HotelDetailstbl> DeleteHotel(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(5, hd);
        }
        public IEnumerable<HotelDetailstbl> UpdateHotelIsActive(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(6, hd);
        }

        public IEnumerable<HotelDetailstbl> UpdateHotelStatus(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(7, hd);
        }

        public IEnumerable<HotelDetailstbl> GetHotelByStatus(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(8, hd);
        }
        public IEnumerable<HotelDetailstbl> GetMaxHotel(HotelDetailstbl hd)
        {
            return objHotelDA.HotelDetails(9, hd);
        }


    }
}