using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_buyOnline.Model
{
    public class Product
    {
        public int prod_id { get; set; }
        public string prod_name { get; set; }
        public int prod_price { get; set; }
        public DateTime prod_date { get; set; }
        public string prod_img { get; set; }
        public string prod_description { get; set; }
        public int prod_catid_fk { get; set; }
    }
}