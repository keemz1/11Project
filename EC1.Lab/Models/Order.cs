using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace EC1.Lab.Models
{
    public class Order
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int OrderID { get; set; }
        [ForeignKey("Product")]
        public Guid ProductId { get; set; }
        public Product Product { get; set; }
        public string ProductName { get; set; }
        [Required]
        public decimal SubTotal { get; set; }
        [Required]
        public DateTime OrderDate { get; set; }
        [Required]
        public int Quantity { get; set; }
        [Required]
        public decimal TotalCost { get; set; }
        [Required]
        public string Status { get; set; }
        public DateTime RetrievalDate { get; set; }

        public Guid CustomerID { get; set; }
    }
}