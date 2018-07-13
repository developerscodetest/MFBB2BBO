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
    public partial class InactiveHRM : System.Web.UI.Page
    {
        DepartmentBL objDepartmentBL = new DepartmentBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDepartment();
                btnUpdate.Visible = false;
            }
        }
        protected void GetDepartment()
        {
            Departmenttbl ls = new Departmenttbl();
            List<Departmenttbl> lst = new List<Departmenttbl>();
            lst = objDepartmentBL.GetAllDepartment(ls).ToList();
            gdvDeparment.DataSource = lst;
            gdvDeparment.DataBind();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Departmenttbl ls = new Departmenttbl();
            ls.DepartmentName = txtDepartment.Text;
            ls.IsActive = 1;
            ls.CreatedBy = 1;
            ls.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<Departmenttbl> lst = new List<Departmenttbl>();
            lst = objDepartmentBL.SaveDeparment(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Department Saved Successfully');", true);
            Clear();
            GetDepartment();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void Clear()
        {
            txtDepartment.Text = string.Empty;
        }
        protected void lbtnCEdit_Click(object sender, EventArgs e)
        {
            //GetCountry();
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            getdeprtmentbyDepartmentName(id);
        }

        protected void getdeprtmentbyDepartmentName(int id)
        {
            Departmenttbl ls = new Departmenttbl();
            ls.DepartmentId = id;
            List<Departmenttbl> lst = new List<Departmenttbl>();
            lst = objDepartmentBL.GetDepartmentById(ls).ToList();

            foreach (var el in lst)
            {
                txtDepartment.Text = el.DepartmentName;
                hdnDepartmentId.Value = el.DepartmentId.ToString();
                hdnStatus.Value = el.IsActive.ToString();
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Departmenttbl ls = new Departmenttbl();
            ls.DepartmentId = Convert.ToInt32(hdnDepartmentId.Value);
            ls.DepartmentName = txtDepartment.Text;
            List<Departmenttbl> lst = new List<Departmenttbl>();
            ls.IsActive = Convert.ToInt32(hdnStatus.Value);
            ls.UpdatedBy = 1;
            ls.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            lst = objDepartmentBL.UpdateDepartment(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Department Updated Successfully');", true);
            Clear();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
            GetDepartment();
        }

        protected void gdvDeparment_RowDataBound1(object sender, GridViewRowEventArgs e)
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
            Departmenttbl cnt = new Departmenttbl();
            cnt.DepartmentId = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                cnt.IsActive = 0;
            }
            else if (id == "InActive")
            {
                cnt.IsActive = 1;
            }
            objDepartmentBL.UpdateDeparmentStatus(cnt);
            GetDepartment();
        }

        
    }
}