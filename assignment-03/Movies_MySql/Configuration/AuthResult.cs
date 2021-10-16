using System.Collections.Generic;

namespace Movies.Configuration
{
    public class AuthResult
    {
        public string Token {get; set;}
        public bool Success {get; set;}
        public List<string> Errors {get; set;}
    }
}