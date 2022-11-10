using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

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
        [JsonIgnore]
        public virtual ICollection<Book> Books { get; set; }
        [JsonIgnore]
        public virtual ICollection<SubCategory> SubCategories { get; set; }
    }
}
