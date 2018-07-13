using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class DesignationBL
    {
        DesignationDA objDesignationDA = new DesignationDA();
        List<Designationtbl> ls = new List<Designationtbl>();
        public IEnumerable<Designationtbl> GetAllDesignation(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(1, st);
        }

        public IEnumerable<Designationtbl> GetDesignationById(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(2, st);
        }

        public IEnumerable<Designationtbl> SaveDesignation(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(3, st);
        }

        public IEnumerable<Designationtbl> UpdateDesignation(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(4, st);
        }

        public IEnumerable<Designationtbl> DeleteDesignation(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(5, st);
        }

        public IEnumerable<Designationtbl> UpdateDesignationIsActive(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(6, st);
        }

        public IEnumerable<Designationtbl> GetDesignationIsActive(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(7, st);
        }

        public IEnumerable<Designationtbl> GetDesignationByID(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(8, st);
        }

        public IEnumerable<Designationtbl> GetDesignationWithDepartment(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(9, st);
        }

        public IEnumerable<Designationtbl> GetDesignationByIsActive(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(10, st);
        }
        public IEnumerable<Designationtbl> GetDesignationByDepIsActive(Designationtbl st)
        {
            return objDesignationDA.DesignationAll(11, st);
        }
    }
}