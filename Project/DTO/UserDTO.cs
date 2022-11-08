using Newtonsoft.Json;

namespace Project.DTO
{
    public class UserDTO
    {
        public string Name { get; set; } = null!;
        public string MobileNo { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Gender { get; set; } = null!;
        public DateTime DateOfBirth { get; set; }
        public string? Hobbies { get; set; }
        public IFormFile? ProfilePic { get; set; }
        public string Password { get; set; } = null!;
        public int? RoleId { get; set; }
        public string? ProfilePicPath { get; set; }

    }
}
