using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class CuntryDocumentBL
    {
        CuntryDocumentDA objCuntryDocuDA = new CuntryDocumentDA();
        List<CuntryDocumenttbl> ls = new List<CuntryDocumenttbl>();
        public IEnumerable<CuntryDocumenttbl> GetAllCuntryDocu(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(1, st);
        }

        public IEnumerable<CuntryDocumenttbl> GetCDocumentById(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(2, st);
        }

        public IEnumerable<CuntryDocumenttbl> SaveCDocument(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(3, st);
        }

        public IEnumerable<CuntryDocumenttbl> UpdateCDocument(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(4, st);
        }

        public IEnumerable<CuntryDocumenttbl> DeleteCDocument(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(5, st);
        }

        public IEnumerable<CuntryDocumenttbl> UpdateCDocumentIsActive(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(6, st);
        }

        public IEnumerable<CuntryDocumenttbl> GetCDocumentIsActive(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(7, st);
        }

        public IEnumerable<CuntryDocumenttbl> GetCountryByID(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(8, st);
        }

        public IEnumerable<CuntryDocumenttbl> GetStateWithCountry(CuntryDocumenttbl st)
        {
            return objCuntryDocuDA.CuntryDocuAll(9, st);
        }
    }
}