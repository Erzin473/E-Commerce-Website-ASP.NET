using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Payment : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                if (!IsPostBack)
                {
                    BindPriceData();
                }
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
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
                    divPriceDetails.Visible = true;

                    spanCartTotal.InnerText = CartTotal.ToString();
                    spanTotal.InnerText = "$: " + Total.ToString();
                    spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

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

        protected void btnPaytm_Click(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "Stripe";
                string PaymentStatus = "paid";
                DateTime DateOfPurchase = DateTime.Now;



                //Insert Data to tblPurchase
                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblPurchase values( @USERID , @hdPidSizeID , @hdCartAmount , @hdCartDiscount , @hdTotalPayed , @PaymentType, @PaymentStatus , @DateOfPurchase ,@txtName, @txtAddress ,@txtPinCode , @txtMobileNumber ) select SCOPE_IDENTITY()", con);
                    cmd.Parameters.AddWithValue("@USERID", USERID);
                    cmd.Parameters.AddWithValue("@hdPidSizeID", hdPidSizeID.Value);
                    cmd.Parameters.AddWithValue("@hdCartAmount", hdCartAmount.Value);
                    cmd.Parameters.AddWithValue("@hdCartDiscount", hdCartDiscount.Value);
                    cmd.Parameters.AddWithValue("@hdTotalPayed", hdTotalPayed.Value);
                    cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                    cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                    cmd.Parameters.AddWithValue("@DateOfPurchase", DateOfPurchase);
                    cmd.Parameters.AddWithValue("@txtName", txtName.Text);
                    cmd.Parameters.AddWithValue("@txtAddress", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@txtPinCode", txtPinCode.Text);
                    cmd.Parameters.AddWithValue("@txtMobileNumber", txtMobileNumber.Text);


                    con.Open();
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                }
                Response.Redirect("~/Purchase.aspx");



            }
            
        }

        protected void btnCod_Click(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "COD";
                string PaymentStatus = "Paid";
                DateTime DateOfPurchase = DateTime.Now;



                //Insert Data to tblPurchase
                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblPurchase values( @USERID , @hdPidSizeID , @hdCartAmount , @hdCartDiscount , @hdTotalPayed , @PaymentType, @PaymentStatus , @DateOfPurchase ,@txtName, @txtAddress ,@txtPinCode , @txtMobileNumber ) select SCOPE_IDENTITY()", con);
                    cmd.Parameters.AddWithValue("@USERID", USERID);
                    cmd.Parameters.AddWithValue("@hdPidSizeID", hdPidSizeID.Value);
                    cmd.Parameters.AddWithValue("@hdCartAmount", hdCartAmount.Value);
                    cmd.Parameters.AddWithValue("@hdCartDiscount", hdCartDiscount.Value);
                    cmd.Parameters.AddWithValue("@hdTotalPayed", hdTotalPayed.Value);
                    cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                    cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                    cmd.Parameters.AddWithValue("@DateOfPurchase", DateOfPurchase);
                    cmd.Parameters.AddWithValue("@txtName", txtName.Text);
                    cmd.Parameters.AddWithValue("@txtAddress", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@txtPinCode", txtPinCode.Text);
                    cmd.Parameters.AddWithValue("@txtMobileNumber", txtMobileNumber.Text);


                    con.Open();
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                }

                Response.Redirect("~/Callback.aspx");


            }
        }
    }
}