using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class ContentController : Controller
    {
        // GET: Content
        public ActionResult Index(int pageIndex=1, int pageSize=5)
        {
            int totalRecord = 0;
            var model = new ContentDao().ListAllPaging(pageIndex, pageSize,ref totalRecord);
            
            ViewBag.Total = totalRecord;
            ViewBag.Page = pageIndex;

            int maxPage = 5; // số thứ tự trang tối đa hiển thị phần link phân trang.
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((Double)totalRecord / (Double)pageSize); //Ceiling làm tròn lên
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = pageIndex + 1;
            ViewBag.Prev = pageIndex - 1;
            return View(model);
        }

        public ActionResult Detail(long contentId)
        {
            var model = new ContentDao().GetByID(contentId);
            ViewBag.ListTag = new ContentDao().ListTag(contentId);
            return View(model);
        }

        public ActionResult Tag(string tagID, int pageIndex = 1, int pageSize = 5)
        {
            int totalRecord = 0;
            var model = new ContentDao().ListAllByTag(tagID,pageIndex, pageSize,ref totalRecord);
            
            ViewBag.Total = totalRecord;
            ViewBag.Page = pageIndex;
            ViewBag.Tag = new ContentDao().GetTag(tagID);
            int maxPage = 5; // số thứ tự trang tối đa hiển thị phần link phân trang.
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((Double)totalRecord / (Double)pageSize); //Ceiling làm tròn lên
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = pageIndex + 1;
            ViewBag.Prev = pageIndex - 1;
            return View(model);
        }
    }
}