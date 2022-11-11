using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Project.DTO;
using Project.Models;
using System.Linq;

namespace Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardBookController : ControllerBase
    {
        private readonly ProjectContext _context;
        public DashboardBookController(ProjectContext context)
        {
            _context = context;
        }
        
        [HttpGet("BookDetails")]
        public async Task<ActionResult<BookDetails>> GetBookDetails()
        {
            var books = await _context.Books.
                Include(b=> b.Authors)
                .Include(b=> b.Category)
                .ToListAsync();

            //var bookid = books.Select(b => b.BookId);

            var authors = await _context.Authors.
                Include(a => a.Book).
             ToListAsync();


            var subcategories = await _context.SubCategories.ToListAsync();



            var response = new List<BookDetails>();
            foreach (var book in books)
            {
                var bookDetails = new BookDetails
                {
                    BookReferenceNo = book.BookReferenceNo,
                    Title = book.Title,
                    NumberOfVolume = book.NumberOfVolume,
                    Category = book.Category,
                    Authors = book.Authors.ToList(),
                    NumberOfPages = book.NumberOfPages,
                    SubCategory = subcategories.FirstOrDefault(s => s.CategoryId == book.CategoryId),
                };
                response.Add(bookDetails);
            }

            return Ok(response);
        }
    }
}
