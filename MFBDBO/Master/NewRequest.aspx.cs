using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MFBDBO.Business;
using MySql.Data.MySqlClient;
using MFBDBO.Data;
using System.Web.UI.HtmlControls;

namespace MFBDBO.Master
{
    public partial class NewRequest : System.Web.UI.Page
    {

        //static int i = 0;
        BookingRequestBL objBookReqBL = new BookingRequestBL();

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        //protected void Page_PreInt(object sender, EventArgs e)
        //{
        //    DdlAdult(1);
        //    DdlChild(1);
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAgents();
                ViewState["count"] = 1;
            }
            //if (i > 0)
            //{
            //    btnRemove.Visible = true;
            //}
            //else
            //{
            //    btnRemove.Visible = false;
            //}
        }

        //protected override void OnLoad(EventArgs e)
        //{
        //    base.OnLoad(e);
            
        //}
        protected void GetAgents()
        {
            Agentstbl ags = new Agentstbl();
            List<Agentstbl> lstags = new List<Agentstbl>();
            RegistrationBL objRegBL = new RegistrationBL();
            lstags = objRegBL.GetAllAgents(ags).ToList();
            ddlAgency.Items.Clear();
            ddlAgency.Items.Add(new ListItem("--Select--","0"));
            foreach (var ag in lstags)
            {
                ddlAgency.Items.Add(new ListItem(ag.AgencyName,ag.AgentID.ToString()));
            }
        }
        protected void InsertBookingRequest()
        {
            BookingRequesttbl Br = new BookingRequesttbl();
            List<BookingReqGuestDetailstbl> lstbd = new List<BookingReqGuestDetailstbl>();
            
            Br.AgentId = ddlAgency.SelectedValue == "" ? 0 : Convert.ToInt32(ddlAgency.SelectedValue);
            Br.Destination = txtDest.Text;
            Br.Checkin = Convert.ToDateTime(txtCheckInDate.Text).ToString("yyyy-MM-dd HH:mm:ss");
            Br.Checkout = Convert.ToDateTime(txtCheckOutDate.Text).ToString("yyyy-MM-dd HH:mm:ss");
            Br.Nationality = ddlNationality.SelectedValue;
            Br.MobileNumber = 123;
            Br.EmailID = "abc@mgail.com";
            Br.PreferedHotels = txtPH.Text;
            Br.SightSeeing = ddlSightSeeing.SelectedValue;
            Br.IsActive = 1;
            Br.CreatedBy = 1;
            Br.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            if (Convert.ToInt32(ddlAdult.SelectedValue) >= 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.Salutation = ddlAdultSalutation1.SelectedItem.Text;
                brg.FirstName = txtAdultFN1.Text;
                brg.LastName = txtAdultLN1.Text;
                brg.Type = "A";
                brg.Status = 1;
                brg.CreatedBy = 1;
                brg.RoomNo = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);
            }
            if (Convert.ToInt32(ddlAdult.SelectedValue) > 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.Salutation = ddlAdultSalutation2.SelectedItem.Text;
                brg.FirstName = txtAdultFN2.Text;
                brg.LastName = txtAdultLN2.Text;               
                brg.Type = "A";
                brg.Status = 1;
                brg.RoomNo = 1;
                brg.CreatedBy = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);

            }

            if (Convert.ToInt32(ddlChild.SelectedValue) >= 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.Age = ddlChildAge1.SelectedValue;
                brg.FirstName = txtChildFName1.Text;
                brg.LastName = txtChildLName1.Text;               
                brg.Type = "K";
                brg.Status = 1;
                brg.CreatedBy = 1;
                brg.RoomNo = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);
            }
            if (Convert.ToInt32(ddlChild.SelectedValue) > 1)
            {
                BookingReqGuestDetailstbl brg = new BookingReqGuestDetailstbl();
                brg.Age = ddlChildAge2.SelectedValue;
                brg.FirstName = txtChildFName2.Text;
                brg.LastName = txtChildLName2.Text;          
                brg.Type = "K";
                brg.Status = 1;
                brg.RoomNo = 1;
                brg.CreatedBy = 1;
                brg.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                lstbd.Add(brg);
            }
            
        


            //TextBox txtAlt = Master.FindControl("AdminPlaceHolder").FindControl("txtAdultFN11") as TextBox;

            //DropDownList d = (DropDownList)FindControl("AdminPlaceHolder_ddlSal11");
            //string message = "";
            //foreach (TextBox textBox in ctrlPlaceholder.Controls.OfType<TextBox>())
            //{
            //    message += textBox.ID + ": " + textBox.Text + "\\n";
            //}
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);

            //for (int i = 0; i< Convert.ToInt32(ddlAdult.SelectedValue); i++)
            //{
            //    BookingReqGuestDetailstbl BdA = new BookingReqGuestDetailstbl();

            //    string ddl = i == 0 ? "AdminPlaceHolder_ddlAdult1" + 1 : "AdminPlaceHolder_ddlAdult1" + i + 1;

            //    DropDownList ddlas = (DropDownList)ctrlPlaceholder.FindControl("ddlAdult11");
            //    TextBox txtaf = (TextBox)ctrlPlaceholder.FindControl("txtAdultFN1" + i + 1);
            //    TextBox txtal = (TextBox)ctrlPlaceholder.FindControl("txtAdultLN1" + i + 1);

            //    BdA.RoomNo = 1;
            //    BdA.Salutation = "Mr";
            //    BdA.FirstName = "Ravi";
            //    BdA.LastName = "Kumar";
            //    BdA.Age = "20";
            //    BdA.Type = "A";
            //    BdA.Status = 1;
            //    BdA.CreatedBy = 1;
            //    BdA.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //    lstbd.Add(BdA);

            //    //BdA.RoomNo = 1;
            //    //BdA.Salutation = ddlas.SelectedValue;
            //    //BdA.FirstName = txtaf.Text;
            //    //BdA.LastName = txtal.Text;                
            //    //BdA.Type = "A";
            //    //BdA.Status = 1;
            //    //BdA.CreatedBy = 1;
            //    //BdA.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //    //lstbd.Add(BdA);
            //}
            //for (int j = 0; j < Convert.ToInt32(ddlChild.SelectedValue); j++)
            //{
            //    BookingReqGuestDetailstbl BdC = new BookingReqGuestDetailstbl();

            //    DropDownList ddlca = (DropDownList)ctrlPlaceholder.FindControl("ddlChild1" + j + 1);
            //    TextBox txtcf = (TextBox)ctrlPlaceholder.FindControl("txtChildFN1" + j + 1);
            //    TextBox txtcl = (TextBox)ctrlPlaceholder.FindControl("txtChildLN1" + j + 1);

            //    BdC.RoomNo = 1;                
            //    BdC.FirstName = txtcf.Text;
            //    BdC.LastName = txtcl.Text;
            //    BdC.Age = ddlca.SelectedValue;
            //    BdC.Type = "K";
            //    BdC.Status = 1;
            //    BdC.CreatedBy = 1;
            //    BdC.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //    lstbd.Add(BdC);
            //}
            //Br.GuestDetails = lstbd;


            //Bd.RoomNo = 1;
            //Bd.Salutation = "Mr";
            //Bd.FirstName = "Ravi";
            //Bd.LastName = "Kumar";
            //Bd.Age = "20";
            //Bd.Type = "A";
            //Bd.Status = 1;
            //Bd.CreatedBy = 1;
            //Bd.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            Br.GuestDetails = lstbd;
            List<BookingRequesttbl> lstbrd = new List<BookingRequesttbl>();
            lstbrd = objBookReqBL.InsertRequest(Br).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnSubmit.Visible = true;

            Response.Redirect("OfflineRequests.aspx");

        }

        ////protected int GetCountry(int id)
        //{
        //    List<Countrytbl> lstCountry = new List<Countrytbl>();
        //    Countrytbl ctry = new Countrytbl();
        //    CountryBL objcountryBL = new CountryBL();
        //    lstCountry = objcountryBL.GetCountryById(ctry).ToList();
        //    foreach (var el in  lstCountry)
        //    {
        //        ctry.CountryID = el.CountryID;
             
        //    }
        //    return ctry.CountryID;
        //}

        //protected void InsertBookingRequest()
        //{

        //    BookingRequesttbl Br = new BookingRequesttbl();
        //    BookingReqGuestDetailstbl Bd = new BookingReqGuestDetailstbl();
        //    BookingGuestDetails Bgd = new BookingGuestDetails();
        //    Br.AgentId = Convert.ToInt32(ddlAgency.SelectedValue);
        //    Br.Destination = txtDest.Text;
        //    Br.Checkin = txtCheckInDate.Text;
        //    Br.Checkout = txtCheckOutDate.Text;
        //    Br.Nationality = (ddlNationality.SelectedValue);
        //    Br.PreferedHotels = txtPH.Text;
        //    Br.SightSeeing = ddlSightSeeing.SelectedValue;
        //    Bd.RoomNo = 1;
        //    Bd.Salutation = "Mr";
        //    Bd.FirstName = "Ravi";
        //    Bd.LastName = "Kumar";
        //    Bd.Age = "20";
        //    Bd.Type = "A";
        //    Bd.Status = 1;
        //    Bd.CreatedBy = 1;
        //    Bd.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        //    List<BookingRequesttbl> BR = new List<BookingRequesttbl>();
        //    BR = objBookReqBL.InsertRequest(Br, Bd).ToList();
        //    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Updated Successfully');", true);
        //    btnSubmit.Visible = true;

        //}
        protected void Reset()
        {
            ddlAgency.SelectedIndex = 0;
            txtDest.Text = "";
            txtCheckInDate.Text = "";
            txtCheckOutDate.Text = "";
            ddlNationality.SelectedIndex = 0;
            ddlSightSeeing.SelectedIndex = 0;
            txtPH.Text = "";

        }
        //protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlAdult_SelectedIndexChanged(sender, e);
        //    ddlChild_SelectedIndexChanged(sender, e);
        //    ddlAdult2_SelectedIndexChanged(sender, e);
        //    ddlChild2_SelectedIndexChanged(sender, e);
        //   //lnkDynamic.Click += new EventHandler(lnkDynamic_Click);
        //}

        //DropDownList ddlAdult2 = new DropDownList();
        //DropDownList ddlChild2 = new DropDownList();

        protected void ddlAdult_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlAdult(1);
            //BtnAdd(0);
        }

        protected void ddlChild_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlAdultonly(1);
            DdlChild(1);
            //BtnAdd(0);
        }
        //protected void ddlAdult2_SelectedIndexChanged(object sender, EventArgs e)
        //{            
        //    DdlAdult(2);
        //}
        //protected void ddlChild2_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    DdlAdultonly(2);
        //    DdlChild(2);
        //}

        //protected Label myLabel(Label ID, string LabelText)
        //{
        //    ID = new Label();
        //    ID.Text = "<b>"+ LabelText + "</b>";
        //    ID.CssClass = "control-label";            
        //    return ID;
        //}
        protected void DdlAdult(int Room)
        {
            if (ddlAdult.SelectedValue != "--Select--")
            {
                ddlChild.Items.Clear();
                ListItem li = new ListItem();
                li.Text = "--Select--";
                ddlChild.Items.Add(li);
                for (int i = 1; i <= 6 - Convert.ToInt32(ddlAdult.SelectedValue); i++)
                {
                    ListItem lic = new ListItem();
                    lic.Text = i.ToString();
                    ddlChild.Items.Add(lic);
                }
                for (int loopcnt = 1; loopcnt <= Convert.ToInt32(ddlAdult.SelectedValue.Trim()); loopcnt++)
                {

                    Label lblSal = new Label();
                    lblSal.Text = "<b>Salutation</b>";
                    lblSal.CssClass = "control-label";
                    lblSal.ID = "lblSal" + Room + loopcnt;


                    DropDownList ddlsal = new DropDownList();
                    ddlsal.ID = "ddlSal" + Room + loopcnt;
                    ddlsal.CssClass = "form-control";
                    ddlsal.Items.Add("-select");
                    ddlsal.Items.Add("Mr");
                    ddlsal.Items.Add("Mrs");

                    HtmlGenericControl divsal = new HtmlGenericControl("div");
                    divsal.ID = "divsal" + Room + loopcnt;
                    divsal.Attributes.Add("class", "form-group col-md-3");
                    divsal.Controls.Add(lblSal);
                    divsal.Controls.Add(ddlsal);
                    ctrlPlaceholder.Controls.Add(divsal);

                    Label lblFN = new Label();
                    lblFN.Text = "<b>FirstName</b>";
                    lblFN.CssClass = "control-label";
                    lblFN.ID = "lblFN" + Room + loopcnt;

                    TextBox txtFN = new TextBox();
                    txtFN.ID = "txtAdultFN" + Room + loopcnt;
                    txtFN.CssClass = "form-control";
                    txtFN.EnableViewState = true;

                    HtmlGenericControl divfn = new HtmlGenericControl("div");
                    divfn.ID = "divAdultfn" + Room + loopcnt;
                    divfn.Attributes.Add("class", "form-group col-md-5");
                    divfn.Controls.Add(lblFN);
                    divfn.Controls.Add(txtFN);
                    ctrlPlaceholder.Controls.Add(divfn);

                    Label lblLN = new Label();
                    lblLN.Text = "<b>LastName</b>";
                    lblLN.CssClass = "control-label";
                    lblLN.ID = "lblLN" + Room + loopcnt;

                    TextBox txtLN = new TextBox();
                    txtLN.ID = "txtAdultLN" + Room + loopcnt;
                    txtLN.CssClass = "form-control";
                    txtLN.EnableViewState = true;

                    HtmlGenericControl divls = new HtmlGenericControl("div");
                    divls.ID = "divAdultln" + Room + loopcnt;
                    divls.Attributes.Add("class", "form-group col-md-4");
                    divls.Controls.Add(lblLN);
                    divls.Controls.Add(txtLN);
                    ctrlPlaceholder.Controls.Add(divls);
                }
            }

        }
        protected void DdlAdultonly(int Room)
        {
            if (ddlAdult.SelectedValue != "--Select--" && ddlChild.SelectedValue != "--Select--")
            {
                for (int loopcnt = 1; loopcnt <= Convert.ToInt32(ddlAdult.SelectedValue.Trim()); loopcnt++)
                {
                    Label lblsal = new Label();
                    lblsal.Text = "<b>Salutation</b>";
                    lblsal.CssClass = "control-label";
                    lblsal.ID = "lblSal" + Room + loopcnt;

                    DropDownList ddlsal = new DropDownList();
                    ddlsal.ID = "ddlSal" + Room + loopcnt;
                    ddlsal.CssClass = "form-control";
                    ddlsal.Items.Add("-select");
                    ddlsal.Items.Add("Mr");
                    ddlsal.Items.Add("Mrs");

                    HtmlGenericControl divsal = new HtmlGenericControl("div");
                    divsal.ID = "divsal" + Room + loopcnt;
                    divsal.Attributes.Add("class", "form-group col-md-3");
                    divsal.Controls.Add(lblsal);
                    divsal.Controls.Add(ddlsal);
                    ctrlPlaceholder.Controls.Add(divsal);

                    Label lblFN = new Label();
                    lblFN.Text = "<b>FirstName</b>";
                    lblFN.CssClass = "control-label";
                    lblFN.ID = "lblFN" + Room + loopcnt;

                    TextBox txtFN = new TextBox();
                    txtFN.ID = "txtAdultFN" + Room + loopcnt;
                    txtFN.CssClass = "form-control";
                    txtFN.EnableViewState = true;

                    HtmlGenericControl divfn = new HtmlGenericControl("div");
                    divfn.ID = "divAdultfn" + Room + loopcnt;
                    divfn.Attributes.Add("class", "form-group col-md-5");
                    divfn.Controls.Add(lblFN);
                    divfn.Controls.Add(txtFN);
                    ctrlPlaceholder.Controls.Add(divfn);

                    Label lblLN = new Label();
                    lblLN.Text = "<b>LastName</b>";
                    lblLN.CssClass = "control-label";
                    lblLN.ID = "lblLN" + Room + loopcnt;

                    TextBox txtLN = new TextBox();
                    txtLN.ID = "txtAdultLN" + Room + loopcnt;
                    txtLN.CssClass = "form-control";
                    txtLN.EnableViewState = true;

                    HtmlGenericControl divls = new HtmlGenericControl("div");
                    divls.ID = "divAdultln" + Room + loopcnt;
                    divls.Attributes.Add("class", "form-group col-md-4");
                    divls.Controls.Add(lblLN);
                    divls.Controls.Add(txtLN);
                    ctrlPlaceholder.Controls.Add(divls);

                }
            }
            else if (ddlAdult.SelectedValue != "--Select--")
            {
                ddlChild.Items.Clear();
                ListItem li = new ListItem();
                li.Text = "--Select--";
                ddlChild.Items.Add(li);
                for (int i = 1; i <= 6 - Convert.ToInt32(ddlAdult.SelectedValue); i++)
                {
                    ListItem lic = new ListItem();
                    lic.Text = i.ToString();
                    ddlChild.Items.Add(lic);
                }
                for (int loopcnt = 1; loopcnt <= Convert.ToInt32(ddlAdult.SelectedValue.Trim()); loopcnt++)
                {

                    Label lblsal = new Label();
                    lblsal.Text = "<b>Salutation</b>";
                    lblsal.CssClass = "control-label";
                    lblsal.ID = "lblSal" + Room + loopcnt;

                    DropDownList ddlsal = new DropDownList();
                    ddlsal.ID = "ddlSal" + Room + loopcnt;
                    ddlsal.CssClass = "form-control";
                    ddlsal.Items.Add("-select");
                    ddlsal.Items.Add("Mr");
                    ddlsal.Items.Add("Mrs");

                    HtmlGenericControl divsal = new HtmlGenericControl("div");
                    divsal.ID = "divsal" + Room + loopcnt;
                    divsal.Attributes.Add("class", "form-group col-md-3");
                    divsal.Controls.Add(lblsal);
                    divsal.Controls.Add(ddlsal);
                    ctrlPlaceholder.Controls.Add(divsal);

                    Label lblFN = new Label();
                    lblFN.Text = "<b>FirstName</b>";
                    lblFN.CssClass = "control-label";
                    lblFN.ID = "lblFN" + Room + loopcnt;

                    TextBox txtFN = new TextBox();
                    txtFN.ID = "txtAdultFN" + Room + loopcnt;
                    txtFN.CssClass = "form-control";
                    txtFN.EnableViewState = true;

                    HtmlGenericControl divfn = new HtmlGenericControl("div");
                    divfn.ID = "divAdultfn" + Room + loopcnt;
                    divfn.Attributes.Add("class", "form-group col-md-5");
                    divfn.Controls.Add(lblFN);
                    divfn.Controls.Add(txtFN);
                    ctrlPlaceholder.Controls.Add(divfn);

                    Label lblLN = new Label();
                    lblLN.Text = "<b>LastName</b>";
                    lblLN.CssClass = "control-label";
                    lblLN.ID = "lblLN" + Room + loopcnt;

                    TextBox txtLN = new TextBox();
                    txtLN.ID = "txtAdultLN" + Room + loopcnt;
                    txtLN.CssClass = "form-control";
                    txtLN.EnableViewState = true;

                    HtmlGenericControl divls = new HtmlGenericControl("div");
                    divls.ID = "divAdultln" + Room + loopcnt;
                    divls.Attributes.Add("class", "form-group col-md-4");
                    divls.Controls.Add(lblLN);
                    divls.Controls.Add(txtLN);
                    ctrlPlaceholder.Controls.Add(divls);

                }
            }


        }
        protected void DdlChild(int Room)
        {

            if (ddlChild.SelectedValue != "--Select--")
            {
                for (int loopcnt = 1; loopcnt <= Convert.ToInt32(ddlChild.SelectedValue.Trim()); loopcnt++)
                {
                    Label lblAge = new Label();
                    lblAge.Text = "<b>Age</b>";
                    lblAge.CssClass = "control-label";
                    lblAge.ID = "lblAge" + Room + loopcnt;

                    DropDownList ddlAge = new DropDownList();
                    ddlAge.ID = "ddlAge" + Room + loopcnt;
                    ddlAge.CssClass = "form-control";
                    ddlAge.Items.Add("-Select-");
                    ddlAge.Items.Add("1");
                    ddlAge.Items.Add("2");
                    ddlAge.Items.Add("3");
                    ddlAge.Items.Add("4");
                    ddlAge.Items.Add("5");
                    ddlAge.Items.Add("6");
                    ddlAge.Items.Add("7");
                    ddlAge.Items.Add("8");
                    ddlAge.Items.Add("9");
                    ddlAge.Items.Add("10");
                    ddlAge.Items.Add("11");
                    ddlAge.Items.Add("12");

                    HtmlGenericControl divage = new HtmlGenericControl("div");
                    divage.ID = "divage" + Room + loopcnt;
                    divage.Attributes.Add("class", "form-group col-md-3");
                    divage.Controls.Add(lblAge);
                    divage.Controls.Add(ddlAge);
                    CtrlPlaceHolder2.Controls.Add(divage);

                    Label lblFNC = new Label();
                    lblFNC.Text = "<b>FirstName</b>";
                    lblFNC.CssClass = "control-label";
                    lblFNC.ID = "lblFNC" + Room + loopcnt;

                    TextBox txtFNC = new TextBox();
                    txtFNC.ID = "txtChileFN" + Room + loopcnt;
                    txtFNC.EnableViewState = true;
                    txtFNC.CssClass = "form-control";

                    HtmlGenericControl divfnc = new HtmlGenericControl("div");
                    divfnc.ID = "divfnc" + Room + loopcnt;
                    divfnc.Attributes.Add("class", "form-group col-md-5");
                    divfnc.Controls.Add(lblFNC);
                    divfnc.Controls.Add(txtFNC);
                    CtrlPlaceHolder2.Controls.Add(divfnc);

                    Label lblLNC = new Label();
                    lblLNC.Text = "<b>LastName</b>";
                    lblLNC.CssClass = "control-label";
                    lblLNC.ID = "lblLNC" + Room + loopcnt;

                    TextBox txtLNC = new TextBox();
                    txtLNC.ID = "txtChildLN" + Room + loopcnt;
                    txtLNC.EnableViewState = true;
                    txtLNC.CssClass = "form-control";

                    HtmlGenericControl divlnc = new HtmlGenericControl("div");
                    divlnc.ID = "divlnc" + Room + loopcnt;
                    divlnc.Attributes.Add("class", "form-group col-md-4");
                    divlnc.Controls.Add(lblLNC);
                    divlnc.Controls.Add(txtLNC);
                    CtrlPlaceHolder2.Controls.Add(divlnc);
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertBookingRequest();
            Reset();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Reset();
        }

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    BtnAdd(1);            
        //}

        //protected void BtnAdd(int Opt)
        //{
        //    if(Opt == 1)
        //    {
        //        i++;
        //    } else if(Opt == 2)
        //    {
        //        i--;
        //    }
        //    if (i > 0)
        //    {
        //        btnRemove.Visible = true;
        //    }
        //    else
        //    {
        //        btnRemove.Visible = false;
        //    }
        //    for (int j = 0; j < i; j++)
        //    {
        //        var Room = j + 2;
        //        Label lblRoom = new Label();
        //        lblRoom.Text = "<b>Room " + Room + ":</b>";
        //        lblRoom.CssClass = "control-label";
        //        lblRoom.EnableViewState = true;
        //        lblRoom.ID = "lblRoom" + Room;

        //        HtmlGenericControl divgRoom = new HtmlGenericControl("div");
        //        divgRoom.Attributes.Add("class", "form-group");
        //        divgRoom.Attributes.Add("style", "margin: 20px 30px;");
        //        divgRoom.Controls.Add(lblRoom);
        //        divgRoom.EnableViewState = true;
        //        divgRoom.ID = "divgRoom" + Room;

        //        HtmlGenericControl divRoom = new HtmlGenericControl("div");
        //        divRoom.Attributes.Add("class", "col-md-2");
        //        divRoom.Controls.Add(divgRoom);
        //        divRoom.EnableViewState = true;
        //        divRoom.ID = "divRoom" + Room;

        //        Label lblAdult2 = new Label();
        //        lblAdult2.Text = "<b>Adult</b>";
        //        lblAdult2.CssClass = "control-label";
        //        lblAdult2.EnableViewState = true;
        //        lblAdult2.ID = "lblAdult2" + Room;

        //        DropDownList ddlAdult2 = new DropDownList();
        //        ddlAdult2.CssClass = "form-control";
        //        ddlAdult2.AutoPostBack = true;
        //        ddlAdult2.SelectedIndexChanged += new EventHandler(ddlAdult2_SelectedIndexChanged);
        //        ddlAdult2.EnableViewState = true;
        //        ddlAdult2.Items.Add("-select");
        //        ddlAdult2.Items.Add("1");
        //        ddlAdult2.Items.Add("2");
        //        ddlAdult2.Items.Add("3");
        //        ddlAdult2.Items.Add("4");
        //        ddlAdult2.Items.Add("5");
        //        ddlAdult2.Items.Add("6");
        //        ddlAdult2.ID = "ddlAdult2" + Room;

        //        HtmlGenericControl divgAdult = new HtmlGenericControl("div");
        //        divgAdult.Attributes.Add("class", "form-group col-md-12");
        //        divgAdult.Controls.Add(lblAdult2);
        //        divgAdult.Controls.Add(ddlAdult2);
        //        divgAdult.EnableViewState = true;
        //        divgAdult.ID = "divgAdult" + Room;

        //        HtmlGenericControl divAdult = new HtmlGenericControl("div");
        //        divAdult.Attributes.Add("class", "col-md-5");
        //        divAdult.Controls.Add(divgAdult);
        //        divAdult.EnableViewState = true;
        //        divAdult.ID = "divAdult" + Room;

        //        Label lblchild2 = new Label();
        //        lblchild2.Text = "<b>Child</b>";
        //        lblchild2.CssClass = "control-label";
        //        lblchild2.EnableViewState = true;
        //        lblchild2.ID = "lblchild2" + Room;

        //        DropDownList ddlChild2 = new DropDownList();
        //        ddlChild2.CssClass = "form-control";
        //        // ddlChild2.SelectedIndexChanged += ddlChild2_SelectedIndexChanged;
        //        ddlChild2.SelectedIndexChanged += new EventHandler(ddlChild2_SelectedIndexChanged);
        //        ddlChild2.AutoPostBack = true;
        //        ddlChild2.EnableViewState = true;
        //        ddlChild2.Items.Add("-select");
        //        ddlChild2.Items.Add("1");
        //        ddlChild2.Items.Add("2");
        //        ddlChild2.Items.Add("3");
        //        ddlChild2.Items.Add("4");
        //        ddlChild2.Items.Add("5");
        //        ddlChild2.Items.Add("6");
        //        ddlChild2.ID = "ddlChild2" + Room;


        //        HtmlGenericControl divgChild = new HtmlGenericControl("div");
        //        divgChild.Attributes.Add("class", "form-group col-md-12");
        //        divgChild.Controls.Add(lblchild2);
        //        divgChild.Controls.Add(ddlChild2);
        //        divgChild.EnableViewState = true;
        //        divgChild.ID = "divgChild" + Room;

        //        HtmlGenericControl divChild = new HtmlGenericControl("div");
        //        divChild.Attributes.Add("class", "col-md-5");
        //        divChild.Controls.Add(divgChild);
        //        divChild.EnableViewState = true;
        //        divChild.ID = "divChild" + Room;

        //        HtmlGenericControl divrow = new HtmlGenericControl("div");
        //        divrow.Attributes.Add("class", "row");
        //        divrow.Controls.Add(divRoom);
        //        divrow.Controls.Add(divAdult);
        //        divrow.Controls.Add(divChild);
        //        divrow.EnableViewState = true;
        //        divrow.ID = "divrow" + Room;

        //        CtrlPlaceHolder3.Controls.Add(divrow);
        //        CtrlPlaceHolder3.EnableViewState = true;
        //    }

        //}

        //protected void btnRemove_Click(object sender, EventArgs e)
        //{            
        //    BtnAdd(2);
        //}
    }
  }
