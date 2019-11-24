using EC1.Lab.Models;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EC1.Lab
{
    public partial class Welcome : System.Web.UI.Page
    {
        IAuthenticationManager authenticationManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            if (authenticationManager.User.IsInRole("Customer"))
            {
                btnAddProduct.Visible = false;
                btnaddUser.Visible = false;
            }
        }

        //public Product GetProduct(AppUser appUser, string imgID)
        //{
        //    using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        //    {
        //        connection.Open();

        //        using (SqlCommand command = new SqlCommand())
        //        {
        //            command.Connection = connection;
        //            command.CommandType = CommandType.Text;
        //            //command.CommandText = string.Format($@"Insert into Users(FirstName, LastName, Address, City, Email, DOB, PhoneNumber, [Password]) values('{user.FirstName}', '{user.LastName}', '{user.Address}', '{user.Email}', '{user.City}', '{user.DateOfBirth}','{user.PhoneNumber}', '{hashedPassword}')");
        //            command.CommandText = string.Format($@"insert into ");
        //            var reader = command.ExecuteReader();
        //            while (reader.Read() && appUser.ImageFile != imgID)
        //            {
        //                appUser = new Product()
        //                {
        //                    Name = reader["Name"].ToString(),
        //                    LongDescription = reader["LongDescription"].ToString(),
        //                    ShortDescription = reader["ShortDescription"].ToString(),
        //                    ImageFile = reader["ImageURL"].ToString(),
        //                    UnitPrice = Convert.ToDecimal(reader["UnitPrice"]),
        //                    InStock = Convert.ToInt32(reader["UnitPrice"])
        //                };
        //            }
        //        }
        //    }
        //    return product;
        //}

        //private string GetConnectionString()
        //{
        //    return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //}

        protected void btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Account/Register.aspx"); //go to registration page
        }

        protected void btnprod_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/Product/Products.aspx");
        }

        protected void btnaddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/AdminStuff/AddUser.aspx");
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pages/AdminStuff/AddProducts.aspx");
        }
    }
}