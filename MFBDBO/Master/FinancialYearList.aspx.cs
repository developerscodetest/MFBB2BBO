using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using MFBDBO.Data;
using MFBDBO.Business;
using System.Globalization;

namespace MFBDBO.Master
{
    public partial class FinancialYearList : System.Web.UI.Page
    {

        DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        FinancialYearListBL objFinanceBL = new FinancialYearListBL();
        List<FinancialYearListtbl> lfa = new List<FinancialYearListtbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                GetYear();                
                GetMonth();
                GetFinancial();
            }
        }
        protected void GetYear()
        {
            for(int i = DateTime.Now.Year; i < DateTime.Now.Year + 10; i++)
            {                
                ddlFromYear.Items.Add(new ListItem(i.ToString()));
                ddlToYear.Items.Add(new ListItem((i + 1).ToString()));
            }
        }       
        protected void GetMonth()
        {
            
            for (int i = 1; i < 13; i++)
            {                
                ddlFromMonth.Items.Add(new ListItem(info.GetMonthName(i).ToString(), i.ToString()));
                ddlToMonth.Items.Add(new ListItem(info.GetMonthName(i).ToString(), i.ToString()));
            }
        }
        protected void GetFinanceById(int id)
        {
            FinancialYearListtbl fa = new FinancialYearListtbl();
            fa.FyID = Convert.ToInt32(id.ToString());
            List<FinancialYearListtbl> lfa = new List<FinancialYearListtbl>();
            lfa = objFinanceBL.GetFinancebyId(fa).ToList();

            foreach (var el in lfa)
            {
                hdnFyID.Value = Convert.ToString(el.FyID);
                hdnStatus.Value = el.Status.ToString();

                ddlFromYear.SelectedValue = el.FromYear;
                ddlToYear.SelectedValue = el.ToYear;
                ddlFromMonth.SelectedValue = el.FromMonth;
                ddlToMonth.SelectedValue = el.ToMonth;
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;

        }
        protected void GetFinancial()
        {
            FinancialYearListtbl fa = new FinancialYearListtbl();
            List<FinancialYearListtbl> lst = new List<FinancialYearListtbl>();
            lst = objFinanceBL.GetAllFinancial(fa).ToList();
            gdvFinancial.DataSource = lst;
            gdvFinancial.DataBind();
            btnSave.Visible = true;
            btnUpdate.Visible = false;

        }
        protected void InsertFinancial()
        {
            FinancialYearListtbl fa = new FinancialYearListtbl();
            fa.FromYear = ddlFromYear.SelectedValue;
            fa.ToYear = ddlToYear.SelectedValue;
            fa.FromMonth = ddlFromMonth.SelectedValue;
            fa.ToMonth = ddlToMonth.SelectedValue;
            fa.Status = 1;
            fa.CreatedBy = 1;
            fa.CreatedDate = DateTime.Now.ToString();
            fa.UpdatedBy = 1;
            fa.UpdatedDate = DateTime.Now.ToString();
            lfa = objFinanceBL.InsertFinancialList(fa).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            btnSave.Visible = true;
            GetFinancial();
            Reset();
        }
        protected void updateFinancial()
        {
            FinancialYearListtbl fa = new FinancialYearListtbl();
            fa.FyID = Convert.ToInt32(hdnFyID.Value);
            fa.FromYear = ddlFromYear.SelectedValue;
            fa.ToYear = ddlToYear.SelectedValue;
            fa.FromMonth = ddlFromMonth.SelectedValue;
            fa.ToMonth = ddlToMonth.SelectedValue;
            fa.Status = Convert.ToInt32(hdnStatus.Value);
            fa.CreatedBy = 1;
            fa.CreatedDate = DateTime.Now.ToString();
            fa.UpdatedBy = 1;
            fa.UpdatedDate = DateTime.Now.ToString();

            lfa = objFinanceBL.UpdateFinancialList(fa).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Accounts Updated Successfully');", true);

            GetFinancial();
            Reset();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void Reset()
        {
            ddlFromYear.SelectedIndex = 0;
            ddlToYear.SelectedIndex = 0;
            ddlFromMonth.SelectedIndex = 0;
            ddlToMonth.SelectedIndex = 0;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertFinancial();
            Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateFinancial();
        }
        protected void lbtnLEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            GetFinanceById(id);
        }
        protected void lbtnLMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[5].Text;
            FinancialYearListtbl fa = new FinancialYearListtbl();
            fa.FyID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                fa.Status = 0;
            }
            else if (id == "InActive")
            {
                fa.Status = 1;
            }
            objFinanceBL.UpdateFinancialListIsActive(fa);
            GetFinancial();
        }

       
            protected void gdvFinancial_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = info.GetMonthName(Convert.ToInt32(e.Row.Cells[3].Text)) + ' ' + e.Row.Cells[1].Text + '-' + info.GetMonthName(Convert.ToInt32(e.Row.Cells[4].Text)) + ' ' + e.Row.Cells[2].Text;
                
            }
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[5].Text) == 1)
                {
                    e.Row.Cells[5].Text = "Active";
                    e.Row.FindControl("lbtnLMarkAsActive").Visible = false;
                }
                else if (Convert.ToInt32(e.Row.Cells[5].Text) == 0)
                {
                    e.Row.Cells[5].Text = "InActive";
                    e.Row.FindControl("lbtnLMarkAsInActive").Visible = false;
                }

            }
        }



    }
}