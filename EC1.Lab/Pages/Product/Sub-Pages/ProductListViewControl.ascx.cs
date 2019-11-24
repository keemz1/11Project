using EC1.Lab.Domain;
using EC1.Lab.Pages.Product.Events;
using EC1.Lab.Pages.Product.Page_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC1.Lab.Pages.Product.Sub_Pages
{
    public partial class ProductListViewControl : System.Web.UI.UserControl
    {
        public delegate void ChildControlDelegate(ProductSelectEventArgs args);
        public event ChildControlDelegate ItemHandler;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }        

        protected void ProductImage_Click(object sender, CommandEventArgs e)
        {

            if(e.CommandName == "ImageClick")
            {
                ProductSelectEventArgs pe = new ProductSelectEventArgs();
                string[] cmdArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                pe.ProductId = cmdArgs[0];
                pe.ProductName = cmdArgs[1];
                pe.ProductDescription = cmdArgs[2];
                pe.ProductPrice = cmdArgs[3];

                if (ItemHandler != null)
                {
                    ItemHandler(pe);
                }
            }
            
        }
    }
}