using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
namespace OnlineShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryDao().ListAll();
            return PartialView(model);
        }

        public ActionResult Category(long cateId, string metatitle, int page = 1, int pageSize=2)
        {
            ViewBag.Category = new CategoryDao().ViewDetail(cateId);
            int totalRecord = 0;
            var model = new ProductDao().ListByCategoryID(cateId,ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5; // số thứ tự trang tối đa hiển thị phần link phân trang.
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((Double)totalRecord / (Double)pageSize); //Ceiling làm tròn lên
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        //[OutputCache(Duration =int.MaxValue, VaryByParam = "productId",Location = System.Web.UI.OutputCacheLocation.Server)] //cache cho từng productId
        [OutputCache(CacheProfile = "Cache1DayForProduct")] //cách 2 . các thuộc tính của cache được set ở file web.config, có thể tái sử dụng
        public ActionResult Detail(long productId)
        {
            var product = new ProductDao().ViewDetail(productId);
            ViewBag.Category = new ProductCategoryDao().ViewDetail(product.CategoryID.Value);
            ViewBag.RelateProduct = new ProductDao().ListRelateProduct(productId);
            return View(product);
        }

        public JsonResult ListName(string term)
        {
            var _data = new ProductDao().ListNam(term);
            return Json(new {
                data= _data,
                status=true
            },JsonRequestBehavior.AllowGet);
        }

        public ActionResult Search(string keywords, string metatitle, int page = 1, int pageSize = 2)
        {
            int totalRecord = 0;
            var model = new ProductDao().Search(keywords, ref totalRecord, page, pageSize);

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5; // số thứ tự trang tối đa hiển thị phần link phân trang.
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((Double)totalRecord / (Double)pageSize); //Ceiling làm tròn lên
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;
            ViewBag.keywords = keywords;

            return View(model);
        }
    }
}