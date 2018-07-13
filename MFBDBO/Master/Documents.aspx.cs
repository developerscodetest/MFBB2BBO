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
    public partial class Documents : System.Web.UI.Page
    {
        CuntryDocumentBL objCuntryDocuBL = new CuntryDocumentBL();
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
                GetCuntryDocu();
            }
        }
        protected void GetCuntryDocu()
        {
            CuntryDocumenttbl ls = new CuntryDocumenttbl();
            List<CuntryDocumenttbl> lst = new List<CuntryDocumenttbl>();
            lst = objCuntryDocuBL.GetAllCuntryDocu(ls).ToList();
            gdvCDocument.DataSource = lst;
            gdvCDocument.DataBind();
            btnUpdate.Visible = false;
        }
        protected void insertCountryDocu()
        {
            CuntryDocumenttbl st = new CuntryDocumenttbl();
            st.DocumentName = txtDName.Text;
            st.CountryID = Convert.ToInt32(DDlCountry.SelectedValue);
            st.IsActive = 1;
            st.CreatedBy = 1;
            st.CreatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");

            List<CuntryDocumenttbl> lst = new List<CuntryDocumenttbl>();
            lst = objCuntryDocuBL.SaveCDocument(st).ToList();
            if (lst[0].Message == "Success")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Document Saved Successfully');", true);
            }
            Reset();
            btnSave.Visible = true;
            GetCuntryDocu();
        }
        protected void btnReset_Click2(object sender, EventArgs e)
        {
            Reset();
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void GetCountry()
        {
            List<Countrytbl> lstCountry = new List<Countrytbl>();
            Countrytbl ctry = new Countrytbl();
            CountryBL objcountryBL = new CountryBL();
            lstCountry = objcountryBL.GetAllCountry(ctry).ToList();
            foreach (var cnt in lstCountry)
            {
                ListItem li = new ListItem();
                li.Text = cnt.CountryName;
                li.Value = cnt.CountryID.ToString();
                DDlCountry.Items.Add(li);
            }
        }
        protected void btnSave_Click1(object sender, EventArgs e)
        {
            insertCountryDocu();
            Reset();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CuntryDocumenttbl st = new CuntryDocumenttbl();
            st.CDocumentId = Convert.ToInt32(hdnCDocumentId.Value);
            st.DocumentName = txtDName.Text;
            st.CountryID = Convert.ToInt32(DDlCountry.SelectedValue);
            st.IsActive = 1;
            st.UpdatedBy = 1;
            st.UpdatedDate = DateTime.Now.ToString(" yyyy-MM-dd HH:mm:ss");
            List<CuntryDocumenttbl> lst = new List<CuntryDocumenttbl>();
            lst = objCuntryDocuBL.UpdateCDocument(st).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Document Updated Successfully');", true);
            Reset();
            GetCuntryDocu();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void Reset()
        {
            DDlCountry.SelectedIndex = 0;
            txtDName.Text = " ";
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
        protected void GetCountryById(int id)
        {
            CuntryDocumenttbl cd = new CuntryDocumenttbl();
            cd.CountryID = id;
            List<CuntryDocumenttbl> lst = new List<CuntryDocumenttbl>();
            lst = objCuntryDocuBL.GetCountryByID(cd).ToList();

            foreach (var el in lst)
            {
                hdnCDocumentId.Value = el.CDocumentId.ToString();
                DDlCountry.SelectedValue = el.CountryID.ToString();
                txtDName.Text = el.DocumentName;
            }
        }
        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);

            CuntryDocumenttbl st = new CuntryDocumenttbl();
            st.CDocumentId = id;
            List<CuntryDocumenttbl> lst = new List<CuntryDocumenttbl>();
            lst = objCuntryDocuBL.GetCDocumentById(st).ToList();

            foreach (var el in lst)
            {
                hdnCDocumentId.Value = el.CDocumentId.ToString();
                DDlCountry.SelectedValue = el.CountryID.ToString();
                txtDName.Text = el.DocumentName;
            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;
     
        }
        protected void lbtnActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var status = gvr.Cells[3].Text;
            CuntryDocumenttbl st = new CuntryDocumenttbl();
            st.CDocumentId = Convert.ToInt32(gvr.Cells[0].Text);
            if (status == "Active")
            {
                st.IsActive = 0;
            }
            else if (status == "InActive")
            {
                st.IsActive = 1;
            }
            objCuntryDocuBL.UpdateCDocumentIsActive(st);
            GetCuntryDocu();
        }
        protected void gdvCDocument_RowDataBound(object sender, GridViewRowEventArgs e)
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