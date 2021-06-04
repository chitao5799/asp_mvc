using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using OnlineShop.Common;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ContentController : BaseController
    {
        // GET: Admin/Content
        public ActionResult Index(string searchString, int page = 1, int pageSize = 2)
        {
            var dao = new ContentDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            //truyền giá trị từ controller cho view
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]//vì có 1 trường có giá trị html nên có cái này cho ko báo lỗi.
        public ActionResult Create(Content model)
        {
            if (ModelState.IsValid)
            {
                var session =(UserLogin)Session[CommonConstants.USER_SESSION];
                model.CreateBy = session.UserName;
                var culture =Session[CommonConstants.CurrentCulture];
                model.Language = culture.ToString();
                new ContentDao().Create(model);
                return RedirectToAction("Index");
            }
            SetViewBag();
            return View();
        }

        public void SetViewBag(long? selectedId=null)
        {
            var dao = new CategoryDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
            // bên file .cshtml chỗ model.CategoryID sẽ tự động nhận được ViewBag.CategoryID vì tên biến giống nhau là CategoryID
        }

        [HttpGet]
        public ActionResult Edit(long id)
        {
            var dao =new ContentDao();
            var content = dao.GetByID(id);

            SetViewBag(content.CategoryID);
            return View(content);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Content model)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session[CommonConstants.USER_SESSION];
                model.ModifiedBy = session.UserName;
                new ContentDao().Edit(model);
            }
            SetViewBag();
            return RedirectToAction("Index");
        }
    }
}