using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project.DTO;
using Project.Models;

namespace Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ProjectContext _context;

        public UsersController(ProjectContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<User>>> GetUser()
        {
            return Ok(await _context.Users.ToListAsync());
        }


        [HttpPost]
        public async Task<IActionResult> UserDataUpload([FromForm] UserDTO user)
        {
            if (user.ProfilePic == null)
            {
                return new UnsupportedMediaTypeResult();
            }

            if (user.ProfilePic.Length > 0)
            {
                IFormFile formFile = user.ProfilePic;

                var folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot","Upload");
                user.ProfilePicPath = folderPath;
                var filePath = Path.Combine(folderPath, formFile.FileName);
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await formFile.CopyToAsync(fileStream);
                   
                    fileStream.Flush();

                }

            }


            User newuser = new User();
            newuser.ProfilePicPath = user.ProfilePicPath;
            newuser.Name = user.Name;
            newuser.MobileNo = user.MobileNo;
            newuser.Email = user.Email;
            newuser.Gender = user.Gender;
            newuser.DateOfBirth = user.DateOfBirth;
            newuser.Hobbies = user.Hobbies;
            newuser.ProfilePic = user.ProfilePic.FileName;
            newuser.Password = user.Password;
            newuser.RoleId = user.RoleId;

            _context.Users.Add(newuser);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetUser", new { Name = user.Name }, user);
        }

        [HttpDelete("UserId")]

        public async Task<ActionResult<List<User>>> Delete(int id)
        {
            var dbUser = await _context.Users.FindAsync(id);
            if (dbUser == null)
                return BadRequest("User not found.");

            _context.Users.Remove(dbUser);
            await _context.SaveChangesAsync();

            return Ok(await _context.Users.ToListAsync());
        }

    }
}




