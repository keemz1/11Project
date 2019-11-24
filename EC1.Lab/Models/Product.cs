using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Product
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public Guid ProductId { get; set; }
    public string Name { get; set; }
    public string ShortDescription { get; set; }
    public decimal UnitPrice { get; set; }
    public string ImageFile { get; set; }
    [Required]
    public int InStock { get; set; }
}