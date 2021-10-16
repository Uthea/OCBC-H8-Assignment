using System;

namespace Movies.Models
{
    public class Movie
    {
        public int Id {get; set;}
        public string Name {get; set;}
        public string Genre {get; set;}

        public string Duration {get; set;}

        public DateTime _ReleaseDate;

        public string ReleaseDate {
            get {return _ReleaseDate.ToString();} 
            set
            {
                _ReleaseDate = DateTime.Parse(value);
            }
        }
    }
}