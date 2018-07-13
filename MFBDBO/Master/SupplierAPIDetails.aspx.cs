using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MFBDBO.Data;
using MFBDBO.Business;

namespace MFBDBO.Master
{
    public partial class SupplierAPIDetails : System.Web.UI.Page
    {
        SupplierAPIBL objsupAPIBL = new SupplierAPIBL();
        SupplierAPItbl sa = new SupplierAPItbl();
        List<SupplierAPItbl> lstSupAPI = new List<SupplierAPItbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            btnUpdate.Visible = true;
            GetSupplier();
        }
        protected void GetSupplier()
        {
            List<Supplierstbl> lstSupplier = new List<Supplierstbl>();
            Supplierstbl sup = new Supplierstbl();
            SuppliersBL objsupBL = new SuppliersBL();
            sup.IsActive = 1;
            lstSupplier = objsupBL.GetSuppliersByStatus(sup).ToList();
            foreach (var cnt in lstSupplier)
            {
                ListItem li = new ListItem();
                li.Text = cnt.Supplier;
                li.Value = cnt.SupplierID.ToString();
                ddlSupplierID.Items.Add(li);
            }
        }




        protected void InsertSupplierAPI()
        {
            SupplierAPItbl sa = new SupplierAPItbl();
            sa.SupplierId =Convert.ToInt32(ddlSupplierID.SelectedValue);
            sa.APILink = txtAPILink.Text;
            sa.APIKey = txtAPIKey.Text;
            sa.Username = txtUsername.Text;
            sa.Password = txtPassword.Text;
            sa.Description = txtDescription.Text;
           
            lstSupAPI = objsupAPIBL.InsertSupAPI(sa).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
           btnUpdate.Visible = false;
            btnSave.Visible = true;

            Reset();

        }
        protected void UpdateSupplierAPI()
        {
            sa.SupplierId= Convert.ToInt32(ddlSupplierID.SelectedValue);
            sa.APILink = txtAPILink.Text;
            sa.APIKey = txtAPIKey.Text;
            sa.Username = txtUsername.Text;
            sa.Password = txtPassword.Text;
            sa.Description = txtDescription.Text;
            lstSupAPI = objsupAPIBL.UpdateSupAPI(sa).ToList();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Accounts Updated Successfully');", true);
            Reset();
            
          btnUpdate.Visible = false;
            btnSave.Visible = true;
            GetSupplier();
        }
        protected void Reset()
        {
            ddlSupplierID.SelectedIndex = 0;
            txtAPILink.Text = "";
            txtAPIKey.Text = "";
            txtUsername.Text = "";
            txtPassword.Text="";
            txtDescription.Text = "";
        }
        protected void GetSupplierAPIById(int id)
        {
            SupplierAPItbl sa = new SupplierAPItbl();
            sa.SupplierAPIId = Convert.ToInt32(id.ToString());
            List<SupplierAPItbl> lsa = new List<SupplierAPItbl>();
            lsa = objsupAPIBL.GetSupAPIbyId(sa).ToList();

            foreach (var el in lsa)
            {
                hdnSupplierAPIId.Value = Convert.ToString(el.SupplierAPIId);
                ddlSupplierID.SelectedValue = el.SupplierId.ToString();
                txtAPILink.Text = el.APILink;
                txtAPIKey.Text = el.APIKey;
                txtUsername.Text = el.Username;
                txtPassword.Text = el.Password;
                txtDescription.Text = el.Description;
           

            }
            btnSave.Visible = false;
            btnUpdate.Visible = true;

        }











        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertSupplierAPI();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateSupplierAPI();
        }
    }
}