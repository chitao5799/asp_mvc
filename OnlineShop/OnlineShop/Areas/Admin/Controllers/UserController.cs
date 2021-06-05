using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.Common;
using PagedList;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        //tên của tham số phải giống name của phần tử form
        [HashCredential(RoleID = "VIEW_USER")]
        public ActionResult Index(string searchString, int page=1, int pageSize =2)
        {
            var dao = new UserDao();
            var model = dao.ListAllPaging(searchString,page, pageSize);
            //truyền giá trị từ controller cho view
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        [HashCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [HashCredential(RoleID = "ADD_USER")]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();

                User _user = dao.GetByID(user.UserName);
                if (_user != null )
                {
                    ModelState.AddModelError("", "Tài khoản này đã tồn tại, vui lòng nhập 1 tài khoản khác");
                    return View();
                }

                user.Password = Encryptor.MD5Hash(user.Password);
                long id = dao.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm user thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm user thất bại");
                }
            }
            return View();
        }

        [HttpGet]
        [HashCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            var user = new UserDao().ViewDetail(id);
            return View(user);
        }

        [HttpPost]
        [HashCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(User user)
        {
            var dao = new UserDao();
               
            var result = dao.Update(user);
            if (result)
            {
                SetAlert("Sửa user thành công", "success");
                return RedirectToAction("Index", "User");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật thất bại");
            }
           
            return View();
        }

        [HttpDelete]
        [HashCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            new UserDao().Delete(id);
            return RedirectToAction("Index");
        }

        [HttpPost]
        [HashCredential(RoleID = "EDIT_USER")]
        public JsonResult ChangeStatus(long userId)
        {
            var result = new UserDao().ChangeStatus(userId);
            return Json(new
            {
                userStatus = result
            });
        }
    }
}