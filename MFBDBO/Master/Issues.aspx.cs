using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class Issues : System.Web.UI.Page
    {
        IssuesBL objIssuesBL = new IssuesBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        
        protected void IssuesInsert()
        {
            Issuestbl iss = new Issuestbl
            {
                BookingID = Convert.ToInt32(ddlBookingID.SelectedValue),
                Issue = txtIssue.Text,
                Status = Convert.ToInt32(ddlStatus.SelectedValue),
                Priority = Convert.ToInt32(ddlPriority.SelectedValue),
                AssignToEmployee = (ddlAssignToEmployee.SelectedValue),
                Note = txtNote.Text,
                IsActive = 1,
                CreatedBy = 1,
                CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
               
            };
            List<Issuestbl> lst = new List<Issuestbl>();
            lst = objIssuesBL.InsertIssues(iss).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnSave.Visible = true;
        }
        internal void Reset()
        {
            ddlBookingID.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlPriority.SelectedIndex = 0;
            ddlAssignToEmployee.SelectedIndex = 0;
            txtIssue.Text = "";
            txtNote.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            IssuesInsert();
            Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
                
    }
}