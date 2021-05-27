using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using helloworld.Models;

namespace helloworld.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult MyIndex()
        {
            var message = new MessageModel();
            message.welcome = "xin chào hello ";

            ViewBag.mess = "helllo--- viewbag";
            return View(message);
        }
    }
}