using Ice_Cream_Application.Models;
using Microsoft.EntityFrameworkCore;
public class IceCreamContext : DbContext
{
    public IceCreamContext(DbContextOptions<IceCreamContext> options) : base(options) { }
    public DbSet<Plan> Plan { get; set; }
    public DbSet<User> User { get; set; }
    public DbSet<Membership> Membership { get; set; }

}

