using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class CountryBL
    {
        CountryDA objCountryDA = new CountryDA();
        List<Countrytbl> ls = new List<Countrytbl>();
        public IEnumerable<Countrytbl> GetAllCountry(Countrytbl ls)
        {
            return objCountryDA.CountryAll(1, ls);
        }

        public IEnumerable<Countrytbl> GetCountryById(Countrytbl ls)
        {
            return objCountryDA.CountryAll(2, ls);
        }

        public IEnumerable<Countrytbl> SaveCountry(Countrytbl ls)
        {
            return objCountryDA.CountryAll(3, ls);
        }

        public IEnumerable<Countrytbl> UpdateCountry(Countrytbl ls)
        {
            return objCountryDA.CountryAll(4, ls);
        }

        public IEnumerable<Countrytbl> DeleteCountry(Countrytbl ls)
        {
            return objCountryDA.CountryAll(5, ls);
        }

        public IEnumerable<Countrytbl> UpdateCountryIsActive(Countrytbl ls)
        {
            return objCountryDA.CountryAll(6, ls);
        }

        public IEnumerable<Countrytbl> UpdateCountryStatus(Countrytbl ls)
        {
            return objCountryDA.CountryAll(7, ls);
        }

        public IEnumerable<Countrytbl> GetCountryByIsActive(Countrytbl ls)
        {
            return objCountryDA.CountryAll(8, ls);
        }
    }
}



