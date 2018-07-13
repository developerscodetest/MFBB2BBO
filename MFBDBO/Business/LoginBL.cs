using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;



namespace MFBDBO.Business
{
    public class LoginBL
    {
        LoginDA objDA = new LoginDA();
        List<Usertbl> ls = new List<Usertbl>();
        public IEnumerable<Usertbl> GetAllUsers(Usertbl ls)
        {
            return objDA.UsersAll(1, ls);
        }

        public IEnumerable<Usertbl> GetUserById(Usertbl ls)
        {
            return objDA.UsersAll(2, ls);
        }
       
        public IEnumerable<Usertbl>GetUserByStatus(Usertbl ls)
        {
            return objDA.UsersAll(3, ls);

        }
        public IEnumerable<Usertbl> GetUserExists(Usertbl ls)
        {
            return objDA.UsersAll(4, ls);

        }
    }
}