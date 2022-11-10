using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Project.Models
{
    public partial class SubCategory
    {
        public int SubCategoryId { get; set; }
        public string SubCategoryName { get; set; } = null!;
        public int? CategoryId { get; set; }
        [JsonIgnore]
        public virtual Category? Category { get; set; }
    }
}
