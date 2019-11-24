using EC1.Lab.Domain;
using EC1.Lab.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC1.Lab.Pages.Product.Sub_Pages
{
    public partial class OrderGridView : System.Web.UI.UserControl
    {
        private List<Order> cartItems;
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = HttpContext.Current.User;
            var id = user.Identity.GetUserId();
            hfUserId.Value = id;
            cartItems = new List<Order>();
            using (var context = new ApplicationDbContext())
            {
                cartItems = context.Orders.Where(c => c.CustomerID == getUserId()).ToList();
                ordersGrid.DataSource = cartItems;
                ordersGrid.DataBind();
            }
        }

        public Guid getUserId()
        {
            var user = HttpContext.Current.User;
            Guid id = Guid.Parse(user.Identity.GetUserId());
            return id;
        }
    }
}