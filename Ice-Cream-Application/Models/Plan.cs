namespace Ice_Cream_Application.Models
{
    public class Plan
    {
        public long id { get; set; }
        public string name { get; set; }
        public long numberOfMonth { get; set; }
        public long price { get; set; }
        public string status { get; set; }
        public DateTime date { get; set; }
        public DateTime last { get; set; }

    }
}
