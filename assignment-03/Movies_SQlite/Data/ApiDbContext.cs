using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Movies.Models;

namespace Movies.Data
{
    public class ApiDbContext : IdentityDbContext
    {
       public virtual DbSet<Movie> Items {get; set;}

       public ApiDbContext(DbContextOptions<ApiDbContext> options) 
        : base(options)
       {

       }
    }
}