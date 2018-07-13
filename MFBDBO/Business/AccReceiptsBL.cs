using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class AccReceiptsBL
    {
        AccReceiptsDA objAccReceiptsDA = new AccReceiptsDA();
        List<AccReceiptstbl> ls = new List<AccReceiptstbl>();
        public IEnumerable<AccReceiptstbl> GetAllAccReceipt(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(1, ls);
        }

        public IEnumerable<AccReceiptstbl> GetAccReceiptById(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(2, ls);
        }

        public IEnumerable<AccReceiptstbl> SaveAccReceipt(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(3, ls);
        }

        public IEnumerable<AccReceiptstbl> UpdateAccReceipt(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(4, ls);
        }

        public IEnumerable<AccReceiptstbl> DeleteAccReceipt(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(5, ls);
        }

        public IEnumerable<AccReceiptstbl> UpdateAccReceiptIsActive(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(6, ls);
        }

        public IEnumerable<AccReceiptstbl> UpdateAccReceiptStatus(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(7, ls);
        }

        public IEnumerable<AccReceiptstbl> GetAccReceiptByStatus(AccReceiptstbl ls)
        {
            return objAccReceiptsDA.AccReceiptsAll(8, ls);
        }
    }
}