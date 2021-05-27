using OnlineShop.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using OnlineShop.Areas.Admin.Code;
using System.Web.Security;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        [HttpGet]  //có thể gọi nhận từ url
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]//server sinh ra 1 token, client có 1 token tương tự. Đảm bảo request, respone đồng bộ, chống request liên tục
        public ActionResult Index(LoginModel model)
        {
            /*cách 1: setSession
             * var result = new AccountModel().Login(model.userName, model.password);
            if(result && ModelState.IsValid)*/
            if (Membership.ValidateUser(model.userName,model.password) && ModelState.IsValid)
            {
                //SessionHelper.SetSession(new UserSession() { UserName = model.userName });//cách 1
                FormsAuthentication.SetAuthCookie(model.userName, model.RememberMe);
                return RedirectToAction("Index", "Home");

            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không chính xác");
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Login");
        }
    }
}