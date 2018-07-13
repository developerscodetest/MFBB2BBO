using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using MFBDBO.Business;
using MFBDBO.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace MFBDBO.Master.Controls
{
    public partial class DynamicRoom : System.Web.UI.UserControl
    {
        static int i = 0;
        BookingRequestBL objBookReqBL = new BookingRequestBL();

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
            if (i > 0)
            {
                btnRemove.Visible = true;
            }
            else
            {
                btnRemove.Visible = false;
            }
        }
       
        protected void ddlAdult_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlAdult(1);
        }

        protected void ddlChild_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlAdultonly(1);
            DdlChild(1);
        }
        protected Label myLabel(Label ID, string LabelText)
        {
            ID = new Label();
            ID.Text = "<b>" + LabelText + "</b>";
            ID.CssClass = "control-label";
            return ID;
        }
        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAdult_SelectedIndexChanged(sender, e);
            ddlChild_SelectedIndexChanged(sender, e);
            //ddlAdult2_SelectedIndexChanged(sender, e);
            //ddlChild2_SelectedIndexChanged(sender, e);
            //lnkDynamic.Click += new EventHandler(lnkDynamic_Click);
        }

        DropDownList ddlAdult2 = new DropDownList();
        DropDownList ddlChild2 = new DropDownList();












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
                    ddlsal.ID = "ddlAdult" + Room + loopcnt;
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
                    ddlsal.ID = "ddlAdult" + Room + loopcnt;
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
                    ddlsal.ID = "ddlAdult" + Room + loopcnt;
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
                    ddlAge.ID = "ddlChild" + Room + loopcnt;
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

        protected void BtnAdd(int Opt)
        {
            if (Opt == 1)
            {
                i++;
            }
            else if (Opt == 2)
            {
                i--;
            }
            if (i > 0)
            {
                btnRemove.Visible = true;
            }
            else
            {
                btnRemove.Visible = false;
            }
            for (int j = 0; j < i; j++)
            {
                var Room = j + 2;
                Label lblRoom = new Label();
                lblRoom.Text = "<b>Room " + Room + ":</b>";
                lblRoom.CssClass = "control-label";
                lblRoom.EnableViewState = true;
                lblRoom.ID = "lblRoom" + Room;

                HtmlGenericControl divgRoom = new HtmlGenericControl("div");
                divgRoom.Attributes.Add("class", "form-group");
                divgRoom.Attributes.Add("style", "margin: 20px 30px;");
                divgRoom.Controls.Add(lblRoom);
                divgRoom.EnableViewState = true;
                divgRoom.ID = "divgRoom" + Room;

                HtmlGenericControl divRoom = new HtmlGenericControl("div");
                divRoom.Attributes.Add("class", "col-md-2");
                divRoom.Controls.Add(divgRoom);
                divRoom.EnableViewState = true;
                divRoom.ID = "divRoom" + Room;

                Label lblAdult2 = new Label();
                lblAdult2.Text = "<b>Adult</b>";
                lblAdult2.CssClass = "control-label";
                lblAdult2.EnableViewState = true;
                lblAdult2.ID = "lblAdult2" + Room;

                DropDownList ddlAdult2 = new DropDownList();
                ddlAdult2.CssClass = "form-control";
                ddlAdult2.AutoPostBack = true;
               // ddlAdult2.SelectedIndexChanged += new EventHandler(ddlAdult2_SelectedIndexChanged);
                ddlAdult2.EnableViewState = true;
                ddlAdult2.Items.Add("-select");
                ddlAdult2.Items.Add("1");
                ddlAdult2.Items.Add("2");
                ddlAdult2.Items.Add("3");
                ddlAdult2.Items.Add("4");
                ddlAdult2.Items.Add("5");
                ddlAdult2.Items.Add("6");
                ddlAdult2.ID = "ddlAdult2" + Room;

                HtmlGenericControl divgAdult = new HtmlGenericControl("div");
                divgAdult.Attributes.Add("class", "form-group col-md-12");
                divgAdult.Controls.Add(lblAdult2);
                divgAdult.Controls.Add(ddlAdult2);
                divgAdult.EnableViewState = true;
                divgAdult.ID = "divgAdult" + Room;

                HtmlGenericControl divAdult = new HtmlGenericControl("div");
                divAdult.Attributes.Add("class", "col-md-5");
                divAdult.Controls.Add(divgAdult);
                divAdult.EnableViewState = true;
                divAdult.ID = "divAdult" + Room;

                Label lblchild2 = new Label();
                lblchild2.Text = "<b>Child</b>";
                lblchild2.CssClass = "control-label";
                lblchild2.EnableViewState = true;
                lblchild2.ID = "lblchild2" + Room;

                DropDownList ddlChild2 = new DropDownList();
                ddlChild2.CssClass = "form-control";
                // ddlChild2.SelectedIndexChanged += ddlChild2_SelectedIndexChanged;
              //  ddlChild2.SelectedIndexChanged += new EventHandler(ddlChild2_SelectedIndexChanged);
                ddlChild2.AutoPostBack = true;
                ddlChild2.EnableViewState = true;
                ddlChild2.Items.Add("-select");
                ddlChild2.Items.Add("1");
                ddlChild2.Items.Add("2");
                ddlChild2.Items.Add("3");
                ddlChild2.Items.Add("4");
                ddlChild2.Items.Add("5");
                ddlChild2.Items.Add("6");
                ddlChild2.ID = "ddlChild2" + Room;


                HtmlGenericControl divgChild = new HtmlGenericControl("div");
                divgChild.Attributes.Add("class", "form-group col-md-12");
                divgChild.Controls.Add(lblchild2);
                divgChild.Controls.Add(ddlChild2);
                divgChild.EnableViewState = true;
                divgChild.ID = "divgChild" + Room;

                HtmlGenericControl divChild = new HtmlGenericControl("div");
                divChild.Attributes.Add("class", "col-md-5");
                divChild.Controls.Add(divgChild);
                divChild.EnableViewState = true;
                divChild.ID = "divChild" + Room;

                HtmlGenericControl divrow = new HtmlGenericControl("div");
                divrow.Attributes.Add("class", "row");
                divrow.Controls.Add(divRoom);
                divrow.Controls.Add(divAdult);
                divrow.Controls.Add(divChild);
                divrow.EnableViewState = true;
                divrow.ID = "divrow" + Room;

                CtrlPlaceHolder3.Controls.Add(divrow);
                CtrlPlaceHolder3.EnableViewState = true;
            }

        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            BtnAdd(1);
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            BtnAdd(2);
        }
    }
}