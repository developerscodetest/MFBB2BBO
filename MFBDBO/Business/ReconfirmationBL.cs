using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFBDBO.Data;
namespace MFBDBO.Business
{
    public class ReconfirmationBL
    {


        ReconfirmationDA objReconDA = new ReconfirmationDA();
        List<Reconfirmationtbl> ra = new List<Reconfirmationtbl>();
        public IEnumerable<Reconfirmationtbl> GetAllReconfirmation(Reconfirmationtbl ra)
        {
            return objReconDA.ReconfirmationAll(1, ra);
        }

        public IEnumerable<Reconfirmationtbl> GetReconfirmbyId(Reconfirmationtbl ra)
        {
            return objReconDA.ReconfirmationAll(2, ra);
        }

        public IEnumerable<Reconfirmationtbl> InsertReconfirm(Reconfirmationtbl ra)
        {
            return objReconDA.ReconfirmationAll(3, ra);
        }
        public IEnumerable<Reconfirmationtbl> UpdateReconfirm(Reconfirmationtbl ra)
        {
            return objReconDA.ReconfirmationAll(4, ra);
        }
        public IEnumerable<Reconfirmationtbl> DeleteReconfirm(Reconfirmationtbl ra)
        {
            return objReconDA.ReconfirmationAll(5, ra);
        }
      
        public IEnumerable<Reconfirmationtbl> GetReconfirmIsActive(Reconfirmationtbl ra)
        {
            return objReconDA.ReconfirmationAll(6, ra);
        }




    }
}