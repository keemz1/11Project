using EC1.Lab.Domain;
using EC1.Lab.Models;
using EC1.Lab.Pages.Product.Events;
using EC1.Lab.Pages.Product.Page_Model;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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

        public Guid getUserId()
        {
            var user = HttpContext.Current.User;
            Guid id = Guid.Parse(user.Identity.GetUserId());
            return id;
        }

        protected void btnBuy(object sender, EventArgs e)
        {
            //Guid id = getUserId();
            //var today = DateTime.Now;
            //string[] cmdArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            //ListViewItem gRow = (ListViewItem)((Button)sender).Parent.Parent;
            //using (var context = new ApplicationDbContext())
            //{

            //    ProductListView.DataBind();
            //    context.Cart.Add(new Cart
            //    {
            //        ProductID = Guid.Parse(cmdArgs[0]),
            //        UserId = id,
            //        ProductName = cmdArgs[0],
            //        Quantity = 1,
            //        Status = "New",
            //        //ShippingCost = Convert.ToDecimal() *3.50,
            //        //TotalCost = Convert.ToDecimal(totalFinal),
            //    });
            //    context.SaveChanges();
            //};
        }
    }
}