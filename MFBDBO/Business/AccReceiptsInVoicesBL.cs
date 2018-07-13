using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class AccReceiptsInVoicesBL
    {
        AccReceiptsInVoicesDA objAccReceiptsInVoicesDA = new AccReceiptsInVoicesDA();
        List<AccReceiptInVoicestbl> lv = new List<AccReceiptInVoicestbl>();
        public IEnumerable<AccReceiptInVoicestbl> GetAllAccReceiptInVoices(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(1, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> GetAccReceiptInVoicesById(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(2, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> SaveAccReceiptInVoices(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(3, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> UpdateAccReceiptInVoices(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(4, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> DeleteAccRecieptInVoices(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(5, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> UpdateAccReceiptInVoicesIsActive(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(6, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> UpdateAccReceiptInVoicesStatus(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(7, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> GetAccReceiptInVoicesByStatus(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(8, lv);
        }

        public IEnumerable<AccReceiptInVoicestbl> GetAccReceiptInVoicesByReceiptID(AccReceiptInVoicestbl lv)
        {
            return objAccReceiptsInVoicesDA.AccReceiptsInVoicesAll(9, lv);
        }
    }
}