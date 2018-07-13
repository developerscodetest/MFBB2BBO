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
    public partial class City : System.Web.UI.Page
    {
        StateBL objStateBL = new StateBL();
        List<Statetbl> lstState = new List<Statetbl>();
        CityBL objCityBl = new CityBL();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Statetbl st = new Statetbl();
            lstState = objStateBL.GetAllState(st).ToList();
            if (!IsPostBack)
            {                
                GetCountry();
                GetCity();
            }
        }
        protected void GetCountry()
        {
            List<Countrytbl> lstCountry = new List<Countrytbl>();
            Countrytbl ctry = new Countrytbl();
            CountryBL objcountryBL = new CountryBL();
            ctry.IsActive = 1;
            lstCountry = objcountryBL.GetCountryByIsActive(ctry).ToList();
            foreach (var cnt in lstCountry)
            {
                ListItem li = new ListItem();
                li.Text = cnt.CountryName;
                li.Value = cnt.CountryID.ToString();
                ddlCountry.Items.Add(li);
            }
        }

        protected void GetState(int CountryID)
        {
            ddlState.Items.Clear();
            List<Statetbl> lststate = new List<Statetbl>();
            Statetbl ste = new Statetbl();
            ste.CountryID = CountryID;
            StateBL objstatebl = new StateBL();
            ste.IsActive = 1;
            lstState = objStateBL.GetStateByCountryIdIsActive(ste).ToList();
                ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            ddlState.Items.Add(l);
            foreach (var st in lstState)
            {
                ListItem li = new ListItem();
                li.Text = st.StateName;
                li.Value = st.StateID.ToString();
                ddlState.Items.Add(li);
            }
        }
        protected void GetCity()
        {
            Citytbl ct = new Citytbl();
            List<Citytbl> lst = new List<Citytbl>();
            lst = objCityBl.GetCityWithColumns(ct).ToList();
            gdvCity.DataSource = lst;
            gdvCity.DataBind();
            btnUpdate.Visible = false;
        }
        protected void InsertCity()
        {
            Citytbl ct = new Citytbl();
            ct.CityName = txtCity.Text;
            ct.StateID = Convert.ToInt32(ddlState.SelectedValue);
            ct.IsActive = 1;
            ct.CreatedBy = 1;
            ct.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            ct.UpdatedBy = 1;
            ct.UpdatedDate = DateTime.Now.ToString();
            List<Citytbl> lst = new List<Citytbl>();
            lst = objCityBl.InsertCity(ct).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnSave.Visible = true;
            GetCity();
            
        }
        internal void Reset()
        {
            ddlCountry.SelectedIndex = 0;
            ddlState.SelectedIndex = 0;
            txtCity.Text = "";
            btnSave.Visible = true;
            btnUpdate.Visible = false;

        }
        protected void btnSave_Click1(object sender, EventArgs e)
        {
            InsertCity();
            Reset();

        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetState(Convert.ToInt32(ddlCountry.SelectedValue));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();

        }
        protected void GetCitybyID(int id)
        {
            Citytbl ct = new Citytbl();
            ct.CityID = id;
            List<Citytbl> lst = new List<Citytbl>();
            lst = objCityBl.GetCitybyId(ct).ToList();
            StateBL objstatebl = new StateBL();

            foreach (var el in lst)
            {
                hdnCityID.Value = el.CityID.ToString();
                txtCity.Text = el.CityName;

                Statetbl st = new Statetbl();
                st.StateID = el.StateID;
                List<Statetbl> lstst = new List<Statetbl>();
                lstst = objstatebl.GetStateById(st).ToList();
                ddlCountry.SelectedValue = lstst[0].CountryID.ToString();
                GetState(lstst[0].CountryID);
                ddlState.SelectedValue = el.StateID.ToString();
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
            GetCitybyID(id);
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Citytbl ct = new Citytbl();
            ct.CityID = Convert.ToInt32(hdnCityID.Value);
            ct.CityName = txtCity.Text;
            ct.StateID = Convert.ToInt32(ddlState.SelectedValue);
            ct.IsActive = 1;
            ct.UpdatedBy = 1;
            ct.UpdatedDate = DateTime.Now.ToString();
            List<Citytbl> lst = new List<Citytbl>();
            lst = objCityBl.UpdateCity(ct).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('City Updated Successfully');", true);
            Reset();
            GetCity();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void lbtnLEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            GetCitybyID(id);
        }
        protected void gdvcity_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[3].Text) == 1)
                {
                    e.Row.Cells[3].Text = "Active";
                    e.Row.FindControl("lbtnLMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[3].Text) == 0)
                {
                    e.Row.Cells[3].Text = "InActive";
                    e.Row.FindControl("lbtnLMarkAsInActive").Visible = false;
                }

                var lst = lstState;
                var val = lst.OfType<Statetbl>().Where(s => s.StateID == Convert.ToInt32(e.Row.Cells[1].Text));

                e.Row.Cells[1].Text = val.Count() <= 0 ? "" : val.First().StateName;

            }

        }


        protected void lbtnLMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[3].Text;
            Citytbl ct = new Citytbl();
            ct.CityID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                ct.IsActive = 0;
            }
            else if (id == "InActive")
            {
                ct.IsActive = 1;
            }
            objCityBl.UpdateCityIsActive(ct);
            GetCity();
        }
        
    }
}
   