using EC1.Lab.Domain;
using EC1.Lab.Models;
using EC1.Lab.Pages.Product.Events;
using EC1.Lab.Pages.Product.Sub_Pages;
using EC1.Lab.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static EC1.Lab.Pages.Product.Sub_Pages.GridViewControl;

namespace EC1.Lab
{
    public partial class Products : System.Web.UI.Page
    {
        UserManager<AppUser> userManager = new UserManager<AppUser>(new UserStore<AppUser>(new ApplicationDbContext()));
        private readonly DbService dbService = new DbService();
        //public static string ImageID = "";



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("/Pages/Account/Login.aspx", true);
            }
            var t = HttpContext.Current.User;
            var id = Guid.Parse(t.Identity.GetUserId());

            Page.MaintainScrollPositionOnPostBack = true;
            Grid.SelectionHandler += new GridViewControl.ChildControlDelegate(Item_Selected);
            ListView.ItemHandler += new ProductListViewControl.ChildControlDelegate(Item_Selected);

            using (var context = new ApplicationDbContext())
            {
                
                var count = context.Cart.Where(C => C.UserId == id).ToList().Count();
                lblCartCount.Text = count.ToString();
            };

        }

        protected void Item_Selected(ProductSelectEventArgs e)
        {
            txtproductName.Text = e.ProductName;
            txtShortDescription.Text = e.ProductDescription;
            txtproductPrice.Text = string.Format("{0:#.00}", Convert.ToDecimal(e.ProductPrice));
            hfProductId.Value = e.ProductId;
        }

        public void SetProductDetail(string parentName)
        {
            this.txtproductName.Text = parentName;
        }

        protected void AddItem_Click(object sender, EventArgs e)
        {
            double price = Convert.ToDouble(txtproductPrice.Text);
            var totalCost = Convert.ToInt32(txtQuantity.Text) * price;
            var t = HttpContext.Current.User;
            var id = Guid.Parse(t.Identity.GetUserId());

            using (var context = new ApplicationDbContext())
            {
                context.Cart.Add(new Cart
                {
                    ProductID = Guid.Parse(hfProductId.Value),
                    UserId = id,
                    ProductName = txtproductName.Text,
                    Quantity = Convert.ToInt32(txtQuantity.Text),
                    Status = "New",
                    ShippingCost= Convert.ToInt32(txtQuantity.Text)*3.50,
                    TotalCost = totalCost
                });
                context.SaveChanges();
            };
        }

        protected void OpenCart(object Source, EventArgs e)
        {
            Response.Redirect("/Pages/Product/Cart.aspx");
        }
    }
}