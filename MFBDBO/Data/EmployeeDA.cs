using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace MFBDBO.Data
{
    public class EmployeeDA
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);

        public IEnumerable<Employeetbl> EmployeeAll(int type, Employeetbl et)
        {
            List<Employeetbl> obj = new List<Employeetbl>();
            try
            {
                MySqlCommand cmd = new MySqlCommand("Sp_Employees", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("type", type);
                cmd.Parameters.AddWithValue("pEmpId", et.EmpId);
                cmd.Parameters.AddWithValue("pEmployeeId", et.EmployeeId);
                cmd.Parameters.AddWithValue("pDateOfBirth", et.DateOfBirth);
                cmd.Parameters.AddWithValue("pUsername", et.Username);
                cmd.Parameters.AddWithValue("pPassword", et.Password);
                cmd.Parameters.AddWithValue("pFirstName", et.FirstName);
                cmd.Parameters.AddWithValue("pLastName", et.LastName);
                cmd.Parameters.AddWithValue("pGender", et.Gender);
                cmd.Parameters.AddWithValue("pMaritalStatus", et.MaritalStatus);
                cmd.Parameters.AddWithValue("pEmail", et.Email);
                cmd.Parameters.AddWithValue("pMobileNo", et.MobileNo);
                cmd.Parameters.AddWithValue("pAddress", et.Address);
                cmd.Parameters.AddWithValue("pDateOfJoin", et.DateOfJoin);
                cmd.Parameters.AddWithValue("pRoleId", et.RoleId);
                cmd.Parameters.AddWithValue("pDepartmentId", et.DepartmentId);
                cmd.Parameters.AddWithValue("pDesignationId", et.DesignationId);
                cmd.Parameters.AddWithValue("pReportingManager", et.ReportingManager);
                //cmd.Parameters.AddWithValue("pEmployeeNumber", et.EmployeeNumber);
                //cmd.Parameters.AddWithValue("pUserId", et.UserId);
                //cmd.Parameters.AddWithValue("pMiddleName", et.MiddleName);
                //cmd.Parameters.AddWithValue("pBloodGroup", et.BloodGroup);
                //cmd.Parameters.AddWithValue("ProfileImage", et.ProfileImage);
                //cmd.Parameters.AddWithValue("pAddressId", et.AddressId);
                //cmd.Parameters.AddWithValue("pPermanentAddressId", et.PermanentAddressId);
                //cmd.Parameters.AddWithValue("pHomephoneNo", et.HomephoneNo);
                //cmd.Parameters.AddWithValue("pOfficePhoneNo", et.OfficePhoneNo);
                //cmd.Parameters.AddWithValue("pEmployeeStatus", et.EmployeeStatus);
                //cmd.Parameters.AddWithValue("pReferenceId", et.ReferenceId);
                //cmd.Parameters.AddWithValue("pDescription", et.Description);
                cmd.Parameters.AddWithValue("pIsActive", et.IsActive);
                cmd.Parameters.AddWithValue("pCreatedBy", et.CreatedBy);
                cmd.Parameters.AddWithValue("pCreatedDate", et.CreatedDate);
                cmd.Parameters.AddWithValue("pUpdatedBy", et.UpdatedBy);
                cmd.Parameters.AddWithValue("pUpdatedDate", et.UpdatedDate);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    obj.Add(new Employeetbl
                    {
                        EmpId=Convert.ToInt32(dr["EmpId"]),
                        EmployeeId = dr["EmployeeId"].ToString(),
                        DateOfBirth = dr["DateOfBirth"].ToString(),
                        Username = dr["Username"].ToString(),
                        Password = dr["Password"].ToString(),
                        FirstName = dr["FirstName"].ToString(),
                        LastName = dr["LastName"].ToString(),
                        Gender = dr["Gender"].ToString(),
                        MaritalStatus = dr["MaritalStatus"].ToString(),
                        Email = dr["Email"].ToString(),
                        MobileNo = dr["MobileNo"].ToString(),
                        Address = dr["Address"].ToString(),
                        DateOfJoin = dr["DateOfJoin"].ToString(),
                        RoleId = dr["RoleId"].ToString(),
                        DepartmentId=Convert.ToInt32(dr["DepartmentId"]),
                        DesignationId = Convert.ToInt32(dr["DesignationId"]),
                        ReportingManager = dr["ReportingManager"].ToString(),
                        //EmployeeNumber = dr["EmployeeNumber"].ToString(),
                        //MiddleName = dr["MiddleName"].ToString(),
                        //UserId = Convert.ToInt32(dr["UserId"]),
                        //BloodGroup = dr["BloodGroup"].ToString(),
                        //ProfileImage = dr["ProfileImage"].ToString(),
                        //AddressId = dr["AddressId"].ToString(),
                        //PermanentAddressId = dr["PermanentAddressId"].ToString(),
                        //HomephoneNo = dr["HomephoneNo"].ToString(),
                        //OfficePhoneNo = dr["OfficePhoneNo"].ToString(),
                        //EmployeeStatus = dr["EmployeeStatus"].ToString(),
                        //ReferenceId = dr["ReferenceId"].ToString(),
                        //Description = Convert.ToInt32(dr["Description"]),
                        IsActive = Convert.ToInt32(dr["IsActive"]),
                        CreatedBy = string.IsNullOrEmpty(dr["CreatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["CreatedBy"]),
                        CreatedDate = dr["CreatedDate"].ToString(),
                        UpdatedBy = string.IsNullOrEmpty(dr["UpdatedBy"].ToString()) ? 0 : Convert.ToInt32(dr["UpdatedBy"]),
                        UpdatedDate = dr["UpdatedDate"].ToString(),
                        Message = "Success",

                    });
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                obj.Add(new Employeetbl
                {
                    Message = "Error",
                    ErrorMessage = ex.Message,
                });
            }
            finally
            {
                con.Close();
            }
            return obj;
        }
    }
    public class Employeetbl : Common
    {
        public int EmpId { get; set; }
        public string EmployeeId { get; set; }
        public string DateOfBirth { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string MaritalStatus { get; set; }
        public string Email { get; set; }
        public string MobileNo { get; set; }
        public string Address { get; set; }
        public string DateOfJoin { get; set; }
        public string RoleId { get; set; }
        public int DepartmentId { get; set; }
        public int DesignationId { get; set; }
        public string ReportingManager { get; set; }
        //public string EmployeeNumber { get; set; }
        //public int UserId { get; set; }
        //public string MiddleName { get; set; }
        //public string BloodGroup { get; set; }
        //public string ProfileImage { get; set; }
        //public string AddressId { get; set; }
        //public string PermanentAddressId { get; set; }
        //public string HomephoneNo { get; set; }
        //public string OfficePhoneNo { get; set; }
        //public string EmployeeStatus { get; set; }
        //public string ReferenceId { get; set; }
        //public int Description { get; set; }
        //public int IsActive { get; set; }
        //public int CreatedBy { get; set; }
        //public string CreatedDate { get; set; }
        //public int UpdatedBy { get; set; }
        //public string UpdatedDate { get; set; }
        //public string Message { get; set; }
        //public string ErrorMessage { get; set; }
    }
}