using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;

namespace MFBDBO.Master
{
    public partial class AgentsView : System.Web.UI.Page
    {
        RegistrationBL objagBL = new RegistrationBL();
        CountryBL objCountryBL = new CountryBL();
        CityBL objCityBL = new CityBL();
        UserBL objUBl = new UserBL();
        StateBL objSBl = new StateBL();
        EmployeeBL empBL = new EmployeeBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AgentID"].ToString() != null)
                {
                    int AgentID = Convert.ToInt32(Session["AgentID"]);
                    GetAgentsById(AgentID);
                    GetDocuments(AgentID);
                }
            }
        }

        protected void GetAgentsById(int AgentsID)
        {
            Agentstbl at = new Agentstbl
            {
                AgentID = AgentsID
            };

            List<Agentstbl> lstAgents = new List<Agentstbl>();
            lstAgents = objagBL.GetAgentById(at).ToList();


            foreach (var el in lstAgents)
            {
                if (el.CategoryId == 0)
                {
                    lblCN.Text = "B2B";
                }
                else if (el.CategoryId == 1)
                {
                    lblCN.Text = "B2C";
                }
                else if (el.CategoryId == 2)
                {
                    lblCN.Text = "Others";
                }               
                
                lblWeb.Text = el.Website;
                lblAdd.Text = el.Address;
    
                Citytbl ct = new Citytbl();
                ct.CityID = el.CityId;
                var ctval = objCityBL.GetCitybyId(ct);
                lblCt.Text = ctval.Count() <= 0 ? "":ctval.First().CityName;

                Statetbl st = new Statetbl();
                st.StateID = el.StateID;
                var sval = objSBl.GetStateById(st);
                lblSt.Text = sval.Count() <= 0 ? "" : sval.First().StateName;

                Countrytbl cn = new Countrytbl();
                cn.CountryID = Convert.ToInt32(el.CountryId);
                var cval = objCountryBL.GetCountryById(cn);
                lblCntry.Text = cval.Count() <= 0 ? "" : cval.First().CountryName;
                
                Employeetbl emp = new Employeetbl();
                emp.EmpId = Convert.ToInt32(el.MfbStaff);
                var eval = empBL.GetEmployeeById(emp);
                lblEname.Text = eval.Count() <= 0 ? "" : eval.First().FirstName+" "+eval.First().LastName;

                Usertbl ut = new Usertbl();
                ut.LoginUserId = el.AgentID;
                var utval = objUBl.GetAgentExists(ut);
                lblUName.Text = utval.Count()<=0 ?"": utval.First().Username;
                lblPWord.Text = utval.Count() <= 0 ? "" : utval.First().Password;        
              
                if (el.IATAStatus == 1)
                {
                    lblIATAS.Text = "Yes";
                }
                else if (el.IATAStatus == 2)
                {
                    lblIATAS.Text = "NO";
                }

                lblAgencyName.Text = el.AgencyName;
                lblFN.Text = el.FirstName;
                lblLName.Text = el.LastName;
               
                lblAdd.Text = el.Address;
                lblRBy.Text = el.ReferredBy;
                lblIATARNo.Text = el.IATARegNo;
                lblAC.Text = el.AgencyCode;
                lblAEmail.Text = el.AgencyEmail;
                lblTN.Text = el.MobileNo;
                lblPC.Text = el.PreferredCurrency;
                lblPin.Text = el.Pincode.ToString();
                txtCommission1.Text = el.Commission;
              
                lblACName.Text = el.AccountsName;
                lblACEmail.Text = el.AccountsEmail;
                lblACPhoneNumber.Text = el.AccountsMobileNo;
                lblOPName.Text = el.OperationsName;
                lblOPEmail1.Text = el.OperationsEmail;
                lblOPPhoneNumber.Text = el.OperationsMobileNo;
                lblMNName.Text = el.ManagementsName;
                lblMNEmail.Text = el.ManagementsEmail;
                lblMNPhoneNumber.Text = el.ManagementsMobileNo;
                hdnAgentID.Value = el.AgentID.ToString();

            }
        }

       
        protected void GetDocuments(int AgentId)
        {
            AgentDocumentstbl Agd = new AgentDocumentstbl();
            
            Agd.AgentId = AgentId;
            List<AgentDocumentstbl> lgd = new List<AgentDocumentstbl>();
            lgd = objagBL.GetAgentDocuAgentID(Agd).ToList();
            int ind = 1;
            LiteralControl lc = new LiteralControl();
            foreach (var el in lgd)
            {
                lc.Text += "<div class='form-group row'>" +
                                "<div class='col-md-6 col-lg-6 col-sm-12 col-xs-12'>" +
                                    "<asp:Label ID = 'lblSNo' class='control-label col-md-1' runat='server' Text='Document Name'><span style = 'font-size:18px;' > " + ind + ". </span>" +
                                      "</asp:Label>" +
                                    "<asp:Label ID = 'lblDName' class='control-label col-md-4' runat='server' Text='Document Name'><span style = 'font-size:18px;' > " + el.DocumentName + " </span>" +
                                     "</asp:Label>" +
                                    "<div class='col-md-6'>" +
                                        "<a href='../Files/AgentDocuments/"+el.FileName+ "' class='btn btn-success' download>Download</a>" +
                                     
                                    "</div>" +
                                "</div>" +
                            "</div>";
                ind++;
                mydoc.Controls.Add(lc);
            }
            
        }

       

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiveAgents.aspx");
        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            Agentstbl Agn = new Agentstbl();
            Agn.AgentID = Convert.ToInt32(hdnAgentID.Value);

            Agn.Commission = txtCommission1.Text;
            Agn.UpdatedBy = 1;
            Agn.UpdatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");
            List<Agentstbl> lst = new List<Agentstbl>();
            lst = objagBL.UpdateAgentCommission(Agn).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Agent Updated Successfully');", true);
            GetDocuments(Convert.ToInt32(hdnAgentID.Value));
        }
    }
}