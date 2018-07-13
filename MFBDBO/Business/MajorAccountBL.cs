using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;


namespace MFBDBO.Business
{
    public class MajorAccountBL
    {
        MajorAccountDA objAccountsDA = new MajorAccountDA();
        List<MajorAccounttbl>  ma = new List<MajorAccounttbl>();
        public IEnumerable<MajorAccounttbl> GetAllAccounts(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(1, ma);
        }

        public IEnumerable<MajorAccounttbl> GetAccountsbyId(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(2, ma);
        }

        public IEnumerable<MajorAccounttbl> InsertAccounts(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(3, ma);
        }
        public IEnumerable<MajorAccounttbl> UpdateAccounts(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(4, ma);
        }
        public IEnumerable<MajorAccounttbl> DeleteAccounts(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(5, ma);
        }
        public IEnumerable<MajorAccounttbl> UpdateAccountIsActive(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(6, ma);
        }
        public IEnumerable<MajorAccounttbl> GetAccountsByStatus(MajorAccounttbl ma)
        {
            return objAccountsDA.MajorAccountAll(7, ma);
        }

    }




}
