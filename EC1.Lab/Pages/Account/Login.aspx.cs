using EC1.Lab.Domain;
using EC1.Lab.Models;
using EC1.Lab.Services;
using Microsoft.AspNet.Identity;
//using Microsoft.AspNetCore.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC1.Lab
{
    public partial class Login : System.Web.UI.Page
    {
        //private readonly DbService dbService = new DbService();
        UserManager<AppUser> userManager = new UserManager<AppUser>(new UserStore<AppUser>(new ApplicationDbContext()));

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void btnSignin_Click(object sender, EventArgs e)
        {
            StatusMessage.Visible = false;
            StatusMessage.Text = "";
            userManager.UserValidator = new UserValidator<AppUser>(userManager);
            var userEmail = userManager.FindByEmail(txtemail.Text);
            bool confirm = userManager.CheckPassword(userEmail, txtpass.Text);
            //var user = userManager.Find(User.Identity.GetUserName(),txtpass.Text) ;
            //bool val1 = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            //user.UseAuthentication
            if (userEmail == null || confirm == false)
            {
                StatusMessage.Visible = true;
                StatusMessage.Text = "User not found  or Incorrect password entered";
            }
            else
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(userEmail, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                Response.Redirect("/Pages/Welcome.aspx");
            }
        }

        //User Registered
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pages/Account/Register.aspx");
        }
    }
}