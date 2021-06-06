using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using OnlineShop.Common;
using System.Web.Script.Serialization;
using System.Xml.Linq;

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

        //ví dụ lưu nhiều ảnh kiểu xml trong db, thường áp dụng cho page chi tiết sản phẩm
        public JsonResult SaveImages(long id, string images)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var listImages = serializer.Deserialize<List<string>>(images);

            XElement xElement = new XElement("Images");

            foreach(var item in listImages)
            {
                var subStringItem = item.Substring(22);//cắt 22 ký tự đầu tiên
                xElement.Add(new XElement("Image", subStringItem));
            }

            ContentDao dao = new ContentDao();
            try
            {
                dao.UpdateImages(id, xElement.ToString());
                return Json(new
                    {
                        status = true
                    });
            }catch(Exception)
            {
                return Json(new
                {
                    status = false
                });
            }
        }

        public JsonResult LoadImage(long id)
        {
            ContentDao dao = new ContentDao();
            var content = dao.GetByID(id);
            var images = content.MoreImages;
            XElement xImages = XElement.Parse(images);
            List<string> listImagesReturn = new List<string>();
            foreach(XElement element in xImages.Elements())
            {
                listImagesReturn.Add(element.Value);
            }
            return Json(new
            {
                data = listImagesReturn
            }, JsonRequestBehavior.AllowGet);
        }
    }
}