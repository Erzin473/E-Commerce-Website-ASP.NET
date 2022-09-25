using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace WebApp
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartNumber();
            
        }

        

        public void BindCartNumber()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();
            }
            else
            {
                pCount.InnerText = 0.ToString();
            }
        }

        protected void btSignup_Click1(object sender, EventArgs e)
        {
            if (tbUname.Text != "" & tbPassword.Text != "" && tbName.Text != "" && tbEmail.Text != "" && tdCPass.Text != "")
            {
                if (tbPassword.Text == tdCPass.Text)
                {

                    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Users values('" + tbUname.Text + "','" + tbPassword.Text + "','" + tbEmail.Text + "','" + tbName.Text + "','U')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Registration Successfull";
                        lblMsg.ForeColor = Color.Green;
                        Response.Redirect("~/SignIn.aspx");

                    }
                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Password do not match";
                }
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "All Fields Are Mandatory";
            }

           
        }
    }
}