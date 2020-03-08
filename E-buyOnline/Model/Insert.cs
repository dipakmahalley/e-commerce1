using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_buyOnline.Model
{
    public class Insert
    {
        private string cs = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
       
        public string insert_tblproduct(Product p)
        {
            
            string k = "1";
            SqlConnection con = new SqlConnection(cs);

            try
            {
                SqlCommand cmd = new SqlCommand("sp_insert_product", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@product_image", SqlDbType.NVarChar).Value = p.prod_img;
                cmd.Parameters.Add("@description", SqlDbType.NVarChar,500).Value = p.prod_description;
                cmd.Parameters.Add("@prod_name", SqlDbType.NVarChar, 50).Value = p.prod_name;
                cmd.Parameters.Add("@prod_posted_date", SqlDbType.Date).Value = p.prod_date;
                cmd.Parameters.Add("@price", SqlDbType.Int).Value = p.prod_price;                
                cmd.Parameters.Add("@category_id", SqlDbType.Int).Value = p.prod_catid_fk;

                SqlParameter para = new SqlParameter();
                para.SqlDbType = SqlDbType.Int;
                para.Direction = ParameterDirection.Output;
                para.ParameterName = "@product_id";
                cmd.Parameters.Add(para);



                con.Open();
                cmd.ExecuteNonQuery();
                k = para.Value.ToString();

            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.Message);
                k = "-1";
            }
            finally
            {
                con.Close();

            }
            return k;


        }
    }
}