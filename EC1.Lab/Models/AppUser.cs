using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EC1.Lab.Models
{
    public class AppUser:IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        [Required]
        public override string Email { get; set; }
        public DateTime DateOfBirth { get; set; }
        public override string PhoneNumber { get; set; }

        public ICollection<Order> Orders { get; set; }
    }
}