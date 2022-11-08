using Project.Models;

namespace Project.DTO
{
    public class BookCount
    {
        public List<Book> Books { get; set; } = new List<Book>();
        
        public int Count { get; set; }
    }
}
