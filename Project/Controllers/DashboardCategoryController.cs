using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project.DTO;
using Project.Models;

namespace Project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardCategoryController : ControllerBase
    {
        private readonly ProjectContext _context;
        public DashboardCategoryController(ProjectContext context)
        {
            _context = context;
        }

        [HttpGet("CategoryDetails")]
        public async Task<ActionResult<List<CategoryDisplay>>> GetCategoryDetails()
        {
            var categories = await _context.Categories
                .Include(c => c.Books).ToListAsync();
        

            var group = categories.GroupBy(g => g.CategoryName);
            
            var response = new List<CategoryDisplay>();

            foreach (var category in group)
            {
                var catg = new CategoryDisplay
                {
                    CategoryName = category.Key,
                    CategoryBookCount = category.FirstOrDefault().Books.Count
                };            
                response.Add(catg);
            }

            return Ok(response);
        }
    }
}

