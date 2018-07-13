using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        EmployeeBL objEmployeeBL = new EmployeeBL();
        List<Employeetbl> lstEmp = new List<Employeetbl>();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetRole();
                GetEmployee();
                GetDepartment();
                //GetDesignation();
            }
        }
        protected void GetEmployee()
        {            
            Employeetbl Emp = new Employeetbl();
            lstEmp = objEmployeeBL.GetAllEmployee(Emp).ToList();
            DDLRManager.Items.Clear();
            DDLRManager.Items.Add(new ListItem("--Select--", 0.ToString()));
            foreach (var em in lstEmp)
            {
                DDLRManager.Items.Add(new ListItem(em.FirstName + ' ' + em.LastName, em.EmpId.ToString()));
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            Employeetbl et = new Employeetbl
            {
                EmployeeId = txtEID.Text,
                DateOfBirth = txtDOB.Text,
                Username = txtUsername.Text,
                Password = TxtPassword.Text,
                FirstName=txtFname.Text,
                LastName=txtLName.Text,
                Gender=DDLGender.SelectedValue,
                MaritalStatus=DDLMaritalStatus.SelectedValue,
                Email = txtEmail.Text,
                MobileNo = txtMobile.Text,
                Address = txtAddress.Text,
                DateOfJoin=txtDateOfJoin.Text,
                RoleId =DDLRole.SelectedValue,
                DepartmentId = Convert.ToInt32(DDLDept.SelectedValue),
                DesignationId= Convert.ToInt32(DDLDesignation.SelectedValue),
                ReportingManager=DDLRManager.SelectedValue,
                IsActive = 1,
                CreatedBy = 1,
                CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss")
            };
            List<Employeetbl> lst = new List<Employeetbl>();
            //lst = objEmployeeBL.GetEmployeeExists(et).ToList();
            //if (Convert.ToInt32(lst.Count()) <= 0)
            //{
              lst = objEmployeeBL.SaveEmployee(et).ToList();
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('EmployeeID Already Taken');", true);
            //}







            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Employee Data Saved Successfully');", true);
            Clear();
        }
        protected void BtnReset_Click(object sender, EventArgs e)
        {
            Clear();
            //btnSave.Visible = true;
        }
        protected void Clear()
        {
            txtEID.Text = " ";
            txtDOB.Text = " ";
            txtUsername.Text = " ";
            TxtPassword.Text = " ";
            txtFname.Text = " ";
            txtLName.Text = " ";
            DDLGender.SelectedIndex = 0; 
            DDLMaritalStatus.SelectedIndex = 0;
            txtEmail.Text = " ";
            txtMobile.Text = " ";
            txtAddress.Text = " ";
            txtDateOfJoin.Text = " ";
            DDLRole.SelectedIndex = 0;
            DDLDept.SelectedIndex = 0;
            DDLDesignation.SelectedIndex = 0;
            DDLRManager.SelectedIndex = 0;
        }
        protected void GetRole()
        {
            List<Roletbl> lstRole = new List<Roletbl>();
            Roletbl rlt = new Roletbl();
            RoleBL objRoleBL = new RoleBL();
            rlt.IsActive = 1;
            lstRole = objRoleBL.GetRoleByStatus(rlt).ToList();
            foreach (var cnt in lstRole)
            {
                ListItem li = new ListItem();
                li.Text = cnt.RoleName;
                li.Value = cnt.RoleId.ToString();
                DDLRole.Items.Add(li);
            }
        }
        protected void GetDepartment()
        {
            List<Departmenttbl> lstDept = new List<Departmenttbl>();
            Departmenttbl dpt = new Departmenttbl();
            DepartmentBL objDepartmentBL = new DepartmentBL();
            dpt.IsActive = 1;
            lstDept = objDepartmentBL.GetDeparmentByStatus(dpt).ToList();
            foreach (var cnt in lstDept)
            {
                ListItem li = new ListItem();
                li.Text = cnt.DepartmentName;
                li.Value = cnt.DepartmentId.ToString();
                DDLDept.Items.Add(li);
            }
        }
        protected void GetDesignation(int dept)
        {
            List<Designationtbl> lstDesignation = new List<Designationtbl>();
            Designationtbl dsgt = new Designationtbl();
            DesignationBL objDesignationBL = new DesignationBL();
            dsgt.IsActive = 1;
            dsgt.DepartmentId = dept;
            lstDesignation = objDesignationBL.GetDesignationByDepIsActive(dsgt).ToList();
            DDLDesignation.Items.Clear();
            DDLDesignation.Items.Add(new ListItem("--Select--", "0"));
            foreach (var cnt in lstDesignation)
            {
                ListItem li = new ListItem();
                li.Text = cnt.DesignationName;
                li.Value = cnt.DesignationId.ToString();
                DDLDesignation.Items.Add(li);
            }
        }
        protected void DDLDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetDesignation(Convert.ToInt32(DDLDept.SelectedValue));
        }

        protected void txtEID_TextChanged(object sender, EventArgs e)
        {
            Employeetbl et = new Employeetbl
            {
                EmployeeId = txtEID.Text
            };
                List <Employeetbl> lst = new List<Employeetbl>();
            lst = objEmployeeBL.GetEmployeeExists(et).ToList();
            if (Convert.ToInt32(lst.Count()) > 0)
            {

                lblEmpid.Text = "EmployeeID Already Exists";
            }
        }
    }
}