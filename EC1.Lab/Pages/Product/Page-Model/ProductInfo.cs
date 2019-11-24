using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EC1.Lab.Pages.Product.Page_Model
{
    public class ProductInfo
    {
        public Guid ProductId { get; set; }
        public string Name { get; set; }
        public string LongDescription { get; set; }
        public decimal UnitPrice { get; set; }
        public string ImageFile { get; set; }
    }
}