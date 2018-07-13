using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;
namespace MFBDBO.Business
{
    public class DepartmentBL
    {

        DepartmentDA objDepartmetDA = new DepartmentDA();
        List<Countrytbl> ls = new List<Countrytbl>();
        public IEnumerable<Departmenttbl> GetAllDepartment(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(1, ls);
        }

        public IEnumerable<Departmenttbl> GetDepartmentById(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(2, ls);
        }

        public IEnumerable<Departmenttbl> SaveDeparment(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(3, ls);
        }

        public IEnumerable<Departmenttbl> UpdateDepartment(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(4, ls);
        }

        public IEnumerable<Departmenttbl> DeleteDepartment(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(5, ls);
        }
        public IEnumerable<Departmenttbl> UpdateDeparmentStatus(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(6, ls);
        }

        public IEnumerable<Departmenttbl> GetDeparmentByStatus(Departmenttbl ls)
        {
            return objDepartmetDA.DeparmentAll(8, ls);
        }
    }
}