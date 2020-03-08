using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_buyOnline.Admin
{
    public partial class ad_home : System.Web.UI.Page
    {
        SqlConnection cn;
        SqlDataAdapter da;
        DataSet ds;
        string CS = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // for barchart dropdown selection
                cn = new SqlConnection(CS);
                da = new SqlDataAdapter("select * from categories", cn);
                ds = new DataSet();
                da.Fill(ds, "categories");
                DataTable dt = ds.Tables[0];
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "category_name";
                DropDownList1.DataValueField = "category_id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Select", ""));

                //for piechart dropdown selection
                string query = "select * from categories";
                DataTable dt1 = GetData(query);
                DropDownList2.DataSource = dt1;
                DropDownList2.DataTextField = "category_name";
                DropDownList2.DataValueField = "category_id";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Select", ""));

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cn = new SqlConnection(CS);
            da = new SqlDataAdapter("select product_name,price from products where category_id=" + DropDownList1.SelectedValue, cn);
            ds = new DataSet();
            da.Fill(ds, "products");
            DataTable dt = ds.Tables[0];
            string[] Products_Name = new string[dt.Rows.Count];
            decimal[] Product_Price = new decimal[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Products_Name[i] = dt.Rows[i][0].ToString();
                Product_Price[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            BarChart1.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = Product_Price });
            BarChart1.CategoriesAxis = string.Join(",", Products_Name);
            BarChart1.ChartTitle = "Products";
            if (Products_Name.Length > 3)
            {
                BarChart1.ChartWidth = (Products_Name.Length * 100).ToString();
            }
            BarChart1.Visible = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = string.Format("select product_name, price from products where category_id=" + DropDownList2.SelectedValue);
            DataTable dt = GetData(query);

            //Loop and add each datatable row to the Pie Chart Values
            foreach (DataRow row in dt.Rows)
            {
                PieChart1.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = row["product_name"].ToString(),
                    Data = Convert.ToDecimal(row["price"])
                });
            }
            PieChart1.Visible = DropDownList2.SelectedItem.Value != "";
        }
        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter sda = new SqlDataAdapter();
                    
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
               
                
                return dt;
            }
        }

    }
    
    
