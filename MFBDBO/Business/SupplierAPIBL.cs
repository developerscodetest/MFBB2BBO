using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFBDBO.Data;


namespace MFBDBO.Business
{
    public class SupplierAPIBL
    {


       SupplierAPIDA  objSupAPIDA = new SupplierAPIDA();
        List<SupplierAPItbl> sa = new List<SupplierAPItbl>();
        public IEnumerable<SupplierAPItbl> GetAllSupplierAPI(SupplierAPItbl sa)
        {
            return objSupAPIDA.SupplierAPIAll(1, sa);
        }

        public IEnumerable<SupplierAPItbl> GetSupAPIbyId(SupplierAPItbl sa)
        {
            return objSupAPIDA.SupplierAPIAll(2, sa);
        }

        public IEnumerable<SupplierAPItbl> InsertSupAPI(SupplierAPItbl sa)
        {
            return objSupAPIDA.SupplierAPIAll(3, sa);
        }
        public IEnumerable<SupplierAPItbl> UpdateSupAPI(SupplierAPItbl sa)
        {
            return objSupAPIDA.SupplierAPIAll(4, sa);
        }
        public IEnumerable<SupplierAPItbl> DeleteSupAPI(SupplierAPItbl sa)
        {
            return objSupAPIDA.SupplierAPIAll(5, sa);
        }
       




    }
}