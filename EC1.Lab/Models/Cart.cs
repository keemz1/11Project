using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace EC1.Lab.Models
{
    public class Cart
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int CartId { get; set; }
        public Guid OrderID { get; set; }
        [ForeignKey("Product")]
        public Guid ProductID { get; set; }
        public Product Product { get; set; }
        [Required]
        public int Quantity { get; set; }
        public double TotalCost { get; set; }
        public Guid UserId { get; set; }
        [Required]
        public string ProductName { get; set; }
        [Required]
        public string Status { get; set; }
        public double ShippingCost { get; set; }

    }
}