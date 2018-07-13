using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class UserBL
    {
        UserDA objUserDA = new UserDA();
        List<Usertbl> ut = new List<Usertbl>();

        public IEnumerable<Usertbl> GetAllUser(Usertbl ut)
        {
            return objUserDA.UsersAll(1, ut);
        }

        public IEnumerable<Usertbl> GetUsersbyId(Usertbl ut)
        {
            return objUserDA.UsersAll(2, ut);
        }

        public IEnumerable<Usertbl> InsertUsers(Usertbl ut)
        {
            return objUserDA.UsersAll(3, ut);
        }
        public IEnumerable<Usertbl> UpdateUsers(Usertbl ut)
        {
            return objUserDA.UsersAll(4, ut);
        }
        public IEnumerable<Usertbl> DeleteUsres(Usertbl ut)
        {
            return objUserDA.UsersAll(5, ut);
        }
        //public IEnumerable<Usertbl> UpdateUsresIsActive(Usertbl ut)
        //{
        //    return objUserDA.UsersAll(6, ut);
        //}
        public IEnumerable<Usertbl> UpdateUsresStatus(Usertbl ut)
        {
            return objUserDA.UsersAll(7, ut);
        }
        public IEnumerable<Usertbl> GetUsresByRoleId(Usertbl ut)
        {
            return objUserDA.UsersAll(8, ut);
        }
        public IEnumerable<Usertbl> GetUsresWithColumns(Usertbl ut)
        {
            return objUserDA.UsersAll(9, ut);
        }

        public IEnumerable<Usertbl> GetUserExists(Usertbl ut)
        {
            return objUserDA.UsersAll(11, ut);
        }

        public IEnumerable<Usertbl> GetAgentUserExists(Usertbl ut)
        {
            return objUserDA.UsersAll(12, ut);
        }

        public IEnumerable<Usertbl> GetAgentExists(Usertbl ut)
        {
            return objUserDA.UsersAll(13, ut);
        }
    }
}