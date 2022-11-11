using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Project.Models
{
    public partial class Category
    {
        public Category()
        {
            Books = new HashSet<Book>();
            SubCategories = new HashSet<SubCategory>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
      
        public virtual ICollection<Book> Books { get; set; }
  
        public virtual ICollection<SubCategory> SubCategories { get; set; }
    }
}
