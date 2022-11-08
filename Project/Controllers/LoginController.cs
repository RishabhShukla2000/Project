using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Project.DTO;
using Project.Models;
namespace Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        public IConfiguration _configuration;
        private readonly ProjectContext _context;

        public LoginController(IConfiguration config, ProjectContext context)
        {
            _configuration = config;
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> Post(LoginPage _userData)
        {
            if (_userData != null && _userData.Login != null && _userData.Password != null)
            {
                var user = await GetUser(_userData.Login, _userData.Password);
                if (user != null)
                {
                    var claims = new[] {
                        new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
                        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                        new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),


                    };

                    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
                    var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                    var token = new JwtSecurityToken(
                        _configuration["Jwt:Issuer"],
                        _configuration["Jwt:Audience"],
                        claims,
                        expires: DateTime.UtcNow.AddMinutes(10),
                        signingCredentials: signIn);

                    JWTToken model = new JWTToken();
                    model.Token = new JwtSecurityTokenHandler().WriteToken(token);
                    model.Name = user.Name;
                    model.UserId = user.UserId;
                    model.ProfilePicPath = user.ProfilePicPath;
                    return Ok(model);
                }

                else
                {
                    return BadRequest("Invalid credentials");
                }
            }
            else
            {
                return BadRequest();
            }
        }

        private object TokenHandler()
        {
            throw new NotImplementedException();
        }

        private async Task<User> GetUser(string login, string password)
        {
            return await _context.Users.FirstOrDefaultAsync(u => (u.Email == login || u.MobileNo == login) && u.Password == password);
        }

    }
}
