using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Project.Models
{
    public partial class User
    {
        public int UserId { get; set; }
        public string Name { get; set; } = null!;
        public string MobileNo { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Gender { get; set; } = null!;
        public DateTime DateOfBirth { get; set; }
        public string? Hobbies { get; set; }
        public string? ProfilePic { get; set; }
        public string Password { get; set; } = null!;
        public int? RoleId { get; set; }
        public string? ProfilePicPath { get; set; }
        [JsonIgnore]
        public virtual Role? Role { get; set; }
    }
}
