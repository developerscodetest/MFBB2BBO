using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFBDBO.Data;
using MFBDBO.Business;
using MySql.Data.MySqlClient;

namespace MFBDBO
{
    public partial class login : System.Web.UI.Page
    {
       
        LoginBL objLoBL = new LoginBL();
        List<Usertbl> ust = new List<Usertbl>();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usertbl us = new Usertbl();
            us.Username = txtUsername.Text;
            us.Password = txtPassword.Text;
            us.Email = txtEmailID.Text;
            List<Usertbl> lust = new List<Usertbl>();
            lust = objLoBL.GetUserExists(us).ToList();
            Reset();
            if (lust.Count() >= 1)
            {
                Session["Username"] = us.Username;
                Session["Password"] = us.Password;
                Response.Redirect("MainDashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Invalid Credentials');", true);
            }
            //List<Usertbl> ust = new List<Usertbl>();
            //ust = objLoBL.GetAllUsers(us).ToList();
            //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Data Inserted Successfully');", true);
            //btnSave.Visible = true;
        }
          protected void Reset()
        {
            txtUsername.Text = " ";
            txtPassword.Text = " ";
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
          Reset();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            Employeetbl emp = new Employeetbl();
            EmployeeBL objempBL = new EmployeeBL();
            emp.Email = txtEmailID.Text;
            List<Employeetbl> empl = new List<Employeetbl>();
            empl = objempBL.GetEmployeeByEmailID(emp).ToList();
            // var Exists = (List <Employeetbl> objempBL.GetEmployeeByEmailId(emp).ToList());

            if (empl.Count() >= 1)
            {
                txtEmailID.Text = string.Empty;
                lblMessage.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Invalid Email');", true);
            }
        }
    }
}