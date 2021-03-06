using Model.Dao;
using OnlineShop.Areas.Admin.Models;
using OnlineShop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.userName,Encryptor.MD5Hash(model.password),true);
                if (result==1)
                {
                    var user = dao.GetByID(model.userName);
                    UserLogin userSession = new UserLogin();
                    userSession.UserID = user.ID;
                    userSession.UserName = user.UserName;
                    userSession.GroupID = user.GroupID;
                    var listCredential = dao.GetListCredential(model.userName);
                    Session.Add(CommonConstants.SESSION_CREDENTIAL, listCredential);
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if(result==0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa");
                }
                else if(result == -2)
                {
                    ModelState.AddModelError("", "Sai mật khẩu");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản không có quyền đăng nhập");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                }
            }
            return View("Index");
        }

    }
}