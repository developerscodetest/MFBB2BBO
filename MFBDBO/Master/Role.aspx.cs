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
    public partial class Role : System.Web.UI.Page
    {
        RoleBL objRoleBL = new RoleBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetRole();
                btnUpdate.Visible = false;
            }
        }
        protected void GetRole()
        {
            Roletbl ls = new Roletbl();
            List<Roletbl> lst = new List<Roletbl>();
            lst = objRoleBL.GetAllRole(ls).ToList();
            gdvRole.DataSource = lst;
            gdvRole.DataBind();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Roletbl ls = new Roletbl();
            ls.RoleName = txtRole.Text;
            ls.IsActive = 1;
            ls.CreatedBy = 1;
            ls.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<Roletbl> lst = new List<Roletbl>();
            lst = objRoleBL.SaveRole(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Role Saved Successfully');", true);
            Clear();
            GetRole();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Roletbl ls = new Roletbl();
            ls.RoleId = Convert.ToInt32(hdnRoleId.Value);
            ls.RoleName = txtRole.Text;
            List<Roletbl> lst = new List<Roletbl>();
            ls.IsActive = 1;
            ls.UpdatedBy = 1;
            ls.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            lst = objRoleBL.UpdateRole(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Role Updated Successfully');", true);
            Clear();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
            GetRole();
        }
        protected void lbtnCEdit_Click(object sender, EventArgs e)
        {
            //GetCountry();
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            getRoleByRoleName(id);
        }
        protected void gdvRole_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[2].Text) == 1)
                {
                    e.Row.Cells[2].Text = "Active";
                    e.Row.FindControl("lbtnCMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[2].Text) == 0)
                {
                    e.Row.Cells[2].Text = "InActive";
                    e.Row.FindControl("lbtnCMarkAsInActive").Visible = false;
                }

            }
        }
        protected void lbtnCMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[2].Text;
            Roletbl cnt = new Roletbl();
            cnt.RoleId = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                cnt.IsActive = 0;
            }
            else if (id == "InActive")
            {
                cnt.IsActive = 1;
            }
            objRoleBL.UpdateRoleIsActive(cnt);
            GetRole();
        }
        protected void getRoleByRoleName(int id)
        {
            Roletbl ls = new Roletbl();
            ls.RoleId = id;
            List<Roletbl> lst = new List<Roletbl>();
            lst = objRoleBL.GetRoleById(ls).ToList();

            foreach (var el in lst)
            {
                txtRole.Text = el.RoleName;
                hdnRoleId.Value = el.RoleId.ToString();
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void Clear()
        {
            txtRole.Text = string.Empty;
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
    }
}