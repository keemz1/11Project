using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EC1.Lab.Pages.Product.Sub_Pages
{
    public partial class CartItems : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = HttpContext.Current.User;
            var id = user.Identity.GetUserId();
            hfUserId.Value = id;       
        }

        protected void cartGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void cartGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}