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
    public partial class Designation : System.Web.UI.Page
    {
        List<Departmenttbl> lstDepartment = new List<Departmenttbl>();
        DepartmentBL objDeparmentBL = new DepartmentBL();
        DesignationBL objDesignationBL = new DesignationBL();
        Departmenttbl cnt = new Departmenttbl();
       
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                GetDepartment();
                GetDesignation();
                //ddlDeparment.SelectedIndex = 0;
            } 
        }
        protected void GetDesignation()
        {
            Designationtbl ls = new Designationtbl();
            List<Designationtbl> lst = new List<Designationtbl>();
            lst = objDesignationBL.GetAllDesignation(ls).ToList();
            gdvDesignation.DataSource = lst;
            gdvDesignation.DataBind();
            btnUpdate.Visible = false;
        }
        protected void insertDesignation()
        {
            Designationtbl st = new Designationtbl();
            st.DesignationName = txtDesignation.Text;
            st.DepartmentId = Convert.ToInt32(ddlDeparment.SelectedValue);
            st.IsActive = 1;
            st.CreatedBy = 1;
            st.CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");

            List<Designationtbl> lst = new List<Designationtbl>();
            lst = objDesignationBL.SaveDesignation(st).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Designation Saved Successfully');", true);
            btnSave.Visible = true;
            GetDesignation();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            insertDesignation();
            Reset();
            //Response.Redirect("Designation.aspx");
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void GetDepartment()
        {
            List<Departmenttbl> lstDepartment = new List<Departmenttbl>();
            Departmenttbl dept = new Departmenttbl();
            ddlDeparment.Items.Clear();
            dept.IsActive = 1;
            lstDepartment = objDeparmentBL.GetDeparmentByStatus(dept).ToList();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlDeparment.Items.Add(l);

            foreach (var em in lstDepartment)
            {
                ListItem li = new ListItem();
                li.Text =em.DepartmentName;
                li.Value = em.DepartmentId.ToString();
                ddlDeparment.Items.Add(li);
            }
        }         
        protected string GetDepartmentByID(int id)
        {
           
            Departmenttbl ctry = new Departmenttbl();
            ctry.DepartmentId = id;
            List<Departmenttbl> lstDepartment = new List<Departmenttbl>();
            lstDepartment = objDeparmentBL.GetDepartmentById(ctry).ToList();
            foreach (var cnt in lstDepartment)
            {
               
                ctry.DepartmentName = cnt.DepartmentName;               
            }
            return ctry.DepartmentName;

        }        
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Designationtbl st = new Designationtbl();
            st.DesignationId = Convert.ToInt32(hdnDesignationId.Value);
            st.DesignationName = txtDesignation.Text;
            st.DepartmentId = Convert.ToInt32(ddlDeparment.SelectedValue);
            st.IsActive =Convert.ToInt32(hdnStatus.Value);
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");
            List<Designationtbl> lst = new List<Designationtbl>();
            lst = objDesignationBL.UpdateDesignation(st).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Designation Updated Successfully');", true);
            Reset();
            GetDesignation();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void Reset()
        {
            ddlDeparment.SelectedIndex = 0;
            txtDesignation.Text = " ";
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void GetDesignationById(int id)
        {
            Designationtbl cd = new Designationtbl();
            cd.DepartmentId = id;
            List<Designationtbl> lst = new List<Designationtbl>();
            lst = objDesignationBL.GetDesignationById(cd).ToList();

            foreach (var el in lst)
            {
                hdnDesignationId.Value = el.DesignationId.ToString();
              
                ddlDeparment.SelectedValue = el.DepartmentId.ToString();
                txtDesignation.Text = el.DesignationName;
                hdnStatus.Value = el.IsActive.ToString();
            }
        }
        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);

            Designationtbl st = new Designationtbl();
            st.DesignationId = id;
            List<Designationtbl> lst = new List<Designationtbl>();
            lst = objDesignationBL.GetDesignationById(st).ToList();

            foreach (var el in lst)
            {
                hdnDesignationId.Value = el.DesignationId.ToString();
                hdnStatus.Value = el.IsActive.ToString();
                ddlDeparment.SelectedValue = el.DepartmentId.ToString();
                txtDesignation.Text = el.DesignationName;
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void lbtnActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var status = gvr.Cells[3].Text;
            Designationtbl st = new Designationtbl();
            st.DesignationId = Convert.ToInt32(gvr.Cells[0].Text);
            if (status == "Active")
            {
                st.IsActive = 0;
            }
            else if (status == "InActive")
            {
                st.IsActive = 1;
            }
            objDesignationBL.UpdateDesignationIsActive(st);
            GetDesignation();
        }
        protected void gdvDesignation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[3].Text) == 1)
                {
                    e.Row.Cells[3].Text = "Active";
                    e.Row.FindControl("lbtnActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[3].Text) == 0)
                {
                    e.Row.Cells[3].Text = "InActive";
                    e.Row.FindControl("lbtnInActive").Visible = false;
                }
                //var lst = lstDepartment;
                //var val = lst.OfType<Departmenttbl>().Where(d => d.DepartmentId == Convert.ToInt32(e.Row.Cells[1].Text));
                //e.Row.Cells[1].Text = val.Count() <= 0 ? "" : val.First().DepartmentName;
                e.Row.Cells[1].Text = GetDepartmentByID(Convert.ToInt32(e.Row.Cells[1].Text));

                //if (e.Row.RowType == DataControlRowType.DataRow)
                //{
                //    //e.Row.Cells[2].Text = lstbgr[e.Row.RowIndex].GuestDetailscls.;
                //    e.Row.Cells[1].Text = lstDepartment.First().DepartmentName;
                //}

            }
        }

    }
}
