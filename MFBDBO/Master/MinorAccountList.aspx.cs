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
    public partial class MinorAccountList : System.Web.UI.Page
    {
        MinorAccountBL objMinorAccountBL = new MinorAccountBL();

        MajorAccounttbl mct = new MajorAccounttbl();
        List<MajorAccounttbl> lstMajorAccount = new List<MajorAccounttbl>();

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        //List<MajorAccounttbl> lstMajorAccount = new List<MajorAccounttbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            lstMajorAccount = objMajorAccountBL.GetAllAccounts(mct).ToList();
            if (!IsPostBack)
            {
                GetAllMinorAccount();
                GetAllAccountsMajorActive();
                //GetAllAccounts();
            }
        }

        protected void GetAllMinorAccount()
        {
            MinorAccounttbl ls = new MinorAccounttbl();
            List<MinorAccounttbl> lst = new List<MinorAccounttbl>();
            lst = objMinorAccountBL.GetAllMinorAccount(ls).ToList();
            gdvMinorAccount.DataSource = lst;
            gdvMinorAccount.DataBind();
            btnUpdate.Visible = false;
        }

        protected void GetAllAccountsMajorActive()
        {            
            MajorAccounttbl matl = new MajorAccounttbl();
            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            matl.Status = 1;
            lstMajorAccount = objMajorAccountBL.GetAccountsByStatus(matl).ToList();
            DdlMajorAccount.Items.Clear();

            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            DdlMajorAccount.Items.Add(l);
            foreach (var cnt in lstMajorAccount)
            {
                ListItem li = new ListItem();
                li.Text = cnt.MajorAccountName.ToString();
                li.Value = cnt.MajorAccountID.ToString();                      
                DdlMajorAccount.Items.Add(li);
            }
        }

        protected void GetAllAccounts()
        {
            MajorAccounttbl matl = new MajorAccounttbl();
            MajorAccountBL objMajorAccountBL = new MajorAccountBL();
            //matl.Status = 1;
            lstMajorAccount = objMajorAccountBL.GetAllAccounts(matl).ToList();
            DdlMajorAccount.Items.Clear();
            ListItem l = new ListItem();
            l.Text = "--Select--";
            l.Value = 0.ToString();
            DdlMajorAccount.Items.Add(l);
            foreach (var cnt in lstMajorAccount)
            {
                ListItem li = new ListItem();
                li.Text = cnt.MajorAccountName.ToString();
                li.Value = cnt.MajorAccountID.ToString();
                DdlMajorAccount.Items.Add(li);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            MinorAccounttbl ma = new MinorAccounttbl();
            ma.MinorAccountName = txtMinorAccount.Text;
            ma.MinorAccountCode =string.IsNullOrEmpty(txtMinorAccountCode.Text) ? 0 : Convert.ToInt32(txtMinorAccountCode.Text);
            ma.MajorAccountID = Convert.ToInt32(DdlMajorAccount.SelectedValue);
            ma.Amount = string.IsNullOrEmpty(txtAmount.Text) ? 0 : Convert.ToInt32(txtAmount.Text);
            ma.Status = 1;
            ma.CreatedBy = 1;
            ma.CreatedDate = DateTime.Now.ToString("yyyy-MM-dd");           

            List<MinorAccounttbl> lst = new List<MinorAccounttbl>();
            lst = objMinorAccountBL.SaveMinorAccount(ma).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Minor Account Saved Successfully');", true); 
            Clear();
            GetAllMinorAccount();        
            DdlMajorAccount.SelectedIndex = 0;
            //Response.Redirect("MinorAccountList.aspx");
        }        

        protected void Clear()
        {
            DdlMajorAccount.SelectedIndex = 0;
            txtMinorAccount.Text = string.Empty;
            txtMinorAccountCode.Text = string.Empty;
            txtAmount.Text = string.Empty;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
            DdlMajorAccount.Items.Clear();
            GetAllAccountsMajorActive();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            MinorAccounttbl ma = new MinorAccounttbl();
            ma.MinorAccountID = Convert.ToInt32(hdnMinorAccountID.Value);
            ma.MinorAccountName = txtMinorAccount.Text;
            ma.MinorAccountCode = Convert.ToInt32(txtMinorAccountCode.Text);
            ma.MajorAccountID = Convert.ToInt32(DdlMajorAccount.SelectedValue);
            //ma.Amount = Convert.ToInt32(txtAmount.Text);
           // ma.Status = 1;
            ma.UpdatedBy = 1;
            ma.UpdatedDate = DateTime.Now.ToString("yyyy-MM-dd");

            List<MinorAccounttbl> lst = new List<MinorAccounttbl>();
            lst = objMinorAccountBL.UpdateMinorAccount(ma).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('MinorAccount Updated Successfully');", true);
            Clear();

            btnUpdate.Visible = false;
            btnSave.Visible = true;
            GetAllMinorAccount();
            GetAllAccountsMajorActive();
        }
        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            GetAllAccounts();
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);

            MinorAccounttbl ma = new MinorAccounttbl();
            ma.MinorAccountID = id;
            List<MinorAccounttbl> lst = new List<MinorAccounttbl>();
            lst = objMinorAccountBL.GetMinorAccountById(ma).ToList();

            foreach (var el in lst)
            {
                hdnMinorAccountID.Value = el.MinorAccountID.ToString();
                DdlMajorAccount.SelectedValue = el.MajorAccountID.ToString();
                txtMinorAccount.Text = el.MinorAccountName;
                txtMinorAccountCode.Text = el.MinorAccountCode.ToString();
                txtAmount.Text = el.Amount.ToString();
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
            //GetState();
            //GetAllAccounts();
        }
        protected void Reset()
        {
            Clear();
            btnUpdate.Visible = false;
            btnSave.Visible = true;          
        }
        protected void lbtnActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var status = gvr.Cells[5].Text;
            MinorAccounttbl ma = new MinorAccounttbl();
            ma.MinorAccountID = Convert.ToInt32(gvr.Cells[0].Text);
            if (status == "Active")
            {
                ma.Status = 0;
            }
            else if (status == "InActive")
            {
                ma.Status = 1;
            }
            objMinorAccountBL.UpdateMinorAccountIsActive(ma);
           GetAllMinorAccount();
        }
        protected void gdvMinorAccount_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[5].Text) == 1)
                {
                    e.Row.Cells[5].Text = "Active";
                    e.Row.FindControl("lbtnCMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[5].Text) == 0)
                {
                    e.Row.Cells[5].Text = "InActive";
                    e.Row.FindControl("lbtnCMarkAsInActive").Visible = false;
                }
                var lst = lstMajorAccount;
                var res = lst.OfType<MajorAccounttbl>().Where(s => s.MajorAccountID == Convert.ToInt32(e.Row.Cells[1].Text));         
                       
                e.Row.Cells[1].Text = res.Count() <= 0 ? "" : res.First().MajorAccountName;

            }
        }        

    }
}