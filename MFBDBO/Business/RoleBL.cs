using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;

namespace MFBDBO.Business
{
    public class RoleBL
    {
        RoleDA objRoleDA = new RoleDA();
        List<Roletbl> ls = new List<Roletbl>();
        public IEnumerable<Roletbl> GetAllRole(Roletbl ls)
        {
            return objRoleDA.RoleAll(1, ls);
        }

        public IEnumerable<Roletbl> GetRoleById(Roletbl ls)
        {
            return objRoleDA.RoleAll(2, ls);
        }

        public IEnumerable<Roletbl> SaveRole(Roletbl ls)
        {
            return objRoleDA.RoleAll(3, ls);
        }

        public IEnumerable<Roletbl> UpdateRole(Roletbl ls)
        {
            return objRoleDA.RoleAll(4, ls);
        }

        public IEnumerable<Roletbl> DeleteRole(Roletbl ls)
        {
            return objRoleDA.RoleAll(5, ls);
        }
        public IEnumerable<Roletbl> UpdateRoleIsActive(Roletbl ls)
        {
            return objRoleDA.RoleAll(6, ls);
        }

        public IEnumerable<Roletbl> GetRoleByStatus(Roletbl ls)
        {
            return objRoleDA.RoleAll(8, ls);
        }
    }

    
}