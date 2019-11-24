using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace EC1.Lab.Pages.Product.Events
{
    public class ProductSelectEventArgs
    {   
        public string ProductId { get; set; } 
        public string ProductDescription { get; set; }
        public string ProductName { get; set; }
        public string ProductPrice { get; set; }
    }
}