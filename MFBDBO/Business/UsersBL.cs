using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class UsersBL
    {

        UsersDA objUsersDA = new UsersDA();
        List<Userstbl> ut = new List<Userstbl>();
        public IEnumerable<Userstbl> GetAllUsers(Userstbl ut)
        {
            return objUsersDA.UsersAll(1, ut);
        }

        public IEnumerable<Userstbl> GetUsersbyId(Userstbl ut)
        {
            return objUsersDA.UsersAll(2, ut);
        }

        public IEnumerable<Userstbl> InsertUsers(Userstbl ut)
        {
            return objUsersDA.UsersAll(3, ut);
        }
        public IEnumerable<Userstbl> UpdateUsers(Userstbl ut)
        {
            return objUsersDA.UsersAll(4, ut);
        }
        public IEnumerable<Userstbl> DeleteUsres(Userstbl ut)
        {
            return objUsersDA.UsersAll(5, ut);
        }
        public IEnumerable<Userstbl> UpdateUsresIsActive(Userstbl ut)
        {
            return objUsersDA.UsersAll(6, ut);
        }
        public IEnumerable<Userstbl> UpdateUsresStatus(Userstbl ut)
        {
            return objUsersDA.UsersAll(7, ut);
        }
        public IEnumerable<Userstbl> GetUsresByRoleId(Userstbl ut)
        {
            return objUsersDA.UsersAll(8, ut);
        }
        public IEnumerable<Userstbl> GetUsresWithColumns(Userstbl ut)
        {
            return objUsersDA.UsersAll(9, ut);
        }
    }
}