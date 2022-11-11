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
    public class DashboardCountController : ControllerBase
    {
        private readonly ProjectContext _context;
        public DashboardCountController(ProjectContext context)
        {
            _context = context;
        }

        [HttpGet("Count")]
        public async Task<ActionResult<Dashboard>> GetCount()
        {
            var books = await _context.Books.ToListAsync();

            var authors = (await _context.Authors.ToListAsync()).Count;

            var currentyear = DateTime.Now.Year;
            var BookThisYear = books.Where(y => y.PublishDate.Year == currentyear).Count();

           var response = new Dashboard
           {
               TotalBooks = books.Count,
               TotalAuthors = authors,
               BooksInLastYear = BookThisYear
           };
            
            return Ok(response);
        }

    }

}



