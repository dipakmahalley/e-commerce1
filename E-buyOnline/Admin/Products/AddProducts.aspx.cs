using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using E_buyOnline.Model;

namespace E_buyOnline
{
    public partial class ListByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LinkButton3.Visible = false;

            }
            TextBox2.Text = System.DateTime.Now.ToShortDateString();

            
        }
        
        public string img_upload(FileUpload FileUpload1)
        {
            string s = " ";
            if (FileUpload1.HasFile)
            {
                // Get the file extension
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (fileExtension.ToLower() != ".png" && fileExtension.ToLower() != ".jpg")
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "Only files with .doc and .docx extension are allowed";
                }
                else
                {
                    // Get the file size
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    // If file size is greater than 2 MB
                    if (fileSize > 2097152)
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "File size cannot be greater than 2 MB";
                    }
                    else
                    {
                        Random r = new Random();
                        int x = r.Next(0, 100000);
                        s = "~/img_prod/"  + x.ToString() + FileUpload1.FileName;
                        // Upload the file
                        FileUpload1.SaveAs(Server.MapPath(s));
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "File uploaded successfully";



                    }
                }
            }
            else
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "Please select a file";
            }

            return s;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Product p = new Product();
            p.prod_name = TextBox1.Text;
            p.prod_date = Convert.ToDateTime(TextBox2.Text);
            p.prod_price = Convert.ToInt32(TextBox3.Text);
            p.prod_description = TextBox4.Text;
            p.prod_img = img_upload(FileUpload1);
            p.prod_catid_fk = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
            
            Insert i = new Insert();
            string k = i.insert_tblproduct(p);
            Session["CProdId"] = k;
            if (k == "-1")
            {
                Label2.Text = "TRY AGAIN ....";
            }
            else
            {
                Label2.Text =  "Ad successfully posted!";
                LinkButton3.Visible = true;
                TextBox1.Text = " ";
                TextBox3.Text = " ";
                TextBox4.Text = " ";

            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductDetails.aspx?view="+ Session["CProdId"].ToString());
        }
    }
}