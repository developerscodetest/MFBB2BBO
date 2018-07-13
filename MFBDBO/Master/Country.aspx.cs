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
    public partial class Country : System.Web.UI.Page
    {
        CountryBL objCountryBL = new CountryBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCountry();
                btnUpdate.Visible = false;
            }
        }        

        protected void GetCountry()
        {
            Countrytbl ls = new Countrytbl();            
            List<Countrytbl> lst = new List<Countrytbl>();
            lst = objCountryBL.GetAllCountry(ls).ToList();
            gdvCountry.DataSource = lst;
            gdvCountry.DataBind();            
        }        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Countrytbl ls = new Countrytbl();
            ls.CountryName = txtCountry.Text;           
            ls.IsActive = 1;
            ls.CreatedBy = 1;
            ls.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<Countrytbl> lst = new List<Countrytbl>();
            lst = objCountryBL.SaveCountry(ls).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Country Saved Successfully');", true);
            Clear();
            GetCountry();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }

        protected void Clear()
        {
            txtCountry.Text = string.Empty;            
        }

        protected void lbtnCEdit_Click(object sender, EventArgs e)
        {
            //GetCountry();
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            getCountrybyCountryName(id);
        }

        protected void getCountrybyCountryName(int id)
        {
            Countrytbl ls = new Countrytbl();
            ls.CountryID = id; 
            List<Countrytbl> lst = new List<Countrytbl>();
            lst = objCountryBL.GetCountryById(ls).ToList();

            foreach (var el in lst)
            {
                txtCountry.Text = el.CountryName;
                hdnCountryID.Value = el.CountryID.ToString();
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Countrytbl ls = new Countrytbl();
            ls.CountryID = Convert.ToInt32(hdnCountryID.Value);
            ls.CountryName = txtCountry.Text;                  
            List<Countrytbl> lst = new List<Countrytbl>();
            ls.IsActive = 1;
            ls.UpdatedBy = 1;
            ls.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            lst = objCountryBL.UpdateCountry(ls).ToList();            
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Country Updated Successfully');", true);
            Clear();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
            GetCountry();
        }

        protected void gdvCountry_RowDataBound1(object sender, GridViewRowEventArgs e)
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
            Countrytbl cnt = new Countrytbl();
            cnt.CountryID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                cnt.IsActive = 0;
            }
            else if(id == "InActive")
            {
                cnt.IsActive = 1;
            }
            objCountryBL.UpdateCountryIsActive(cnt);
            GetCountry();
        }
                
    }
}