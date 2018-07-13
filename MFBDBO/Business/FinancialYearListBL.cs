using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFBDBO.Data;
using MFBDBO.Business;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Business
{
    public class FinancialYearListBL
    {

        FinancialYearListDA objFinancialDA = new FinancialYearListDA();
        List<FinancialYearListtbl> fa = new List<FinancialYearListtbl>();
        public IEnumerable<FinancialYearListtbl> GetAllFinancial(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(1, fa);
        }

        public IEnumerable<FinancialYearListtbl> GetFinancebyId(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(2, fa);
        }

        public IEnumerable<FinancialYearListtbl> InsertFinancialList(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(3, fa);
        }
        public IEnumerable<FinancialYearListtbl> UpdateFinancialList(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(4, fa);
        }
        public IEnumerable<FinancialYearListtbl> DeleteFinancialList(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(5, fa);
        }
        public IEnumerable<FinancialYearListtbl> UpdateFinancialListIsActive(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(6, fa);
        }
        public IEnumerable<FinancialYearListtbl> GetFinancialListByStatus(FinancialYearListtbl fa)
        {
            return objFinancialDA.FinancialListAll(7, fa);
        }







    }
}