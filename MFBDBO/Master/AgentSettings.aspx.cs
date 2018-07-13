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
    public partial class AgentSettings : System.Web.UI.Page
    {
       RegistrationBL objagBL = new RegistrationBL();
        Agentstbl at = new Agentstbl();
        List<Citytbl> lst = new List<Citytbl>();
        List<Agentstbl> Lag = new List<Agentstbl>();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnUpdate.Visible = false;
                GetAgentName();               
            }
        }
        protected void GetAgentName()
        {  
            Lag = objagBL.GetAllAgents(at).ToList();
            foreach (var cnt in Lag)
            {
                ListItem li = new ListItem();
                li.Text = cnt.AgencyName;          
                li.Value = cnt.AgentID.ToString();
                DDLAgency.Items.Add(li);
            }
        }
        protected void Reset()
        {
            DDLAgency.SelectedIndex = 0;
            DDLPaynow.SelectedIndex = 0;
            DDLCBooking.SelectedIndex = 0;
            DDLORequest.SelectedIndex = 0;
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
           
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Agentstbl st = new Agentstbl();
            st.AgentID = Convert.ToInt32(DDLAgency.SelectedValue);
            st.PayNow = Convert.ToInt32(DDLPaynow.SelectedValue);
            st.ConfirmBooking = Convert.ToInt32(DDLCBooking.SelectedValue);
            st.OfflineRequest = Convert.ToInt32(DDLORequest.SelectedValue);
            st.UpdatedBy = 1;
            st.UpdatedDate= DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            Lag = objagBL.UpdateAgentPayOffineSettings(st).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Agents Updated Successfully');", true);
            btnSave.Visible = false;
            
        }

        protected void DDLAgency_SelectedIndexChanged(object sender, EventArgs e)
        {
            if((DDLAgency.SelectedValue) != "All")
            {
                Lag = objagBL.GetAllAgents(at).ToList();
                var i = DDLAgency.SelectedValue;
                var val = Lag.OfType<Agentstbl>().Where(a => a.AgentID == Convert.ToInt32(i));
                if (Convert.ToInt32(val.Count()) > 0)
                {
                    DDLPaynow.SelectedValue = val.First().PayNow.ToString();
                    DDLCBooking.SelectedValue = val.First().ConfirmBooking.ToString();
                    DDLORequest.SelectedValue = val.First().OfflineRequest.ToString();

                    if (Convert.ToInt32(DDLORequest.SelectedValue) == 0 && Convert.ToInt32(DDLCBooking.SelectedValue) == 0 && Convert.ToInt32(DDLPaynow.SelectedValue) == 0)
                    {
                        btnUpdate.Visible = false;
                        btnSave.Visible = true;
                    }
                    else
                    {
                        btnUpdate.Visible = true;
                        btnSave.Visible = false;
                    }
                }
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Agentstbl st = new Agentstbl();
            st.AgentID = Convert.ToInt32(DDLAgency.SelectedValue);
            st.PayNow = Convert.ToInt32(DDLPaynow.SelectedValue);
            st.ConfirmBooking = Convert.ToInt32(DDLCBooking.SelectedValue);
            st.OfflineRequest = Convert.ToInt32(DDLORequest.SelectedValue);
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            Lag = objagBL.UpdateAgentPayOffineSettings(st).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Agents saved Successfully');", true);
            btnUpdate.Visible = false;
        }
    }
}