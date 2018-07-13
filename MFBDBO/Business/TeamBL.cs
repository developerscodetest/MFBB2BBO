using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class TeamBL
    {

        TeamDA objteamDA = new TeamDA();
        List<Teamtbl> ta = new List<Teamtbl>();
        public IEnumerable<Teamtbl> GetAllTeam(Teamtbl ta)
        {
            return objteamDA.TeamAll(1, ta);
        }

        public IEnumerable<Teamtbl> GetTeambyId(Teamtbl ta)
        {
            return objteamDA.TeamAll(2, ta);
        }

        public IEnumerable<Teamtbl> InsertTeam(Teamtbl ta)
        {
            return objteamDA.TeamAll(3, ta);
        }
        public IEnumerable<Teamtbl> UpdateTeam(Teamtbl ta)
        {
            return objteamDA.TeamAll(4, ta);
        }
        public IEnumerable<Teamtbl> DeleteTeam(Teamtbl ta)
        {
            return objteamDA.TeamAll(5, ta);
        }
        public IEnumerable<Teamtbl> GetTeamByStatus(Teamtbl ta)
        {
            return objteamDA.TeamAll(6, ta);
        }



    }
}


