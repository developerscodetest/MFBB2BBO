using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class MinorAccountBL
    {
        MinorAccountDA objMinorAccountDA = new MinorAccountDA();
        List<MinorAccounttbl> ls = new List<MinorAccounttbl>();
        public IEnumerable<MinorAccounttbl> GetAllMinorAccount(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(1, ls);
        }

        public IEnumerable<MinorAccounttbl> GetMinorAccountById(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(2, ls);
        }

        public IEnumerable<MinorAccounttbl> SaveMinorAccount(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(3, ls);
        }

        public IEnumerable<MinorAccounttbl> UpdateMinorAccount(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(4, ls);
        }

        public IEnumerable<MinorAccounttbl> DeleteMinorAccount(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(5, ls);
        }

        public IEnumerable<MinorAccounttbl> UpdateMinorAccountIsActive(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(6, ls);
        }

        public IEnumerable<MinorAccounttbl> UpdateMinorAccountStatus(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(7, ls);
        }

        public IEnumerable<MinorAccounttbl> GetMinorAccountByStatus(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(8, ls);
        }

        public IEnumerable<MinorAccounttbl> UpdateMinorAccountAmount(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(9, ls);
        }

        public IEnumerable<MinorAccounttbl> MajorAccountIDByStatus(MinorAccounttbl ls)
        {
            return objMinorAccountDA.MinorAccountAll(10, ls);
        }
    }
}
