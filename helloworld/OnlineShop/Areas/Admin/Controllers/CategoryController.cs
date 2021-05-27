using Model;
using Model.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Admin/Category
        public ActionResult Index()
        {
            var iplCate = new CategoryModel();
            var model = iplCate.ListAll();
            return View(model);
        }

        // GET: Admin/Category/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/Category/Create    //khi truy cập trang create lần đầu sẽ vào hàm này
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create     // sau khi ấn submit ở trang create thì vào hàm này
        [HttpPost]
        [ValidateAntiForgeryToken] //kiểm tra token ở server và client phải giống nhau, tránh request nhiều lần liên tục-hack
        public ActionResult Create(Category collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new CategoryModel();
                    int res = model.Create(collection.Name, collection.Alias, collection.ParentID, collection.Order, collection.Status);
                    if(res>0)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Thêm mới không thành công");
                    }
                    
                }

                return View(collection);
                
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Category/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Category/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/Category/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
