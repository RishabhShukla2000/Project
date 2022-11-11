using Project.Models;

namespace Project.DTO
{
    public class BookDetails
    {
        public string? BookReferenceNo { get; set; }
        public string Title { get; set; } = null!;
        public int NumberOfVolume { get; set; }
        public List<Author> Authors { get; set; } = new List<Author>();
        public Category? Category { get; set; }
        public int NumberOfPages { get; set; }


        public SubCategory? SubCategory { get; set; }
    }
}
