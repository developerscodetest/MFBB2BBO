using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class SuppliersBL
    {
        SuppliersDA objSuppliersDA = new SuppliersDA();
        List<Supplierstbl> ls = new List<Supplierstbl>();
        public IEnumerable<Supplierstbl> GetAllSuppliers(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(1, ls);
        }

        public IEnumerable<Supplierstbl> GetSuppliersById(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(2, ls);
        }

        public IEnumerable<Supplierstbl> SaveSuppliers(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(3, ls);
        }

        public IEnumerable<Supplierstbl> UpdateSuppliers(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(4, ls);
        }

        public IEnumerable<Supplierstbl> DeleteSuppliers(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(5, ls);
        }

        public IEnumerable<Supplierstbl> UpdateSuppliersIsActive(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(6, ls);
        }

        public IEnumerable<Supplierstbl> UpdateSuppliersStatus(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(7, ls);
        }

        public IEnumerable<Supplierstbl> GetSuppliersByStatus(Supplierstbl ls)
        {
            return objSuppliersDA.SuppliersAll(8, ls);
        }
    }
}