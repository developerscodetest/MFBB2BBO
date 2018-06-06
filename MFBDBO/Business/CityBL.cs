using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class CityBL
    {
        CityDA objcityDA = new CityDA();
        List<Citytbl> ct = new List<Citytbl>();
        public IEnumerable<Citytbl> GetAllCity(Citytbl ct)
        {
            return objcityDA.CityAll(1, ct);
        }

        public IEnumerable<Citytbl> GetCitybyId(Citytbl ct)
        {
            return objcityDA.CityAll(2, ct);
        }

        public IEnumerable<Citytbl> InsertCity(Citytbl ct)
        {
            return objcityDA.CityAll(3, ct);
        }
        public IEnumerable<Citytbl> UpdateCity(Citytbl ct)
        {
            return objcityDA.CityAll(4, ct);
        }
        public IEnumerable<Citytbl> DeleteCity(Citytbl ct)
        {
            return objcityDA.CityAll(5, ct);
        }
        public IEnumerable<Citytbl> UpdateCityIsActive(Citytbl ct)
        {
            return objcityDA.CityAll(6, ct);
        }

        public IEnumerable<Citytbl> UpdateCityStatus(Citytbl ct)
        {
            return objcityDA.CityAll(7, ct);
        }

        public IEnumerable<Citytbl> GetCityByStatus(Citytbl ct)
        {
            return objcityDA.CityAll(8, ct);
        }

        public IEnumerable<Citytbl> GetCityWithColumns(Citytbl ct)
        {
            return objcityDA.CityAll(9, ct);
        }

    }





}