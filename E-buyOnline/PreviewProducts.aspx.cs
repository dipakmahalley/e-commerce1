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
    public partial class PreviewProducts : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        private int PageSize = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["view"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            if (!IsPostBack)
            {
                this.GetCustomersPageWise(1, Request.QueryString["view"].ToString());
            }


            DataSet ds = GetData("select * from categories");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
        private DataSet GetData(string q)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            this.GetCustomersPageWise(pageIndex, Request.QueryString["view"].ToString());
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }
        private void GetCustomersPageWise(int pageIndex, string id)
        {            
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("GetproductsPageWise", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.AddWithValue("@category_id", id);

                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    con.Open();
                    IDataReader idr = cmd.ExecuteReader();
                    Repeater2.DataSource = idr;
                    Repeater2.DataBind();
                    idr.Close();
                    con.Close();
                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulatePager(recordCount, pageIndex);
                }
            }
        }

    }
}