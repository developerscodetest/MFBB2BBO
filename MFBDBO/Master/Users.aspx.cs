using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MFBDBO.Business;
using MFBDBO.Data;
using MySql.Data.MySqlClient;

namespace MFBDBO.Master
{
    public partial class Users : System.Web.UI.Page
    {
        RoleBL objStateBL = new RoleBL();
        List<Roletbl> lstRole = new List<Roletbl>();

        EmployeeBL objEmployeeBL = new EmployeeBL();
        List<Employeetbl> lstEmployee = new List<Employeetbl>();

        AgentsBL objAgentsBL = new AgentsBL();
        List<Agentstbl> lstAgents = new List<Agentstbl>();

        UserBL objUserBL = new UserBL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
         
            Roletbl rt = new Roletbl();
            lstRole = objStateBL.GetAllRole(rt).ToList();
            //btnUpdate.Visible = false;
            if (!IsPostBack)
            {
                
                GetRole();
                GetUser();
            }
        }
        protected void GetRole()
        {
            List<Roletbl> lstRole = new List<Roletbl>();
            Roletbl rl = new Roletbl();
            RoleBL objRoleBL = new RoleBL();
            rl.IsActive = 1;
            lstRole = objRoleBL.GetRoleByStatus(rl).ToList();
            foreach (var cnt in lstRole)
            {
                ListItem li = new ListItem();
                li.Text = cnt.RoleName;
                li.Value = cnt.RoleId.ToString();
                ddlRole.Items.Add(li);
            }
        }
        protected void GetName(string RoleId)
        {
            ddlName.Items.Clear();
            List<Employeetbl> lstEmployee = new List<Employeetbl>();
            Employeetbl emp = new Employeetbl();
            emp.RoleId = RoleId;
            EmployeeBL objEmployeebl = new EmployeeBL();
            lstEmployee = objEmployeebl.GetEmployeeByRoleId(emp).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlName.Items.Add(l);
            foreach (var em in lstEmployee)
            {
                ListItem li = new ListItem();
                li.Text = em.FirstName + ' ' + em.LastName;
                li.Value = em.EmpId.ToString();
                ddlName.Items.Add(li);
            }
        }

        protected void GetAgentName(string RoleId)
        {
            ddlName.Items.Clear();
            List<Agentstbl> lstAgents = new List<Agentstbl>();
            Agentstbl agt = new Agentstbl();
            //agt.AgentID = 1;
            AgentsBL objAgentsBL = new AgentsBL();
            lstAgents = objAgentsBL.GetAllAgents(agt).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlName.Items.Add(l);
            foreach (var em in lstAgents)
            {
                ListItem li = new ListItem();
                li.Text = em.FirstName + ' ' + em.LastName;
                li.Value = em.AgentID.ToString();
                ddlName.Items.Add(li);
            }
        }
        protected void GetUser()
        {
            Usertbl ut = new Usertbl();
            List<Usertbl> lst = new List<Usertbl>();
            lst = objUserBL.GetAllUser(ut).ToList();
            gdvUsers.DataSource = lst;
            gdvUsers.DataBind();
            btnUpdate.Visible = false;
        }
        protected void InsertUsers()
        {
            Usertbl ut = new Usertbl();
        
            ut.RoleID = Convert.ToInt32(ddlRole.SelectedValue);
            ut.LoginUserId = Convert.ToInt32(ddlName.SelectedValue);
            ut.Username = txtUserName.Text;
            ut.Password = txtPassword.Text;
            ut.Status = 1;
            ut.CreatedBy = 1;
            ut.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<Usertbl> lst = new List<Usertbl>();
            lst = objUserBL.GetAgentExists(ut).ToList();
            if (Convert.ToInt32(lst.Count()) <= 0)
            {
                lst = objUserBL.GetUserExists(ut).ToList();
                if (Convert.ToInt32(lst.Count()) <= 0)
                {
                    lst = objUserBL.InsertUsers(ut).ToList();
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Username Already Taken');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Username for this agent already exists');", true);
            }
            btnSave.Visible = true;
            GetUser();

        }
        internal void Reset()
        {
            ddlRole.SelectedIndex = 0;
            ddlName.SelectedIndex = 0;
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtPassword.Attributes["value"] = "";
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void GetUserbyID(int id)
        {
            Usertbl ut = new Usertbl();
            ut.UserID = id;
            List<Usertbl> lst = new List<Usertbl>();
            lst = objUserBL.GetUsersbyId(ut).ToList();
            RoleBL objRoleBL = new RoleBL();

            foreach (var el in lst)
            {
                hdnUsersId.Value = el.UserID.ToString();
                txtUserName.Text = el.Username;
                txtPassword.Text = el.Password;
                txtPassword.Attributes["value"] = txtPassword.Text;
                ddlRole.SelectedValue = el.RoleID.ToString();
                GetName(ddlRole.SelectedValue);
                ddlName.SelectedValue = el.LoginUserId.ToString();
                hdnStatus.Value = el.Status.ToString();

            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Usertbl ct = new Usertbl();
            ct.UserID = Convert.ToInt32(hdnUsersId.Value);
            ct.RoleID =Convert.ToInt32(ddlRole.SelectedValue);
            ct.LoginUserId = Convert.ToInt32(ddlName.SelectedValue);
            ct.Username = txtUserName.Text;
            ct.Password = txtPassword.Text;
            ct.Status = Convert.ToInt32(hdnStatus.Value);
            ct.UpdatedBy = 1;
            ct.UpdatedDate = DateTime.Now.ToString();
            List<Usertbl> lst = new List<Usertbl>();
            lst = objUserBL.UpdateUsers(ct).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('User Updated Successfully');", true);
            Reset();
            GetUser();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void lbtnLEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            GetUserbyID(id);
        }
        protected void gdvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[5].Text) == 1)
                {
                    e.Row.Cells[5].Text = "Active";
                    e.Row.FindControl("lbtnLMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[5].Text) == 0)
                {
                    e.Row.Cells[5].Text = "InActive";
                    e.Row.FindControl("lbtnLMarkAsInActive").Visible = false;
                }
                var lst = lstRole;
                var val = lst.OfType<Roletbl>().Where(s => s.RoleId == Convert.ToInt32(e.Row.Cells[1].Text));
                e.Row.Cells[1].Text = val.Count() <=0 ? "" : val.First().RoleName;
                //e.Row.Cells[2].Text =val.Count() <=0 ? "" : gettblEmployeebyname(Convert.ToInt32(e.Row.Cells[2].Text));
                e.Row.Cells[2].Text = gettblEmployeebyname(Convert.ToInt32(e.Row.Cells[2].Text));

                //var lst1 = lst;
                //var val1 = lst.OfType<Employeetbl>().Where(s => s.EmpId == Convert.ToInt32(e.Row.Cells[1].Text));
                //e.Row.Cells[1].Text = val.First().

            }
        }
        protected string gettblEmployeebyname(int id)
        {
            Employeetbl em = new Employeetbl();
            em.EmpId = id;
            List<Employeetbl> lst = new List<Employeetbl>();
            lst = objEmployeeBL.GetEmployeeById(em).ToList();
            
            foreach (var el in lst )
            {
                em.FirstName = el.FirstName;
                em.LastName = el.LastName;
            }
            //var lst1 = lstEmployee;
            //var val1 = lst.OfType<Employeetbl>().Where(ei => ei.EmpId == Convert.ToInt32(id));
            //var Name = val1.First().FirstName + " " + val1.First().LastName;
            return em.FirstName + ' ' + em.LastName;
        }
        protected void lbtnLMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[5].Text;
            Usertbl ct = new Usertbl();
            ct.UserID = Convert.ToInt32(gvr.Cells[0].Text);
            if (gvr.Cells[5].Text == "Active")
            {
                ct.Status = 0;
            }
            else if (gvr.Cells[5].Text == "InActive")
            {
                ct.Status = 1;
            }
            objUserBL.UpdateUsresStatus(ct);
            GetUser();
        }
        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRole.SelectedIndex == 1)
            {
                GetName(ddlRole.SelectedValue);
            }
            else
            {
                GetAgentName(ddlRole.SelectedValue);
            }
          
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertUsers();
            Reset();
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
    }
}