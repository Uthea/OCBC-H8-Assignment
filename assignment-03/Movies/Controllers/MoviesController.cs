using System.Threading.Tasks;
using Movies.Data;
using Movies.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;


namespace Movies.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MoviesController : ControllerBase
    {
        private readonly ApiDbContext _context;

        public MoviesController(ApiDbContext context)
        {
            _context = context;
        }


        [HttpGet]
        public async Task<IActionResult> GetMovies()
        {
            var results = await _context.Items.ToListAsync();

            return Ok(results);
        }

        [HttpPost]
        public async Task<IActionResult> CreateMovie(Movie data)
        {
            if(ModelState.IsValid)
            {
                await _context.Items.AddAsync(data);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetMovie", new {data.Id}, data);
            }

            return new JsonResult("Something wen wrong") {StatusCode = 500};
        }

        [HttpGet("{id}")]

        public async Task<IActionResult> GetMovie(int id)
        {
            var item = await _context.Items.FirstOrDefaultAsync(
                x => x.Id == id
            );

            if(item == null) return NotFound();

            return Ok(item);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateMovie(int id, Movie data)
        {
            //if (data.Id != id) return BadRequest();

            var item = await _context.Items.FirstOrDefaultAsync(
                    x => x.Id == id
            );

            if (item == null) return NotFound();

            item.Name = data.Name;
            item.Genre = data.Genre;
            item.Duration = data.Duration;
            item.ReleaseDate = data.ReleaseDate;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{id}")]

        public async Task<IActionResult> DeleteMovie(int id)
        {
            var item = await _context.Items.FirstOrDefaultAsync(
                x => x.Id == id
            );

            if(item == null) return NotFound();

            _context.Items.Remove(item);
            await _context.SaveChangesAsync();

            return Ok(item);

        }

    }
}