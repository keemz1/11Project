using EC1.Lab.Domain;
using EC1.Lab.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EC1.Lab.Pages.Product.Sub_Pages
{
    public partial class OrderGridView : System.Web.UI.UserControl
    {
        private List<Order> orderItems;
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid id = getUserId();
            orderItems = new List<Order>();
            LoadOrders();
        }

        public Guid getUserId()
        {
            var user = HttpContext.Current.User;
            Guid id = Guid.Parse(user.Identity.GetUserId());
            return id;
        }


        public void LoadOrders()
        {

            using (var context = new ApplicationDbContext())
            {
                var user = HttpContext.Current.User;
                Guid id = Guid.Parse(user.Identity.GetUserId());
                orderItems = context.Orders.Where(c => c.CustomerID == id).ToList();
                ordersGrid.DataSource = orderItems;
                ordersGrid.DataBind();
            }
        }

        protected void btnRemoveOrder_ServerClick(object sender, EventArgs e)
        {
            Guid id = getUserId();
            var today = DateTime.Now;
            GridViewRow gRow = ((GridViewRow)((HtmlInputButton)sender).Parent.Parent);
            Guid pid = Guid.Parse(gRow.Cells[7].Text);

            using (var context = new ApplicationDbContext())
            {
                var item = context.Orders.Where(x => x.ProductId == pid).ToList().FirstOrDefault();
                context.Entry(item).State = EntityState.Deleted;
                //context.Cart.Remove(item);
                context.SaveChanges();
            };
        }
    }
}