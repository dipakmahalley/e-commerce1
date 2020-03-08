using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_buyOnline
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = GetData("select * from categories");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            if (Request.QueryString["view"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            else
            {
                SqlConnection connection = new SqlConnection(cs);
                string sql = "select p.product_id,p.product_name,p.product_posted_date,p.price,p.description,p.product_image,c.category_name from products p inner join categories c on c.category_id=p.category_id where p.product_id=" + Request.QueryString["view"].ToString();

                try
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Label1.Text = reader.GetValue(1).ToString();
                        Label2.Text = reader.GetValue(3).ToString();
                        Label3.Text = reader.GetValue(2).ToString();
                        Label4.Text = reader.GetValue(4).ToString();                        
                        Label6.Text = reader.GetValue(6).ToString();

                        Image1.ImageUrl = reader.GetValue(5).ToString();

                    }
                    connection.Close();
                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write(ex.Message);
                    Response.Write("Alert('error')");
                    Response.Redirect("~/home.aspx");


                }

            }

        }
        private DataSet GetData(string q)
        {            
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PlaceOrder.aspx");
        }
    }
}