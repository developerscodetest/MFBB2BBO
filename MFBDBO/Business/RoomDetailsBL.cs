using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class RoomDetailsBL
    {
        RoomDetailsDA objRoomDA = new RoomDetailsDA();
        List<RoomDetailstbl> rd = new List<RoomDetailstbl>();
        public IEnumerable<RoomDetailstbl> GetAllRoom(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(1, rd);
        }

        public IEnumerable<RoomDetailstbl> GetRoombyId(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(2, rd);
        }

        public IEnumerable<RoomDetailstbl> InsertRoom(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(3, rd);
        }
        public IEnumerable<RoomDetailstbl> UpdateRoom(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(4, rd);
        }
        public IEnumerable<RoomDetailstbl> DeleteRoom(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(5, rd);
        }
        public IEnumerable<RoomDetailstbl> UpdateStatus(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(7, rd);
        }
        public IEnumerable<RoomDetailstbl> UpdateRoomIsActive(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(6, rd);
        }
        public IEnumerable<RoomDetailstbl> GetRoomByStatus(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(8, rd);
        }

        public IEnumerable<RoomDetailstbl> GetMaxRoom(RoomDetailstbl rd)
        {
            return objRoomDA.RoomDetails(9, rd);
        }

    }
}