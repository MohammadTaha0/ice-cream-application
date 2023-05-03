using Ice_Cream_Application.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Numerics;
using System.Security.Cryptography;
using System.Text;

namespace Ice_Cream_Application.Controllers
{
	public class AuthController : Controller
	{
        private readonly IceCreamContext _db;

        public AuthController(IceCreamContext dbContext)
        {
            _db = dbContext;
        }
        public IActionResult Login()
		{
			return View();
		}
		public IActionResult Register()
		{
			var plans = _db.Plan.ToList();
            return View(plans);
		}
        [HttpPost]
        public IActionResult Register([FromBody] User user, string planId)
        {
            return Json(planId);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var checkEmail = _db.User.Any(x => x.email == user.email);
            // check if email is already registered
            if (checkEmail)
            {
                ModelState.AddModelError("email", "Email Address already registered.");
                return BadRequest(ModelState);
            }else if (_db.User.Any(x => x.contact == user.contact))
            {
                ModelState.AddModelError("contact", "Contact already registered.");
                return BadRequest(ModelState);
            }

            // hash the password
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Convert the password to a byte array and compute the hash.
                byte[] passwordBytes = Encoding.UTF8.GetBytes(user.password);
                byte[] hashBytes = sha256Hash.ComputeHash(passwordBytes);

                // Convert the hash to a base64-encoded string and store it in the database.
                string passwordHash = Convert.ToBase64String(hashBytes);
                user.password = passwordHash;
            }
            var newuser = new User
            {
                name= user.name,
                email= user.email,
                contact= user.contact,
                address= user.address,
                password=user.password,
                status="1",
            };
            _db.Add(newuser);
            _db.SaveChanges();
            User users = _db.User.SingleOrDefault(u => u.email == user.email);
            if (users != null)
            {
                long userId = users.id;
            
                var newplan = new Membership{
                    userId = userId,
                    planId = planId,
            };
            }
            return Json(new { status = true, msg = "Register Successfully!", data=user, newUser = newuser});
        }
    }
}
