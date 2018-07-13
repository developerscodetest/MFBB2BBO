using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class Registrations : System.Web.UI.Page
    {
        RegistrationBL objagBL = new RegistrationBL();
        CityBL objCityBL = new CityBL();

        Agentstbl cnt = new Agentstbl();
        List<Agentstbl> lstAgent = new List<Agentstbl>();
        List<Citytbl> lst = new List<Citytbl>();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCity();
            if (!IsPostBack)
            {                
                GetAgency();
                GetAgencyReject();
            }
        }
        protected void GetAgency()
        {
            Agentstbl agt = new Agentstbl();
            List<Agentstbl> lstAgent = new List<Agentstbl>();
            RegistrationBL objagBL= new RegistrationBL();
            agt.IsActive = 0;
            agt.Status = 1;
            lstAgent = objagBL.GetRejAgents(agt).ToList();
            if (lstAgent.Count() >= 1)
            {
               gdvRegistration.DataSource = lstAgent;
                gdvRegistration.DataBind();
             
            }
            else
            {
                DataTable dt = new DataTable();
                gdvRegistration.DataSource = dt;
                gdvRegistration.DataBind();
            }
            
        }
        protected void GetAgencyReject()
        {
            Agentstbl agt = new Agentstbl();
            List<Agentstbl> lstAgent = new List<Agentstbl>();
            RegistrationBL objagBL = new RegistrationBL();
            agt.IsActive = 0;
            agt.Status = 0;
            lstAgent = objagBL.GetRejAgents(agt).ToList();
            if (lst.Count() >= 1)
            {
                gdvReject.DataSource = lstAgent;
                gdvReject.DataBind();

            }
            else
            {
                DataTable dt = new DataTable();
                gdvReject.DataSource = dt;
                gdvReject.DataBind();
            }

        }
        protected void lbtnSView_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var AgencyID = Convert.ToInt32(gvr.Cells[0].Text);
            Session["AgencyID"] = AgencyID;
            Response.Redirect("RegistrationView.aspx");
        }
        protected void GetCity()
        {
            Citytbl ct = new Citytbl();            
            lst = objCityBL.GetCityWithColumns(ct).ToList();       
        }
        protected void lbtnSMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[7].Text;
            Agentstbl st = new Agentstbl();
            st.AgentID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                st.IsActive = 0;
            }
            else if (id == "InActive")
            {
                st.IsActive = 1;
            }
            objagBL.UpdateAgentIsActive(st);
            GetAgency();
        }
        protected void gdvRegistration_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var l = lst;
                var val = l.OfType<Citytbl>().Where(s => s.CityID == Convert.ToInt32(e.Row.Cells[5].Text));
                e.Row.Cells[5].Text =val.Count()<=0?"": val.First().CityName;

                if (Convert.ToInt32(e.Row.Cells[6].Text) == 1)
                {
                    e.Row.Cells[6].Text = "B2B";                    
                }
                else if (Convert.ToInt32(e.Row.Cells[6].Text) == 2)
                {
                    e.Row.Cells[6].Text = "B2C";                    
                }
                else if (Convert.ToInt32(e.Row.Cells[6].Text) == 3)
                {
                    e.Row.Cells[6].Text = "Others";                    
                }
            }
        
            //if (e.Row.Cells[7].Text == "1")
            //{
            //    e.Row.Cells[7].Text = "Active";
            //    e.Row.FindControl("lbtnSMarkAsActive").Visible = false;
            //}
            //else if (e.Row.Cells[7].Text == "0")
            //{
            //    e.Row.Cells[7].Text = "InActive";
            //    e.Row.FindControl("lbtnSMarkAsInActive").Visible = false;
            //}
            //var l = lst;
            //var val = l.OfType<Citytbl>().Where(s => s.CityID == Convert.ToInt32(e.Row.Cells[5].Text));
            //e.Row.Cells[5].Text = val.First().CityName;

        }

        protected void gdvReject_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var l = lst;
                var val = l.OfType<Citytbl>().Where(s => s.CityID == Convert.ToInt32(e.Row.Cells[5].Text));
                e.Row.Cells[5].Text = val.Count() <= 0 ? "" : val.First().CityName;

                if (Convert.ToInt32(e.Row.Cells[6].Text) == 1)
                {
                    e.Row.Cells[6].Text = "B2B";
                }
                else if (Convert.ToInt32(e.Row.Cells[6].Text) == 2)
                {
                    e.Row.Cells[6].Text = "B2C";
                }
                else if (Convert.ToInt32(e.Row.Cells[6].Text) == 3)
                {
                    e.Row.Cells[6].Text = "Others";
                }
            }

        }
    }
}