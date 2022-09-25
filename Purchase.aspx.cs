using Stripe;
using Stripe.Checkout;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Purchase : System.Web.UI.Page
    {

        
        public string sessionId = "";     

        protected void Page_Load(object sender, EventArgs e)
        {

            StripeConfiguration.ApiKey = "sk_test_51Kv6F8Jmh0A8klQt2aWAadyPYDQH8Ih0yMaexyLiOY6GLy23Nfol0VXmAFPnrw798kKLaFWG68s9a8m43vtBubtj00P1dpBXKy";
            BindCartNumber();
            BindCategories();
            BindPriceData();
            decimal amtToPay = 0;

            if (!decimal.TryParse(hdTotalPayed.Value,out amtToPay))
            {
                throw new ArgumentException("The amount to pay is not a number");
            }


            int amtForStripe = (int)(amtToPay * 100);
            
            
            var options = new SessionCreateOptions
            {
                SuccessUrl = "https://localhost:44312/Callback.aspx",
                CancelUrl = "https://example.com/cancel",


                LineItems = new List<SessionLineItemOptions>{
                   new SessionLineItemOptions
                   {
                        Name = "MBoutique Order",                   
                        Amount = amtForStripe,
                        Currency = "usd",
                        Quantity = 1,
                        
                    },
                },
                
            };

            var service = new SessionService();
            Session session = service.Create(options);
            sessionId = session.Id;


            


            if (Session["USERNAME"] != null)
            {
                btnSignup.Visible = false;
                btnSigin.Visible = false;
                btnSignOut.Visible = true;

            }
            else
            {
                btnSignup.Visible = true;
                btnSigin.Visible = true;
                btnSignOut.Visible = false;
            }


        }

        public void BindCategories()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        rptCategory.DataSource = dtBrands;
                        rptCategory.DataBind();
                    }

                }

            }

        }
        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/Default.aspx");
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

        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
                Repeater rptSubCategories = e.Item.FindControl("rptSubCategories") as Repeater;

                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM tblSubCategories WHERE MainCatID='{0}'", catId), con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dtBrands = new DataTable();
                            sda.Fill(dtBrands);
                            rptSubCategories.DataSource = dtBrands;
                            rptSubCategories.DataBind();
                        }

                    }
                }
            }
        }
        public void BindPriceData()
        {
            
           


            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    DataTable dtBrands = new DataTable();
                    Int64 CartTotal = 0;
                    Int64 Total = 0;
                    
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string SizeID = CookieDataArray[i].ToString().Split('-')[1];

                        if (hdPidSizeID.Value != null && hdPidSizeID.Value != "")
                        {
                            hdPidSizeID.Value += "," + PID + "-" + SizeID;
                        }
                        else
                        {
                            hdPidSizeID.Value = PID + "-" + SizeID;
                        }

                        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName(" + SizeID + ") as SizeNamee,"
                                + SizeID + " as SizeIDD,SizeData.Name,SizeData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID ) SizeData where A.PID="
                                + PID + "", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dtBrands);
                                }

                            }
                        }
                        CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                        Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                       
                    }
                   

                    hdCartAmount.Value = CartTotal.ToString();
                    hdCartDiscount.Value = (CartTotal - Total).ToString();
                    hdTotalPayed.Value = Total.ToString();


                    


                }
                else
                {
                    //TODO Show Empty Cart
                    Response.Redirect("~/Products.aspx");
                }
            }
            else
            {
                //TODO Show Empty Cart
                Response.Redirect("~/Products.aspx");
            }


        }




    }
}