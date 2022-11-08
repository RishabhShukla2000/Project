using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;
using Project.DTO;
using static System.Net.Mime.MediaTypeNames;
using Microsoft.EntityFrameworkCore;

namespace Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly ProjectContext _context;
        public DashboardController(ProjectContext context)
        {
            _context = context;
        }

        [HttpGet()]
       
        public async Task<ActionResult<List<Book>>> GetBooks()
        {
            
            var books = (await _context.Books.ToListAsync()).Count;
            return Ok(books);          
        }
    }
    
}



