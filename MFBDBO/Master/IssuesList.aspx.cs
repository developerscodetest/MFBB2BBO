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
    public partial class IssuesList : System.Web.UI.Page
    {
        Employeetbl cnt = new Employeetbl();
        List<Employeetbl> lstEmployee = new List<Employeetbl>();

        IssuesBL objIssuesBL = new IssuesBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            EmployeeBL objEmpBL = new EmployeeBL();
            List<Employeetbl> lstEmp = new List<Employeetbl>();
            GetEmployee();
            GetIssues();
        }
        protected void GetIssues()
        {
            Issuestbl ls = new Issuestbl();            
            List<Issuestbl> lst = new List<Issuestbl>();
            lst = objIssuesBL.GetAllIssues(ls).ToList();
            gdvIssues.DataSource = lst;
            gdvIssues.DataBind();
        }
        //protected void GetEmployee()
        //{
        //    Employeetbl Emp = new Employeetbl();

        //    lstEmp = objEmpBL.GetEmployeeById(Emp).ToList();
        //}

        protected string GetEmployee()
        {
            //List<Employeetbl> lstEmp = new List<Employeetbl>();
            Employeetbl emp = new Employeetbl();
            EmployeeBL objEmployeeBL = new EmployeeBL();
            lstEmployee = objEmployeeBL.GetAllEmployee(emp).ToList();
            foreach (var cnt in lstEmployee)
            {
                emp.FirstName = cnt.FirstName;
                emp.LastName = cnt.LastName;
            }

            return emp.FirstName + " " + emp.LastName;
        }

        protected void lbtnView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var IssuesId = Convert.ToInt32(gvr.Cells[0].Text);
            Session["IssuesId"] = IssuesId;
            Response.Redirect("IssuesView.aspx");
        }

        protected void gdvIssues_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[3].Text) == 1)
                {
                    e.Row.Cells[3].Text = "Reopen";
                }
                else if (Convert.ToInt32(e.Row.Cells[3].Text) == 2)
                {
                    e.Row.Cells[3].Text = "Open";
                }
                else if (Convert.ToInt32(e.Row.Cells[3].Text) == 3)
                {
                    e.Row.Cells[3].Text = "Closed";
                }

                if (Convert.ToInt32(e.Row.Cells[4].Text) == 1)
                {
                    e.Row.Cells[4].Text = "Low";
                }
                else if (Convert.ToInt32(e.Row.Cells[4].Text) == 2)
                {
                    e.Row.Cells[4].Text = "Medium";
                }
                else if (Convert.ToInt32(e.Row.Cells[4].Text) == 3)
                {
                    e.Row.Cells[4].Text = "High";
                }
                var lst = lstEmployee;
                var res = lst.OfType<Employeetbl>().Where(s => s.EmpId == Convert.ToInt32(e.Row.Cells[5].Text));
                e.Row.Cells[5].Text = res.Count() <= 0 ? "" : res.First().FirstName + " " + res.First().LastName;
            }
        }
    }
}