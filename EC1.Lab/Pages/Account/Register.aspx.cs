using EC1.Lab.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.TeamFoundation.Lab.Client;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin.Security.Cookies;
using System.Web;
using Microsoft.Owin.Security;
using System.Linq;
using EC1.Lab.Models;
using EC1.Lab.Domain;

namespace EC1.Lab
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly DbService dbService = new DbService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            lblRegisted.Text = "Registered Users: " + Application["countUser"].ToString();
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int day = Convert.ToInt32(txtday.Text);
            int month = Convert.ToInt32(txtmonth.Text);
            int year = Convert.ToInt32(txtyear.Text);
            int ageMonth = DateTime.Now.Month % month;
            int Age = (DateTime.Now.Year % year) + ageMonth;
            if (year >= DateTime.Now.Month)
            {
                Age += (DateTime.Now.Day % day);
            }

            var manager = new UserManager<AppUser>(new UserStore<AppUser>(new ApplicationDbContext()));

            if (manager.FindByName(txtUserName.Text) == null &&
                manager.FindByName(txtUserName.Text) == null &&
                manager.FindByEmail(txtUserName.Text) == null)
            {
                if (Age < 18)
                {
                    Response.Redirect("/Pages/Site/Home.aspx");
                }


                var user = new AppUser()
                {
                    UserName = txtUserName.Text,
                    Email = txtemail.Text,
                    EmailConfirmed = true,
                    FirstName = txtfname.Text,
                    LastName = txtlname.Text,
                    Address = txtaddress.Text,
                    City = txtcity.Text,
                    PhoneNumber = txtphonenum.Text,
                    DateOfBirth = new DateTime(year, month, day).Date

                };
                
                manager.Create(user, txtpass.Text);
                manager.FindByName(txtUserName.Text);
                manager.AddToRole(user.Id, "Customer");
                Response.Redirect("/Pages/Site/Home.aspx");
            }
            else
            {

            }
        }
    }
}