using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class IssuesBL
    {
        IssuesDA objIssuesDA = new IssuesDA();
        List<Issuestbl> iss = new List<Issuestbl>();
        public IEnumerable<Issuestbl> GetAllIssues(Issuestbl iss)
        {
            return objIssuesDA.IssuesAll(1, iss);
        }

        public IEnumerable<Issuestbl> GetIssuesbyId(Issuestbl iss)
        {
            return objIssuesDA.IssuesAll(2, iss);
        }

        public IEnumerable<Issuestbl> InsertIssues(Issuestbl iss)
        {
            return objIssuesDA.IssuesAll(3, iss);
        }
        public IEnumerable<Issuestbl>UpdateIssues(Issuestbl iss)
        {
            return objIssuesDA.IssuesAll(4, iss);
        }
        public IEnumerable<Issuestbl> DeleteLeads(Issuestbl iss)
        {
            return objIssuesDA.IssuesAll(5, iss);
        }
        public IEnumerable<Issuestbl> UpdateLeadIsActive(Issuestbl iss)
        {
            return objIssuesDA.IssuesAll(6, iss);
        }

        public IEnumerable<Issuestbl> UpdateIssuesStatus(Issuestbl ls)
        {
            return objIssuesDA.IssuesAll(7, ls);
        }

        public IEnumerable<Issuestbl> GetIssueByStatus(Issuestbl ls)
        {
            return objIssuesDA.IssuesAll(8, ls);
        }
        
    }
}


