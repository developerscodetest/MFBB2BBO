using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class StateBL
    {
        StateDA objStateDA = new StateDA();
        List<Statetbl> ls = new List<Statetbl>();
        public IEnumerable<Statetbl> GetAllState(Statetbl st)
        {
            return objStateDA.StateAll(1, st);
        }

        public IEnumerable<Statetbl> GetStateById(Statetbl st)
        {
            return objStateDA.StateAll(2, st);
        }

        public IEnumerable<Statetbl> SaveState(Statetbl st)
        {
            return objStateDA.StateAll(3, st);
        }

        public IEnumerable<Statetbl> UpdateState(Statetbl st)
        {
            return objStateDA.StateAll(4, st);
        }

        public IEnumerable<Statetbl> DeleteState(Statetbl st)
        {
            return objStateDA.StateAll(5, st);
        }

        public IEnumerable<Statetbl> UpdateStateIsActive(Statetbl st)
        {
            return objStateDA.StateAll(6, st);
        }

        public IEnumerable<Statetbl> GetStateIsActive(Statetbl st)
        {
            return objStateDA.StateAll(7, st);
        }

        public IEnumerable<Statetbl> GetStateByCountryID(Statetbl st)
        {
            return objStateDA.StateAll(8, st);
        }

        public IEnumerable<Statetbl> GetStateWithCountry(Statetbl st)
        {
            return objStateDA.StateAll(9, st);
        }

        public IEnumerable<Statetbl> GetStateByStateIdIsActive(Statetbl st)
        {
            return objStateDA.StateAll(10, st);
        }

        public IEnumerable<Statetbl> GetStateByCountryIdIsActive(Statetbl st)
        {
            return objStateDA.StateAll(11, st);
        }
    }
}