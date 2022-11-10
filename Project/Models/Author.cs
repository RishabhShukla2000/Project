using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Project.Models
{
    public partial class Author
    {
        public int AuthorId { get; set; }
        public string AuthorName { get; set; } = null!;
        public int Experience { get; set; }
        public int? BookId { get; set; }
        [JsonIgnore]
        public virtual Book? Book { get; set; }
    }
}
