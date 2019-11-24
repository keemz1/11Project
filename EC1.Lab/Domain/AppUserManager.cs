using EC1.Lab.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EC1.Lab.Domain
{
    public class AppUserManager //: UserManager<AppUser>
    {
        //public AppUserManager() : base(new UserStore<AppUser>(new ApplicationDbContext()))
        //{
        //}

        //public static AppUserManager Create(IdentityFactoryOptions<AppUserManager> options, IOwinContext context)
        //{
        //    var appDbContext = context.Get<ApplicationDbContext>();
        //    var appUserManager = new AppUserManager();

        //    return appUserManager;
        //}
    }
}