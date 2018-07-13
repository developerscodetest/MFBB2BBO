using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFBDBO.Data;
using MySql.Data.MySqlClient;

namespace MFBDBO.Business
{
    public class AccPaymentsBL
    {
       AccPaymentsDA objPaymentsDA = new AccPaymentsDA();
        List<AccPaymentstbl> pa = new List<AccPaymentstbl>();
        public IEnumerable<AccPaymentstbl> GetAllPayments(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(1, pa);
        }

        public IEnumerable<AccPaymentstbl> GetPaymentsbyId(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(2, pa);
        }

        public IEnumerable<AccPaymentstbl> InsertPayments(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(3, pa);
        }
        public IEnumerable<AccPaymentstbl> UpdatePayments(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(4, pa);
        }
        public IEnumerable<AccPaymentstbl> DeletePayments(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(5, pa);
        }
        public IEnumerable<AccPaymentstbl> UpdatePaymentsIsActive(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(6, pa);
        }
        public IEnumerable<AccPaymentstbl> UpdatePaymentsStatus(AccPaymentstbl ls)
        {
            return objPaymentsDA.PaymentsAll(7, ls);
        }
        public IEnumerable<AccPaymentstbl> GetPaymentsByStatus(AccPaymentstbl pa)
        {
            return objPaymentsDA.PaymentsAll(8, pa);
        }       

        
    }
}

