using Ice_Cream_Application.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace Ice_Cream_Application.Controllers
{
    public class HomeController : Controller
    {
        //private readonly ILogger<HomeController> _logger;

        //public HomeController(ILogger<HomeController> logger)
        //{
        //    _logger = logger;
        //}
        private readonly IceCreamContext _db;

        public HomeController(IceCreamContext dbContext)
        {
            _db = dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Recipes()
        {
            return View();
        }
		public IActionResult Recipe()
		{
			return View();
		}
		public IActionResult SubmitRecipe()
		{
			return View();
		}
		public IActionResult Profile()
		{
			return View();
		}
		public IActionResult Search()
		{
			return View();
		}
		public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}