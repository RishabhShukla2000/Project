namespace Project.DTO
{
    public class JWTToken
    {
        public string Name { get; set; } = null!;
        public int UserId { get; set; }
        public string? Token { get; set; }

        public string ProfilePicPath { get; set; } = null!;
    }
}
