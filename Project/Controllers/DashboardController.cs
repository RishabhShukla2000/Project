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

        [HttpGet("GetBooks/{id}")]
        public async Task<ActionResult<List<Book>>> GetBooks(int id)
        {
            var books = await _context.Books
                .Include(bk => bk.Authors)
                .Include(bk => bk.Category)
                .Where(bk=>bk.BookId == id)
                .ToListAsync();

            //var response = new Dashboard
            //{
            //    TotalBooks = books.Count,
                
            //};
            
            return Ok(books);
        }

        
        //[HttpGet()]

        //public async Task<ActionResult<List<Author>>> GetAuthors()
        //{
        //    var authors = (await _context.Authors.ToListAsync()).Count;
        //    return Ok(authors);
        //}

        //[HttpGet()]

        //public async Task<ActionResult<List<Category>>> GetCategories()
        //{
        //    var categories = (await _context.Categories.ToListAsync()).Count;
        //    return Ok(categories);
        //}


    }

}



