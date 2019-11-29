using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC1.Lab.Pages.Product
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGoToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Product/Cart.aspx");
        }
    }
}