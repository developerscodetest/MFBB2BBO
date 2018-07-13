using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class EmployeeView : System.Web.UI.Page
    {
        EmployeeBL objEmployeeBL = new EmployeeBL();
        List<Employeetbl> lstEmp = new List<Employeetbl>();

        DepartmentBL objDeparmentBL = new DepartmentBL();
        List<Departmenttbl> lstdept = new List<Departmenttbl>();

        DesignationBL objDesignationBL = new DesignationBL();
        List<Designationtbl> lstdesg = new List<Designationtbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                GetDepartment();
                GetEmployee();
                if (Session["EmpId"].ToString() != null)
                {
                    int EmpId = Convert.ToInt32(Session["EmpId"]);
                    GetEmployeeById(EmpId);
                    
                }
               
            }
        }
        protected void GetEmployee()
        {
            Employeetbl Emp = new Employeetbl();
            lstEmp = objEmployeeBL.GetAllEmployee(Emp).ToList();
            DDLRManager.Items.Clear();
            DDLRManager.Items.Add(new ListItem("--Select--", "0"));
            foreach (var em in lstEmp)
            {
                DDLRManager.Items.Add(new ListItem(em.FirstName + ' ' + em.LastName, em.EmpId.ToString()));
            }
        }
        protected void GetDepartment()
        {
            Departmenttbl dept = new Departmenttbl();
            lstdept = objDeparmentBL.GetAllDepartment(dept).ToList();
            DDLDept.Items.Clear();
            DDLDept.Items.Add(new ListItem("--Select--", "0"));
            foreach (var dp in lstdept)
            {
                DDLDept.Items.Add(new ListItem(dp.DepartmentName, dp.DepartmentId.ToString()));
            }
        }
        protected void GetDesignation(int DeptId)
        {
            Designationtbl desg = new Designationtbl();
            desg.IsActive = 1;
            desg.DepartmentId = DeptId;
            //lstdesg = objDesignationBL.GetDesignationWithDepartment(desg).ToList();
            lstdesg = objDesignationBL.GetDesignationByDepIsActive(desg).ToList();
            DDLDesignation.Items.Clear();
            DDLDesignation.Items.Add(new ListItem("--Select--", "0"));
            foreach (var em in lstdesg)
            {
                //DDLDesignation.Items.Add(new ListItem(em.DesignationName, em.DesignationId.ToString()));
                ListItem li = new ListItem();
                li.Text = em.DesignationName;
                li.Value = em.DesignationId.ToString();
                DDLDesignation.Items.Add(li);
            }
        }
        protected void GetEmployeeById(int EmpId)
        {
            Employeetbl Emp = new Employeetbl
            {
                EmpId = EmpId
            };

            List<Employeetbl> lstEmp = new List<Employeetbl>();
            lstEmp = objEmployeeBL.GetEmployeeById(Emp).ToList();

            foreach (var el in lstEmp)
            {
                txtEID.Text = el.EmployeeId;
                txtEmail.Text = el.Email;
                txtDOB.Text = el.DateOfBirth;
                txtMobile.Text = el.MobileNo;
                txtUsername.Text = el.Username;
                TxtPassword.Text = el.Password;
                txtFname.Text = el.FirstName;
                txtLName.Text = el.LastName;
                DDLGender.SelectedValue = el.Gender;
                DDLMaritalStatus.SelectedValue = el.MaritalStatus;
                txtMobile.Text = el.MobileNo;
                txtAddress.Text = el.Address;
                txtDateOfJoin.Text = el.DateOfJoin;
                DDLRole.SelectedValue = el.RoleId;
                DDLDept.SelectedValue = el.DepartmentId.ToString();
                DesignationBL objDesignationBL = new DesignationBL();
                List<Designationtbl> lstdesg = new List<Designationtbl>();
                GetDesignation(el.DepartmentId);
                DDLDesignation.SelectedValue = el.DesignationId.ToString();
                DDLRManager.SelectedValue = el.ReportingManager;
                hdnEmpId.Value = el.EmpId.ToString();
                hdnStatus.Value = el.IsActive.ToString();
                
            }
        }
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Employeetbl Emp = new Employeetbl();
            Emp.EmpId = Convert.ToInt32(hdnEmpId.Value);
            Emp.EmployeeId = txtEID.Text;
            Emp.DateOfBirth = txtDOB.Text;
            Emp.Username = txtUsername.Text;
            Emp.Password = TxtPassword.Text;
            Emp.FirstName = txtFname.Text;
            Emp.LastName = txtLName.Text;
            Emp.Gender = DDLGender.SelectedValue;
            Emp.MaritalStatus = DDLMaritalStatus.SelectedValue;
            Emp.Email = txtEmail.Text;
            Emp.MobileNo = txtMobile.Text;
            Emp.Address = txtAddress.Text;
            Emp.DateOfJoin = txtDateOfJoin.Text;
            Emp.RoleId = DDLRole.SelectedValue;
            Emp.DepartmentId = Convert.ToInt32(DDLDept.SelectedValue);
            Emp.DesignationId = Convert.ToInt32(DDLDesignation.SelectedValue);
            Emp.ReportingManager = DDLRManager.SelectedValue;
            Emp.IsActive = Convert.ToInt32(hdnStatus.Value); ;
            Emp.UpdatedBy = 1;
            Emp.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            //List<Employeetbl> lstemp = new List<Employeetbl>();
            lstEmp =objEmployeeBL.UpdateEmployee(Emp).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Employee Data Updated Successfully');", true);
          
            GetEmployee();
            Clear();
            Response.Redirect("EmployeeList.aspx");
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
        protected void DDLDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetDesignation(Convert.ToInt32(DDLDept.SelectedValue));
        }
    }
}