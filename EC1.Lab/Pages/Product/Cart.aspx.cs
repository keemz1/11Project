using EC1.Lab.Domain;
using EC1.Lab.Models;
using EC1.Lab.Services;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EC1.Lab
{
    public partial class Items : System.Web.UI.Page
    {
        private readonly DbService dbService = new DbService();
        private List<Cart> cartItems;

        protected void Page_Load(object sender, EventArgs e)
        {
            var user = HttpContext.Current.User;
            var id = user.Identity.GetUserId();
            hfUserId.Value = id;
            cartItems = new List<Cart>();
            LoadCart();
        }

        protected void btnBuy(object sender, EventArgs e)
        {
            Guid id = getUserId();
            var today = DateTime.Now;
            GridViewRow gRow = ((GridViewRow)((HtmlButton)sender).Parent.Parent);
            double totalFinal = (4.23 * Convert.ToDouble(gRow.Cells[3].Text)) + Convert.ToDouble(gRow.Cells[7].Text);
            using (var context = new ApplicationDbContext())
            {

                cartGridView.DataBind();
                context.Orders.Add(new Order
                {
                    ProductId = Guid.Parse(gRow.Cells[2].Text),
                    CustomerID = id,
                    ProductName = gRow.Cells[4].Text,
                    Quantity = Convert.ToInt32(gRow.Cells[3].Text),
                    Status = "Pending",
                    SubTotal = Convert.ToDecimal(gRow.Cells[7].Text),
                    TotalCost = Convert.ToDecimal(totalFinal),
                    OrderDate = today,
                    RetrievalDate = today.AddDays(7)
                });
                context.SaveChanges();

                int cartid = Convert.ToInt32(gRow.Cells[0].Text);
                var item = context.Cart.Where(x => x.CartId == cartid).First();
                item.Status = "Purchased";
                context.SaveChanges();
            };
        }

        protected void btnRemove(object sender, EventArgs e)
        {
            Guid id = getUserId();
            var today = DateTime.Now;
            GridViewRow gRow = ((GridViewRow)((HtmlButton)sender).Parent.Parent);
            double totalFinal = (4.23 * Convert.ToDouble(gRow.Cells[3].Text)) + Convert.ToDouble(gRow.Cells[7].Text);
            Guid pid = Guid.Parse(gRow.Cells[2].Text);

            using (var context = new ApplicationDbContext())
            {
                var item = context.Cart.Where(x => x.ProductID == pid).ToList().FirstOrDefault();
                context.Entry(item).State = EntityState.Deleted;
                //context.Cart.Remove(item);
                context.SaveChanges();
            };
        }

        public Guid getUserId()
        {
            var user = HttpContext.Current.User;
            Guid id = Guid.Parse(user.Identity.GetUserId());
            return id;
        }

        protected void btnSaveItem(object sender, EventArgs e)
        {
            GridViewRow gRow = ((GridViewRow)((HtmlInputButton)sender).Parent.Parent);
            //gRow.Cells[5].Text = "Saved";
            int cartid = Convert.ToInt32(gRow.Cells[0].Text);
            using (var context = new ApplicationDbContext())
            {
                var item = context.Cart.Where(x => x.CartId == cartid).First();
                item.Status = "Saved";
                context.SaveChanges();
            };
        }

        protected void btnStoreItem(object sender, EventArgs e)
        {
            GridViewRow gRow = ((GridViewRow)((HtmlInputButton)sender).Parent.Parent);
            int cartid = Convert.ToInt32(gRow.Cells[0].Text);
            using (var context = new ApplicationDbContext())
            {
                var item = context.Cart.Where(x => x.CartId == cartid && x.Status == "Saved").First();
                item.Status = "New";
                context.SaveChanges();
            };
        }

        public void LoadCart()
        {

            using (var context = new ApplicationDbContext())
            {
                var user = HttpContext.Current.User;
                Guid id = Guid.Parse(user.Identity.GetUserId());
                cartItems = context.Cart.Where(c => c.Status == "New" && c.UserId == id).ToList();
                cartGridView.DataSource = cartItems;
                cartGridView.DataBind();
            }
        }

        protected void cartGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                cartItems = context.Cart.Where(c => c.Status == "Saved" && c.UserId == getUserId()).ToList();
                cartGridView.DataSource = cartItems;
            }
        }

        protected void btnGetSavedItems(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                var user = HttpContext.Current.User;
                Guid id = getUserId();
                cartItems = context.Cart.Where(c => c.Status == "Saved" && c.UserId == id).ToList();
                cartGridView.DataSource = cartItems;
                cartGridView.DataBind();
            }
        }

        protected void btnOrdersPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Product/Orders.aspx");
        }
    }
}