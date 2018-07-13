using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class ReportsBL
    {
        ReportsDA objReportDA = new ReportsDA();        
        public IEnumerable<BookingGuestRpt> GetAllSupplier(BookingGuestRpt bg)
        {
            return objReportDA.RequestReportAll(1, bg);
        }
        public IEnumerable<BookingGuestRpt> GetSupplierById(BookingGuestRpt bg)
        {
            return objReportDA.RequestReportAll(2, bg);
        }
        public IEnumerable<BookingGuestRpt> GetAllAgents(BookingGuestRpt bg)
        {
            return objReportDA.RequestReportAllAgents(1, bg);
        }
        public IEnumerable<BookingGuestRpt> GetAgentsById(BookingGuestRpt bg)
        {
            return objReportDA.RequestReportAllAgents(2, bg);
        }
        public IEnumerable<BookingGuestRpt> GetAllReports(BookingGuestRpt bg)
        {
            return objReportDA.BookingReportAll(1, bg);
        }
        public IEnumerable<BookingGuestRpt> GetAllReportById(BookingGuestRpt bg)
        {
            return objReportDA.BookingReportAll(2, bg);
        }
        public IEnumerable<BookingGuestRpt> GEtCheckinReportAll(BookingGuestRpt bg)
        {
            return objReportDA.CheckinReportAll(1, bg);
        }
        public IEnumerable<BookingGuestRpt> GetCheckinReportById(BookingGuestRpt bg)
        {
            return objReportDA.CheckinReportAll(2, bg);
        }
    }
}