using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MFBDBO.Data;
namespace MFBDBO.Business
{
    public class EmployeeBL
    {
        EmployeeDA objEmployeeDA = new EmployeeDA();
        List<Employeetbl> et = new List<Employeetbl>();
        public IEnumerable<Employeetbl> GetAllEmployee(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(1, et);
        }
        public IEnumerable<Employeetbl> GetEmployeeById(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(2, et);
        }
        public IEnumerable<Employeetbl> SaveEmployee(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(3, et);
        }
        public IEnumerable<Employeetbl> UpdateEmployee(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(4, et);
        }
        public IEnumerable<Employeetbl> DeleteEmployee(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(5, et);
        }
        public IEnumerable<Employeetbl> UpdateEmployeeIsActive(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(6, et);
        }
        public IEnumerable<Employeetbl> UpdateEmployeeStatus(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(7, et);
        }
        public IEnumerable<Employeetbl> GetEmployeeByStatus(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(8, et);
        }
        public IEnumerable<Employeetbl> GetEmployeeByRoleId(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(9, et);
        }
        public IEnumerable<Employeetbl> GetEmployeeByEmailID(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(10, et);
        }
        public IEnumerable<Employeetbl> GetEmployeeExists(Employeetbl et)
        {
            return objEmployeeDA.EmployeeAll(11, et);
        }



    }
}