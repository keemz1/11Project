using EC1.Lab.Domain;
using EC1.Lab.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace EC1.Lab
{
    public static class DbInitializer
    {
        public static async Task Initialize(ApplicationDbContext context, UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            // Ensure that the database exists and all pending migrations are applied.
            //context.Database.Migrate();

            // Create roles
            string[] roles = new string[] { "UserManager", "StaffManager" };
            foreach (string role in roles)
            {
                if (!await roleManager.RoleExistsAsync(role))
                {
                    await roleManager.CreateAsync(new IdentityRole(role));
                }
            }

            // Create admin user
            if (!context.Users.Any())
            {
                await userManager.CreateAsync(new AppUser() { UserName = "info@example.com", Email = "info@example.com" }, "p@ssw0rd");
            }

            // Ensure admin privileges
            AppUser admin = await userManager.FindByEmailAsync("info@example.com");
            foreach (string role in roles)
            {
                await userManager.AddToRoleAsync(admin, role);
            }
        }
    }
}