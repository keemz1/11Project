//-----------------------------------------------------------------------------------//
//This conducts all Database Services used in the Project
//for all web forms (Insert, Remove, View ect.)
//-----------------------------------------------------------------------------------//
using EC1.Lab.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace EC1.Lab.Services
{
    public class DbService //: IDisposable
    {
        //private OleDbConnection connection = new OleDbConnection(@"Provider = Microsoft.ACE.OLEDB.12.0; Data Source =" + Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "./App_Data/PeeknKeep1.accdb"));
        //private readonly string connectionString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source =" + Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "./App_Data/PeeknKeep1.accdb");
        public DbService()
        {
        }

        //public void InsertUser(AppUser user)
        //{
        //    try
        //    {
        //        var hashedPassword = Encryptor.MD5Hash(user.Password);

        //        using (OleDbConnection connection = new OleDbConnection(GetConnectionString()))
        //        {
        //            connection.Open();

        //            using (OleDbCommand command = new OleDbCommand())
        //            {
        //                command.Connection = connection;
        //                command.CommandType = CommandType.Text;
        //                command.CommandText = string.Format($@"Insert into Users(FirstName, LastName, Address, City, Email, DOB, PhoneNumber, [Password]) values('{user.FirstName}', '{user.LastName}', '{user.Address}', '{user.Email}', '{user.City}', '{user.DateOfBirth}','{user.PhoneNumber}', '{hashedPassword}')");

        //                command.ExecuteNonQuery();
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }
        //}


        public void GetProduct(Product product)
        {
            using (OleDbConnection connection = new OleDbConnection(GetConnectionString()))
            {
                connection.Open();

                using (OleDbCommand command = new OleDbCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    //command.CommandText = string.Format($@"Insert into Users(FirstName, LastName, Address, City, Email, DOB, PhoneNumber, [Password]) values('{user.FirstName}', '{user.LastName}', '{user.Address}', '{user.Email}', '{user.City}', '{user.DateOfBirth}','{user.PhoneNumber}', '{hashedPassword}')");
                    command.CommandText = string.Format($@"select * from Products");
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        product = new Product()
                        {
                            Name = reader["Name"].ToString(),
                            ShortDescription = reader["ShortDescription"].ToString(),
                            ImageFile = reader["ImageURL"].ToString(),
                        };
                    }
                }
            }
        }

        //connection.Open();
        //OleDbCommand command = connection.CreateCommand();
        //command.CommandType = CommandType.Text;
        //command.CommandText = string.Format($@"Insert into Users(FirstName, LastName, Address, City, Email, DOB, PhoneNumber, [Password]) values('{user.FirstName}', '{user.LastName}', '{user.Address}', '{user.Email}', '{user.City}', '{user.DateOfBirth}','{user.PhoneNumber}', '{hashedPassword}')");
        ////command.CommandText = @"Insert into Users(FirstName, LastName, Address, City, Email, DOB, PhoneNumber, Password) values(@firstName, @lastName, @address, @city, @email, @dob, @phoneNumber, @password)";
        ////command.Parameters.AddWithValue("firstName", user.FirstName);
        ////command.Parameters.AddWithValue("lastName", user.LastName);
        ////command.Parameters.AddWithValue("address", user.Address);
        ////command.Parameters.AddWithValue("email", user.Email);
        ////command.Parameters.AddWithValue("city", user.City);
        ////command.Parameters.AddWithValue("dob", user.DateOfBirth);
        ////command.Parameters.AddWithValue("phoneNumber", user.PhoneNumber);
        ////command.Parameters.AddWithValue("password", hashedPassword);
        //command.ExecuteNonQuery();
        //connection.Close();
        //command.Dispose();
        //}

        //public AppUser LoginUser(UserLogin userLogin)
        //{
        //    AppUser user = null;

        //    try
        //    {
        //        var hashedPassword = Encryptor.MD5Hash(userLogin.Password);

        //        using (OleDbConnection connection = new OleDbConnection(GetConnectionString()))
        //        {
        //            connection.Open();

        //            using (OleDbCommand command = new OleDbCommand())
        //            {
        //                command.Connection = connection;
        //                command.CommandType = CommandType.Text;
        //                command.CommandText = string.Format($@"select * from Users where email = '{userLogin.Email}' and password = '{hashedPassword}'");

        //                var reader = command.ExecuteReader();
        //                while (reader.Read())
        //                {
        //                    user = new AppUser()
        //                    {
        //                        FirstName = reader["FirstName"].ToString(),
        //                        LastName = reader["LastName"].ToString(),
        //                        Email = reader["Email"].ToString(),
        //                    };
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }

        //    return user;
        //}

        //connection.Open();
        //OleDbCommand command = connection.CreateCommand();

        //var hashedPassword = Encryptor.MD5Hash(userLogin.Password);
        //command.CommandText = @"select * from Users where email = @email and password = @hashedPassword";
        //command.Parameters.AddWithValue("email", userLogin.Email);
        //command.Parameters.AddWithValue("hashedPassword", hashedPassword);

        //var reader = command.ExecuteReader();

        //if (reader.Read())
        //{
        //    user = new User()
        //    {
        //        FirstName = reader["FirstName"].ToString(),
        //        LastName = reader["LastName"].ToString(),
        //        Email = reader["Email"].ToString(),
        //    };
        //}

        //connection.Close();

        //        public List<User> GetUsers(UserLogin user)
        //        {
        //            connection.Open();
        //            OleDbCommand command = connection.CreateCommand();
        //            command.CommandType = CommandType.Text;
        //            command.CommandText = @"SELECT * FROM Users(Email, Password)
        //values(@email, @password) ";
        //            command.Parameters.AddWithValue("email", user.Email);
        //            command.Parameters.AddWithValue("password", user.Password);
        //            command.ExecuteReader();
        //            connection.Close();
        //        }

        private string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }


        //public OleDbDataReader GetProductGridView(GridView gridView1)
        //{
        //    try
        //    {
        //        using (OleDbConnection connection = new OleDbConnection(GetConnectionString()))
        //        {
        //            connection.Open();

        //            using (OleDbCommand command = new OleDbCommand())
        //            {
        //                command.Connection = connection;
        //                command.CommandType = CommandType.Text;
        //                command.CommandText = string.Format($@"Select * from [Products]");

        //                //command.ExecuteReader();
        //                using (OleDbDataReader rd = command.ExecuteReader())
        //                {
        //                    //gridView1.DataSource = rd;
        //                    //gridView1.DataBind();
        //                    return rd;
        //                }

        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }
        //}
        //public void Dispose()
        //{
        //    //connection.Dispose();
        //}
    }
}