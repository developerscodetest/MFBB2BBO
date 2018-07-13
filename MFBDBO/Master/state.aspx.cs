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
    public partial class state : System.Web.UI.Page
    {
        
        StateBL objStateBL = new StateBL();
        Countrytbl cnt = new Countrytbl();
        List<Countrytbl> lstCountry = new List<Countrytbl>();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            CountryBL objCountryBL = new CountryBL();
            lstCountry = objCountryBL.GetAllCountry(cnt).ToList();
            if (!IsPostBack)
            {
                GetCountry();
                GetState();
            }
        }
        protected void GetState()
        {
            Statetbl ls = new Statetbl();
            List<Statetbl> lst = new List<Statetbl>();
            lst = objStateBL.GetAllState(ls).ToList();
            gdvState.DataSource = lst;
            gdvState.DataBind();
            btnUpdate.Visible = false;
        }
        protected void insertState()
        {
            Statetbl st = new Statetbl();
            st.StateName = txtState.Text;
            st.CountryID = Convert.ToInt32(DDlCountry.SelectedValue);
            st.IsActive = 1;
            st.CreatedBy = 1;
            st.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString();

            List<Statetbl> lst = new List<Statetbl>();
            lst = objStateBL.SaveState(st).ToList();
            if (lst[0].Message == "Success")
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('State Saved Successfully');", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('State Saved Successfully');", true);
                //Response.Redirect("state.aspx");
            }
            Clear();
            GetState();
            
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
            btnSave.Visible = true;
            //btnUpdate.Visible = false;
        }

        protected void Clear()
        {
            DDlCountry.SelectedIndex = 0;
            txtState.Text = string.Empty;
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
                DDlCountry.Items.Add(li);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            insertState();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Statetbl st = new Statetbl();
            st.StateID = Convert.ToInt32(hdnStateID.Value);
            st.StateName = txtState.Text;
            st.CountryID = Convert.ToInt32(DDlCountry.SelectedValue);
            st.IsActive = 1;
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<Statetbl> lst = new List<Statetbl>();
            lst = objStateBL.UpdateState(st).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('State Updated Successfully');", true);
            Reset();

            btnUpdate.Visible = false;
            btnSave.Visible = true;
            GetState();
        }
        protected void Reset()
        {
            DDlCountry.SelectedIndex = 0;
            txtState.Text = " ";
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void btnReset_Click1(object sender, EventArgs e)
        {
            Reset();
        }
        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);

            Statetbl st = new Statetbl();
            st.StateID = id;
            List<Statetbl> lst = new List<Statetbl>();
            lst = objStateBL.GetStateById(st).ToList();

            foreach (var el in lst)
            {
                hdnStateID.Value = el.StateID.ToString();
                DDlCountry.SelectedValue = el.CountryID.ToString();
                txtState.Text = el.StateName;
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
            //GetState();
        }
        protected void lbtnActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var status = gvr.Cells[3].Text;
            Statetbl st = new Statetbl();
            st.StateID = Convert.ToInt32(gvr.Cells[0].Text);
            if(status == "Active")
            {
                st.IsActive = 0;
            }
            else if(status == "InActive")
            {
                st.IsActive = 1;
            }
            objStateBL.UpdateStateIsActive(st);
            GetState();
        }
        protected void gdvState_RowDataBound(object sender, GridViewRowEventArgs e)
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
                var lst = lstCountry;
                var res = lst.OfType<Countrytbl>().Where(s => s.CountryID == Convert.ToInt32(e.Row.Cells[1].Text));
                e.Row.Cells[1].Text = res.Count() <= 0 ? "" : res.First().CountryName;

            }
        }
    }
}