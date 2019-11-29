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
    public partial class LabForm : System.Web.UI.Page
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
            try
            {
                var manager = new UserManager<AppUser>(new UserStore<AppUser>(new ApplicationDbContext()));

                if (manager.FindByName(txtUserName.Text) == null &&
                    manager.FindByName(txtUserName.Text) == null &&
                    manager.FindByEmail(txtUserName.Text) == null)
                {

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
                        DateOfBirth = DateTime.Now,
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
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill all empty fields')", true); ;
            }
            
        }
    }
}