using CadionBlazorServerApp.Models;
using Microsoft.EntityFrameworkCore;
 
namespace CadionBlazorServerApp.Models
{
    public class DataBaseContext : DbContext
    {
        public DataBaseContext(DbContextOptions<DataBaseContext> options) : base(options)
        {
        }

        public DbSet<Person> Person { get; set; } 
    }
}
