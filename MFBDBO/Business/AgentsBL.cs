using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class AgentsBL
    {
        AgentsDA objAgentsDA = new AgentsDA();
        List<Agentstbl> ls = new List<Agentstbl>();
        public IEnumerable<Agentstbl> GetAllAgents(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(1, ls);
        }

        public IEnumerable<Agentstbl> GetAgentsById(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(2, ls);
        }

        public IEnumerable<Agentstbl> SaveAgents(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(3, ls);
        }

        public IEnumerable<Agentstbl> UpdateAgents(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(4, ls);
        }

        public IEnumerable<Agentstbl> DeleteAgents(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(5, ls);
        }

        public IEnumerable<Agentstbl> UpdateAgentsIsActive(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(6, ls);
        }

        public IEnumerable<Agentstbl> UpdateAgentsStatus(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(7, ls);
        }

        public IEnumerable<Agentstbl> GetAgentsByStatus(Agentstbl ls)
        {
            return objAgentsDA.AgentsAll(8, ls);
        }
    }
}