using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MFBDBO.Data;
using MFBDBO.Business;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace MFBDBO.Master
{
    public partial class BanksList : System.Web.UI.Page
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["mfbbo"].ConnectionString);
        BankBL objBankBL = new BankBL();
        List<Bankstbl> lba = new List<Bankstbl>();
        Bankstbl ba = new Bankstbl();


        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                GetBank();
            }
        }
     
        protected void GetBank()
        {
            Bankstbl ba = new Bankstbl();
            List<Bankstbl> lst = new List<Bankstbl>();
            lst = objBankBL.GetAllBanks(ba).ToList();
          if(lst.Count()>=1)
            {
                gdvBank.DataSource = lst;
                gdvBank.DataBind();

            }
          else
            {
                DataTable dt = new DataTable();
                gdvBank.DataSource = dt;
                gdvBank.DataBind();
            }
        }
        protected void lbtnLEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = Convert.ToInt32(gvr.Cells[0].Text);
            Session["BankID"] = id;
            Response.Redirect("Banks.aspx");
        
        }
        protected void lbtnLMarkAsActive_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            var val = gvr.DataItemIndex;
            var id = gvr.Cells[7].Text;
            Bankstbl ba = new Bankstbl();
            ba.BankID = Convert.ToInt32(gvr.Cells[0].Text);
            if (id == "Active")
            {
                ba.Status = 0;
            }
            else if (id == "InActive")
            {
                ba.Status = 1;
            }
            objBankBL.UpdateBankIsActive(ba);
            GetBank();
        }



        protected void gdvBank_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[7].Text) == 1)
                {
                    e.Row.Cells[7].Text = "Active";
                    e.Row.FindControl("lbtnLMarkAsActive").Visible = false;

                }
                else if (Convert.ToInt32(e.Row.Cells[7].Text) == 0)
                {
                    e.Row.Cells[7].Text = "InActive";
                    e.Row.FindControl("lbtnLMarkAsInActive").Visible = false;
                }
                if(Convert.ToInt32(e.Row.Cells[6].Text) == 1)
                {
                    e.Row.Cells[6].Text = "Savings";
                 }
                 else if(Convert.ToInt32(e.Row.Cells[6].Text) == 2)

                {
                    e.Row.Cells[6].Text = "Current";
                }
            }


        }

       


        protected void btnBank_Click(object sender, EventArgs e)
        {
         
            Response.Redirect("Banks.aspx");
            
        }

    }
}


          