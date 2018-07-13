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

namespace MFBDBO.Salesmanagement
{
    public partial class Leads : System.Web.UI.Page
    {
        LeadsBL objLeadsBL = new LeadsBL();        
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetAll();
            }            
        }

        protected void GetAll()
        {
            GetLeads(gdvLeads,1);
            GetLeads(gdvCallback, 2);
            GetLeads(gdvInterested, 3);
            GetLeads(gdvNotInterested, 4);
        }

        protected void GetLeads(GridView grid,int id)
        {
            Leadstbl ls = new Leadstbl();
            ls.Status = id;
            List<Leadstbl> lst = new List<Leadstbl>();
            lst = objLeadsBL.GetLeadsByStatus(ls).ToList();
            if (lst.Count() >= 1)
            {
                grid.DataSource = lst;
                grid.DataBind();
                btnUpdate.Visible = false;
            }
            else
            {
                DataTable dt = new DataTable();
                grid.DataSource = dt;
                grid.DataBind();
            }

       
           
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            Leadstbl ls = new Leadstbl();
            ls.AgencyName = txtAName.Text;
            ls.ContactPerson = txtContactPerson.Text;
            ls.Email = txtEmail.Text;
            ls.MobileNo = txtMobileNo.Text;
            ls.Status = 1;
            ls.IsActive = 1;
            ls.CreatedBy = 1;
            ls.CreatedDate = DateTime.Now.ToString();
            
            List<Leadstbl> lst = new List<Leadstbl>();
            lst = objLeadsBL.SaveLeads(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Lead Saved Successfully');", true);
            Clear();
            GetAll();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Leadstbl ls = new Leadstbl();
            ls.AgencyName = txtAName.Text;
            ls.ContactPerson = txtContactPerson.Text;
            ls.Email = txtEmail.Text;
            ls.MobileNo = txtMobileNo.Text;
            ls.Status = Convert.ToInt32(hdnStatus.Value);
            ls.IsActive = 1;
            ls.UpdatedBy = 1;
            ls.UpdatedDate = DateTime.Now.ToString();
            ls.LID = hdnLID.Value;
            List<Leadstbl> lst = new List<Leadstbl>();
            lst = objLeadsBL.UpdateLeads(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Lead Updated Successfully');", true);
            Clear();
            GetAll();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {          
            getLeadbyId(1);
        }

        protected void Clear()
        {
            txtAName.Text = string.Empty;
            txtContactPerson.Text = string.Empty;
            txtMobileNo.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }

        protected void getLeadbyId(int id)
        {
            Leadstbl ls = new Leadstbl();
            ls.LID = id.ToString(); ;
            List<Leadstbl> lst = new List<Leadstbl>();
            lst = objLeadsBL.GetLeadById(ls).ToList();

            foreach (var el in lst)
            {
                hdnLID.Value = el.LID;
                txtAName.Text = el.AgencyName;
                txtContactPerson.Text = el.ContactPerson;
                txtMobileNo.Text = el.MobileNo;
                txtEmail.Text = el.Email;
                hdnStatus.Value = el.Status.ToString();
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }

        protected void EditAll(object sender, EventArgs e)
        {            
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);

            getLeadbyId(id);
        }

        protected void UpdateStatusAll(object sender,EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[0].Text;
            Leadstbl ls = new Leadstbl();
            ls.LID = id;
            if(lbtn.Text.Contains("Call Back"))
                ls.Status = 2;
            else if (lbtn.Text.Contains("Not Interested"))
                ls.Status = 4;
            else if (lbtn.Text.Contains("Interested"))
                ls.Status = 3;
            objLeadsBL.UpdateLeadsStatus(ls);
            GetAll();
        }

        protected void lbtnLEdit_Click(object sender, EventArgs e)
        {
            EditAll(sender, e);
        }

        protected void lbtnStatus_Click(object sender, EventArgs e)
        {
            UpdateStatusAll(sender, e);
        }
        
        protected void gdvLeads_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}