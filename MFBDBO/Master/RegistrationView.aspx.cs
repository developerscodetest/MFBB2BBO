using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Business;
using MFBDBO.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace MFBDBO.Master
{
    public partial class RegistrationView : System.Web.UI.Page
    {
        int i = 0;
        RegistrationBL objRegBL = new RegistrationBL();
        Agentstbl at = new Agentstbl();
        CountryBL objCountryBL = new CountryBL();
        StateBL objStateBL = new StateBL();
        CityBL objCityBL = new CityBL();
        UserBL objuserBL = new UserBL();     
   
        List<Agentstbl> lst = new List<Agentstbl>();
        List<AgentDocumentstbl> lstdoc = new List<AgentDocumentstbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AgencyID"].ToString() != null)
                {
                    int AgencyID = Convert.ToInt32(Session["AgencyID"]);
                    GetAgencyById(AgencyID);
                }
            }
        }
        protected void GetAgencyById(int AgencyID)
        {
            Agentstbl agt = new Agentstbl
            {
                AgentID = AgencyID
            };

            List<Agentstbl> lstAgency = new List<Agentstbl>();
            lstAgency = objRegBL.GetAgentById(agt).ToList();

            foreach (var el in lstAgency)
            {
               hdnAgentID.Value = el.AgentID.ToString();
                lblAgencyName.Text = el.AgencyName;
                lblAEmail.Text = el.AgencyEmail;              
                lblTN.Text = el.MobileNo;
              
                if (el.CategoryId == 0)
                {
                    lblCategory1.Text = "B2B";
                }
                else if (el.CategoryId == 1)
                {
                    lblCategory1.Text = "B2C";
                }
                else if (el.CategoryId == 2)
                {
                    lblCategory1.Text = "Others";
                }
         
                if (el.IATAStatus == 1)
                {
                    lblIATAS.Text = "Yes";
                }
                else if (el.IATAStatus == 2)
                {
                    lblIATAS.Text = "No";
                }
                

                lblRN.Text = el.IATARegNo;
                lblWeb.Text = el.Website;
                lblFN.Text = el.FirstName;
                lblLN.Text = el.LastName;
                lblAddress1.Text = el.Address;
                                 
                Citytbl ct = new Citytbl();
                ct.CityID = el.CityId;
                var ctval = objCityBL.GetCitybyId(ct);
                lblCt.Text =ctval.Count()<=0?"": ctval.First().CityName;

                Statetbl st = new Statetbl();
                st.StateID = el.StateID;
                var sval = objStateBL.GetStateById(st);
                lblSt.Text = sval.Count() <= 0 ? "" : sval.First().StateName;

                Countrytbl cn = new Countrytbl();
                cn.CountryID = Convert.ToInt32(el.CountryId);
                var cval = objCountryBL.GetCountryById(cn);
                lblCntry.Text = cval.First().CountryName;

                lblPCode.Text = el.Pincode.ToString();
                lblPCurrency1.Text = el.PreferredCurrency;
                lblRBy.Text = el.ReferredBy;
                lblAcName.Text = el.AccountsName;
                lblAcEmail.Text = el.AccountsEmail;
                lblAcPhoneNumber.Text = el.AccountsMobileNo;
                lblmnName2.Text = el.ManagementsName;
                lblmnEmail2.Text = el.ManagementsEmail; 
                lblmnPhoneNumber2.Text = el.ManagementsMobileNo;
                lblopName1.Text = el.OperationsName;
                lblopEmail1.Text = el.OperationsEmail;
                lblopPhoneNumber1.Text = el.OperationsMobileNo;


                List<Employeetbl> lstEmployee = new List<Employeetbl>();
                Employeetbl Emply = new Employeetbl();
                EmployeeBL objemplyBL = new EmployeeBL();
                Emply.IsActive = 1;
                lstEmployee = objemplyBL.GetEmployeeByStatus(Emply).ToList();
                foreach (var cnt in lstEmployee)
                {
                    ListItem li = new ListItem();
                    li.Text = cnt.FirstName+" "+cnt.LastName;
                    li.Value = cnt.EmpId.ToString();
                    ddlEmployee.Items.Add(li);
                }





            }
        }
        protected void InsertDoc(int ind)
        {
            AgentDocumentstbl ad = new AgentDocumentstbl();
            ad.AgentId = Convert.ToInt32(hdnAgentID.Value);             
            ad.DocumentName = txtDocumentName0.Text;
            ad.FileName = UploadDoc0.FileName;
            ad.IsActive = 1;
            ad.CreatedBy = 1;
            ad.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            lstdoc = objRegBL.InsertAgentDocu(ad).ToList();


            //AgentDocumentstbl ad1 = new AgentDocumentstbl();
            //ad1.AgentId = Convert.ToInt32(hdnAgentID.Value);
            //ad1.DocumentName = txtDocumentName0.Text;
            //ad1.FileName = UploadDoc0.FileName;
            //ad1.IsActive = 1;
            //ad1.CreatedBy = 1;
            //ad1.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //lstdoc = objRegBL.InsertAgentDocu(ad1).ToList();
        }
        protected void UpdateStatus()
        {
            Agentstbl at = new Agentstbl();
            at.AgentID = Convert.ToInt32(hdnAgentID.Value);
            at.AgencyCode = "MFB" + at.AgentID;
            at.UserName = lblAEmail.Text;
            at.Password = System.Web.Security.Membership.GeneratePassword(6, 2);
            at.Status = 1;
            at.IsActive = 1;
            
            List<Agentstbl> lst = new List<Agentstbl>();
            lst = objRegBL.UpdateAgentIsActive(at).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Agent Approved Updated Successfully');", true);
            Response.Redirect("Registration.aspx");
            btnReject.Visible = false;
        }
        protected void InsertUser()
        {
            Usertbl us = new Usertbl();
            us.LoginUserId =Convert.ToInt32(hdnAgentID.Value);
            us.RoleID = 1;          
            us.Username= lblAEmail.Text;
            us.Password = System.Web.Security.Membership.GeneratePassword(6, 1);
            us.Status = 1;
            us.IsActive = 1;
            us.CreatedBy = 1;
            us.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            List<Usertbl> lstus = new List<Usertbl>();
            lstus = objuserBL.InsertUsers(us).ToList();
        }

        protected void UploadFile()
        {
            string folderPath = Server.MapPath("~/Files/AgentDocuments/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            UploadDoc0.SaveAs(folderPath + Path.GetFileName(UploadDoc0.FileName));

            ////Display the success message.
            //lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded.";
        }


       

       

        protected void UpdateAgentCode()
        {
            Agentstbl at = new Agentstbl();
            at.AgentID = Convert.ToInt32(hdnAgentID.Value);
            at.AgencyCode = "MFB" + at.AgentID;
            at.MfbStaff = ddlEmployee.SelectedValue;
            List<Agentstbl> agl = new List<Agentstbl>();
           
            agl = objRegBL.UpdateAgentCode(at).ToList();
        }

        protected void btnApprove_Click1(object sender, EventArgs e)
        {

            {
                InsertDoc(i);
                i++;
            }
            InsertUser();
            UploadFile();
            btnApprove.Visible = false;
            UpdateAgentCode();
            UpdateStatus();
            Response.Redirect("ActiveAgents.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void btnReject_Click1(object sender, EventArgs e)
        {
            Agentstbl at = new Agentstbl();
            at.AgentID = Convert.ToInt32(hdnAgentID.Value);
            at.Status = 0;
            //   at.IsActive = 1;
            List<Agentstbl> lst = new List<Agentstbl>();
            lst = objRegBL.UpdateAgentStatus(at).ToList();

            Response.Redirect("Registrations.aspx");

            btnReject.Visible = false;
        }


        //protected void btnAdd_Click(object sender, EventArgs e)
        //{

        //    Label lblDocument = new Label();
        //    lblDocument.Text = "<b>Document Name</b>";
        //    lblDocument.CssClass = "control-label";

        //    TextBox txtDName = new TextBox();
        //    txtDName.Attributes.Add("placeholder", "Enter Document Name");
        //    txtDName.CssClass = "form-control";
        //    txtDName.EnableViewState = true;
        //    txtDName.ID = "txtDName1";
        //    //txtDName.Name = "DocumentName_" + (count + 1);

        //    //TextBox txtDName = new TextBox();
        //    //count = panel1.Controls.OfType<TextBox>().ToList().Count;
        //    //txtDName.Location = new System.Drawing.Point(60, 25 * count);
        //    //textbox.Size = new System.Drawing.Size(80, 20);
        //    //textbox.Name = "textbox_" + (count + 1);
        //    //textbox.TextChanged += new System.EventHandler(this.TextBox_Changed);
        //    //panel1.Controls.Add(textbox);

        //    HtmlGenericControl divfn = new HtmlGenericControl("div");
        //    divfn.Attributes.Add("class", "col-md-5 col-lg-5 col-sm-12 col-xs-12");
        //    divfn.Controls.Add(lblDocument);
        //    divfn.Controls.Add(txtDName);

        //    Label lblUploadFile = new Label();
        //    lblUploadFile.Text = "<b>Choose File</b>";
        //    lblUploadFile.CssClass = "control-label";

        //    FileUpload txtUFile = new FileUpload();
        //    txtUFile.CssClass = "form-control";
        //    txtUFile.ID = "UploadDoc1";

        //    HtmlGenericControl divbn = new HtmlGenericControl("div");
        //    divbn.Attributes.Add("class", "col-md-5 col-lg-5 col-sm-12 col-xs-12");
        //    divbn.Controls.Add(lblUploadFile);
        //    divbn.Controls.Add(txtUFile);

        //    Button btnRemove = new Button();
        //    btnRemove.CssClass = "bth btn-danger";
        //    btnRemove.Text = "Remove";
        //    btnRemove.EnableViewState = true;
        //    btnRemove.Height = 30;
        //    btnRemove.Width = 80;
        //    btnRemove.CausesValidation = false;
        //    //btnRemove.Click += new EventHandler(btnRemove_click);

        //    HtmlGenericControl divbtn = new HtmlGenericControl("div");
        //    divbtn.Attributes.Add("class", "col-md-2");
        //    divbtn.Attributes.Add("style", "margin-top: 25px;");
        //    divbtn.Controls.Add(btnRemove);

        //    HtmlGenericControl divUn = new HtmlGenericControl("div");
        //    divUn.Attributes.Add("class", "form-group row");
        //    divUn.Controls.Add(divfn);
        //    divUn.Controls.Add(divbn);
        //    divUn.Controls.Add(divbtn);

        //    HtmlGenericControl divMain = new HtmlGenericControl("div");
        //    divMain.Attributes.Add("class", "box-body");
        //    divMain.Controls.Add(divUn);
        //    ctrPlaceholder2.Controls.Add(divMain);

        //}

    }
}