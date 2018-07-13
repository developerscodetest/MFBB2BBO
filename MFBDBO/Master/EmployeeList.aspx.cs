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
    public partial class ActiveHRM : System.Web.UI.Page
    {
        DepartmentBL objDeptBL = new DepartmentBL();
        List<Departmenttbl> lstDept = new List<Departmenttbl>();
        DesignationBL objDesgBL = new DesignationBL();
        List<Designationtbl> lstDesg = new List<Designationtbl>();

        EmployeeBL objEmployeeBL = new EmployeeBL();
        Employeetbl Emp = new Employeetbl();
        List<Employeetbl> lstEmp = new List<Employeetbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetDeparment();
            GetDesignation();
            //lstDept = objDeptBL.GetAllDepartment().ToList();
            if (!IsPostBack)
            {
                GetEmployee();
                
            }
        }
        protected void GetEmployee()
        {            
            lstEmp = objEmployeeBL.GetAllEmployee(Emp).ToList();
            gdvEmployee.DataSource = lstEmp;
            gdvEmployee.DataBind();
        }
        protected void lbtnSEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var EmpId = Convert.ToInt32(gvr.Cells[0].Text);
            Session["EmpId"] = EmpId;
            Response.Redirect("EmployeeView.aspx");

            
        }
        protected void GetDeparment()
        {
            Departmenttbl Dept = new Departmenttbl();
        
            lstDept = objDeptBL.GetAllDepartment(Dept).ToList();
        }
        protected void GetDesignation()
        {
            Designationtbl Desg = new Designationtbl();

            lstDesg = objDesgBL.GetAllDesignation(Desg).ToList();
        }
        protected void gdvEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var lste = lstEmp;
                var em = lste.OfType<Employeetbl>().Where(ep => ep.EmpId == Convert.ToInt32(e.Row.Cells[0].Text));

                e.Row.Cells[2].Text = em.Count() <= 0 ? "" : em.First().FirstName + ' ' + em.First().LastName;

                if (Convert.ToInt32(e.Row.Cells[7].Text) == 1)
                {
                    e.Row.Cells[7].Text = "Active";
                    e.Row.FindControl("lbtnSMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[7].Text) == 0)
                {
                    e.Row.Cells[7].Text = "InActive";
                    e.Row.FindControl("lbtnSMarkAsInActive").Visible = false;
                }
                var lst = lstDept;
                var res = lst.OfType<Departmenttbl>().Where(s => s.DepartmentId == Convert.ToInt32(e.Row.Cells[3].Text));
                e.Row.Cells[3].Text = res.Count() <= 0 ? "" : res.First().DepartmentName;

                var lst1 = lstDesg;
                var des = lst1.OfType<Designationtbl>().Where(s => s.DesignationId == Convert.ToInt32(e.Row.Cells[4].Text));
                e.Row.Cells[4].Text = des.Count() <= 0 ? "" : des.First().DesignationName;
            }
        }

        protected void lbtnSMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[7].Text;
            Employeetbl cnt = new Employeetbl();
            cnt.EmpId = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                cnt.IsActive = 0;
            }
            else if (id == "InActive")
            {
                cnt.IsActive = 1;
            }
            objEmployeeBL.UpdateEmployeeIsActive(cnt);
            GetEmployee();            
        }

    }
}
