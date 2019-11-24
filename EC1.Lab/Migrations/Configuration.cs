namespace EC1.Lab.Migrations
{
    using EC1.Lab.Domain;
    using EC1.Lab.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<EC1.Lab.Domain.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(EC1.Lab.Domain.ApplicationDbContext context)
        {
            var manager = new UserManager<AppUser>(new UserStore<AppUser>(new ApplicationDbContext()));

            var user = new AppUser()
            {
                UserName = "admin3",
                Email = "admin3@mymail.com",
                EmailConfirmed = true,
                FirstName = "keemz",
                LastName = "henny",
                Address = "11 King Ave",
                City = "ATL",
                PhoneNumber = "999-999-9999",
                DateOfBirth = new DateTime(1995, 12, 2)

            };

            manager.Create(user, "password1");
        }
    }
}
