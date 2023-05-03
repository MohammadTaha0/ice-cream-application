using System.ComponentModel.DataAnnotations;

namespace Ice_Cream_Application.Models
{
    public class User
    {
        public long id { get; set; }
        [Required]
        [MinLength(4)]
        public string name{ get; set; }
        [Required]
        [EmailAddress]
        public string email { get; set; }
        [Required]
        [MinLength(4)]
        public string password { get; set; }
        [Required]
        [MinLength(11)]
        [MaxLength(15)]
        public string contact { get; set; }
        [Required]
        public string address { get; set; }
        public string status { get; set; }
        public DateTime date { get; set; }
        public DateTime last { get; set; }

    }
}
