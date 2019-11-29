using EC1.Lab.Domain;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRepo.Project.Pages.AdminStuff
{
    public partial class AddProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Guid getUserId()
        {
            var user = HttpContext.Current.User;
            Guid id = Guid.Parse(user.Identity.GetUserId());
            return id;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var file = upFileImage.FileName;
                string bookExtention = String.Concat("/Images/", file);
                var bookdescription = Request.Form["txtdescription"];
                using (var context = new ApplicationDbContext())
                {
                    context.Products.Add(new Product
                    {
                        Name = txtname.Text,
                        InStock = Convert.ToInt32(txtstock.Text),
                        UnitPrice = Convert.ToDecimal(txtprice.Text),
                        ShortDescription = bookdescription,
                        ImageFile = bookExtention,
                    });
                    context.SaveChanges();
                };
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' An error has occured. Please fill all empty fields')", true); ;
            }
            
        }
    }
}