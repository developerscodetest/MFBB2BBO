using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MFBDBO.Data;
using MFBDBO.Business;
using MySql.Data.MySqlClient;



namespace MFBDBO.Master
{
    public partial class MajorAccountList : System.Web.UI.Page
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        MajorAccountBL objAccountBL = new MajorAccountBL();
        List<MajorAccounttbl> lma = new List<MajorAccounttbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetAccounts();
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertAccounts();
            Reset();
        }

     protected void GetAccountsById(int id)
        {
            MajorAccounttbl ma = new MajorAccounttbl();
            ma.MajorAccountID = Convert.ToInt32(id.ToString());
            List<MajorAccounttbl> lma = new List<MajorAccounttbl>();
            lma = objAccountBL.GetAccountsbyId(ma).ToList();

            foreach (var el in lma)
            {
                hdnMajorAccountID.Value = Convert.ToString(el.MajorAccountID);
                hdnStatus.Value = el.Status.ToString(); 
                TxtMAName.Text = el.MajorAccountName;
                txtMACode.Text = el.MajorAccountCode.ToString();
               
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;

        }

        protected void GetAccounts()
        {
            MajorAccounttbl ma = new MajorAccounttbl();
            List<MajorAccounttbl> lst = new List<MajorAccounttbl>();
            lst = objAccountBL.GetAllAccounts(ma).ToList();
            gdvAccount.DataSource = lst;
            gdvAccount.DataBind();
            btnSave.Visible = true;
            btnUpdate.Visible = false;

        }
        protected void InsertAccounts()
        {
            MajorAccounttbl ma = new MajorAccounttbl();
            ma.MajorAccountName = TxtMAName.Text;
            //  dr["UserID"] == DBNull.Value ? 0 : Convert.ToInt32(dr["UserID"]),
            ma.MajorAccountCode = txtMACode.Text ==""? 0 : Convert.ToInt32(txtMACode.Text);
        //    ma.Status = 1;
            ma.CreatedBy = 1;
            ma.CreatedDate = DateTime.Now.ToString();
            ma.UpdatedBy = 1;
            ma.UpdatedDate = DateTime.Now.ToString();
            lma = objAccountBL.InsertAccounts(ma).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnSave.Visible = true;
            GetAccounts();
            Reset();
        }
        protected void updateAccounts()
        {
            MajorAccounttbl ma = new MajorAccounttbl();
            ma.MajorAccountID = Convert.ToInt32(hdnMajorAccountID.Value);
            ma.MajorAccountName = TxtMAName.Text;
            ma.MajorAccountCode = Convert.ToInt32(txtMACode.Text);
            ma.Status = Convert.ToInt32(hdnStatus.Value);
            ma.CreatedBy = 1;
            ma.CreatedDate = DateTime.Now.ToString();
            ma.UpdatedBy = 1;
            ma.UpdatedDate = DateTime.Now.ToString();
           
            lma = objAccountBL.UpdateAccounts(ma).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Accounts Updated Successfully');", true);
           
            GetAccounts();
            Reset();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void Reset()
        {
            TxtMAName.Text = " ";
            txtMACode.Text = " ";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
        protected void lbtnLEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            GetAccountsById(id);
        }
        protected void lbtnLMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[3].Text;
            MajorAccounttbl ma = new MajorAccounttbl();
            ma.MajorAccountID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                ma.Status = 0;
            }
            else if (id == "InActive")
            {
                ma.Status = 1;
            }
            objAccountBL.UpdateAccountIsActive(ma);
            GetAccounts();
        }

        protected void gdvAccount_RowDataBound(object sender, GridViewRowEventArgs e)
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

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateAccounts();
        }
    }
}