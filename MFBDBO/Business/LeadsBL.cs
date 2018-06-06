using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class LeadsBL
    {        
        LeadsDA objLeadsDA = new LeadsDA();
        List<Leadstbl> ls = new List<Leadstbl>();
        public IEnumerable<Leadstbl> GetAllLeads(Leadstbl ls)
        {            
            return objLeadsDA.LeadsAll(1, ls);
        }

        public IEnumerable<Leadstbl> GetLeadById(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(2, ls);
        }

        public IEnumerable<Leadstbl> SaveLeads(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(3, ls);
        }

        public IEnumerable<Leadstbl> UpdateLeads(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(4, ls);
        }

        public IEnumerable<Leadstbl> DeleteLeads(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(5, ls);
        }        

        public IEnumerable<Leadstbl> UpdateLeadIsActive(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(6, ls);
        }

        public IEnumerable<Leadstbl> UpdateLeadsStatus(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(7, ls);
        }

        public IEnumerable<Leadstbl> GetLeadsByStatus(Leadstbl ls)
        {
            return objLeadsDA.LeadsAll(8, ls);
        }
    }
}