namespace Ice_Cream_Application.Models
{
    public class Membership
    {
        public long id { get; set; }
        public long userId { get; set; }
        public long planId { get; set; }
        public long methodId { get; set; }
        public DateTime date { get; set; }
        public DateTime last { get; set; }
    }
}
