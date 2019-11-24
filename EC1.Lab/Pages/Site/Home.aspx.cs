using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC1.Lab
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnform_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Account/Register.aspx");
        }
    }
}