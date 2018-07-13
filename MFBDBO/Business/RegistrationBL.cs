using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class RegistrationBL
    {
        RegistrationDA objRegistrationDA = new RegistrationDA();
        List<Agentstbl> at = new List<Agentstbl>();
        List<AgentDocumentstbl> ad = new List<AgentDocumentstbl>();
        public IEnumerable<Agentstbl> GetAllAgents(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(1, at);
        }
        public IEnumerable<Agentstbl> GetAgentById(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(2, at);
        }
        public IEnumerable<Agentstbl> InsertAgents(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(3, at);
        }

        public IEnumerable<Agentstbl> UpdateAgentIsActive(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(4, at);
        }
        public IEnumerable<Agentstbl> UpdateAgentStatus(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(5, at);
        }
        public IEnumerable<Agentstbl> UpdateAgentMaxID(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(6, at);
        }

        public IEnumerable<Agentstbl> UpdateAgentPayOffineSettings(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(7, at);
        }
        public IEnumerable<Agentstbl> UpdateAgentCommission(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(8, at);
        }
        public IEnumerable<Agentstbl> UpdateAgentStatusAge(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(9, at);
        }
        public IEnumerable<Agentstbl> GetAgentByIsActive(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(10, at);
        }
        public IEnumerable<AgentDocumentstbl> GetAgentDocuments(AgentDocumentstbl ad)
        {
            return objRegistrationDA.AgentsDocument(11, ad);
        }

        public IEnumerable<AgentDocumentstbl> GetAgentDocuByID(AgentDocumentstbl ad)
        {
            return objRegistrationDA.AgentsDocument(12, ad);
        }
        public IEnumerable<AgentDocumentstbl> InsertAgentDocu(AgentDocumentstbl ad)
        {
            return objRegistrationDA.AgentsDocument(3, ad);
        }

        public IEnumerable<AgentDocumentstbl> UpdateAgentDocu(AgentDocumentstbl ad)
        {
            return objRegistrationDA.AgentsDocument(14, ad);
        }

        public IEnumerable<AgentDocumentstbl> DeleteAgentDocu(AgentDocumentstbl ad)
        {
            return objRegistrationDA.AgentsDocument(15, ad);
        }

        public IEnumerable<AgentDocumentstbl> UpdateAgentsDocuIsActiveByDocuID(AgentDocumentstbl at)
        {
            return objRegistrationDA.AgentsDocument(16, at);
        }

        public IEnumerable<AgentDocumentstbl> UpdateAgentsDocuIsActiveByAgentID(AgentDocumentstbl at)
        {
            return objRegistrationDA.AgentsDocument(17, at);
        }

        public IEnumerable<AgentDocumentstbl> GetAgentDocuAgentID(AgentDocumentstbl at)
        {
            return objRegistrationDA.AgentsDocument(9, at);
        }

        public IEnumerable<Agentstbl> GetAgentByStatus(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(21, at);
        }

        public IEnumerable<Agentstbl> UpdateAgentCode(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(22, at);
        }
        public IEnumerable<Agentstbl> GetRejAgents(Agentstbl at)
        {
            return objRegistrationDA.AgentsAll(24, at);
        }

        //public IEnumerable<Agentstbl> UpdateAgentIsActive(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(4, at);
        //}
        //public IEnumerable<Agentstbl>UpdateFileStatus(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(7, at);

        //}
        //public IEnumerable<Agentstbl> UpdateStatus(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(8, at);

        // }
        //public IEnumerable<Agentstbl> InsertAgentSettings(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(9, at);

        //}
        //public IEnumerable<Agentstbl> UpadateAgentSettings(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(10, at);

        //}
        //public IEnumerable<Agentstbl> UpadateAgentCommision(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(11, at);

        //}


        //public IEnumerable<Agentstbl> UpdateAgentStatus(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(12,at);
        //}

        //public IEnumerable<Agentstbl> GetAgentsByIsActive(Agentstbl at)
        //{
        //    return objRegistrationDA.AgentsAll(10, at);
        //}

    }
}