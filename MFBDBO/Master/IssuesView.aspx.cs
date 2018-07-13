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
    public partial class IssuesView : System.Web.UI.Page
    {
        IssuesBL objIssuesBL = new IssuesBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["IssuesId"].ToString() != null)
                {
                    int IssuesId = Convert.ToInt32(Session["IssuesId"]);
                    GetIssuesById(IssuesId);
                }                
            }
        }
        protected string GetAssintoEmmployee(int agid)
        {
            List<Employeetbl> lstEmp = new List<Employeetbl>();
            Employeetbl emps = new Employeetbl();
            EmployeeBL objEmployeeBLL = new EmployeeBL();
            lstEmp = objEmployeeBLL.GetAllEmployee(emps).ToList();
            var Employee = lstEmp.OfType<Employeetbl>().Where(a => a.EmpId == agid);
            return Employee.First().FirstName + ' ' + Employee.First().LastName;

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Issuestbl iss = new Issuestbl
            {
                IssuesID = Convert.ToInt32(hdnIssuesId.Value),
                BookingID=Convert.ToInt32(txtBookingId.Text),
                Issue = txtIssue.Text,
                Status = Convert.ToInt32(ddlStatus.SelectedValue),
                Priority = Convert.ToInt32(ddlPriority.SelectedValue),
                AssignToEmployee =txtATOEmployee.Text,
                Note = txtNote.Text,
                IsActive = 1,
                UpdatedBy = 1,
                UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
            };
            objIssuesBL.UpdateIssues(iss);
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Issues Updated Successfully');", true);
        }
        protected void GetIssuesById(int IssuesId)
        {
            Issuestbl iss = new Issuestbl
            {
                IssuesID = IssuesId
            };
            List<Issuestbl> lstIssues = new List<Issuestbl>();
            lstIssues = objIssuesBL.GetIssuesbyId(iss).ToList();

            foreach (var el in lstIssues)
            {
                hdnIssuesId.Value = el.IssuesID.ToString();
                txtBookingId.Visible = true;
                txtIssue.Text = el.Issue;
                ddlStatus.SelectedValue = el.Status.ToString();
                ddlPriority.SelectedValue = el.Priority.ToString();
                txtATOEmployee.Text = GetAssintoEmmployee(Convert.ToInt32(el.AssignToEmployee));
                txtNote.Text = el.Note;
            }
        }
    }
}