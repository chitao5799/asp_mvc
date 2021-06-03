using OnlineShop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading;
using System.Globalization;
using System.Web.Routing;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];

            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary(new { controller = "Login", action = "Index", Area = "Admin" }));
            }
             
            base.OnActionExecuting(filterContext);
        }

        protected void SetAlert(string message, string type)
        {
            //TempData 1 cách truyền dữ liệu từ server cho client
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }

        //initilizing culture on controller initialization
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (Session[CommonConstants.CurrentCulture] != null)
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(Session[CommonConstants.CurrentCulture].ToString());
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Session[CommonConstants.CurrentCulture].ToString());
            }
            else
            {
                Session[CommonConstants.CurrentCulture] = "vi";
                Thread.CurrentThread.CurrentCulture = new CultureInfo("vi");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("vi");
            }
        }

        /// <summary>
        /// - Thay đổi ngôn ngữ dựa theo ký hiệu của tên file resource: Resources.<ký-hiệu>.resx
        /// - ví dụ ký hiệu là 'en' sẽ lấy value ở file 'Resources.en.resx'
        /// - ví dụ truyền vào hàm các ký hiệu không có sẵn: 'kj' , 'tr', .... tức là chưa có file tương ứng với các 
        /// ký hiệu đó, thì sẽ lấy value ở file 'Resources.resx'
        /// - Mỗi trường Name ở các file resource đều phải có
        /// </summary>
        /// <param name="ddlCulture">lưu ký hiệu của ngôn ngữ, vd: vn hoặc en</param>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        // changing culture
        public ActionResult ChangeCulture(string ddlCulture, string returnUrl)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo(ddlCulture);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(ddlCulture);

            Session[CommonConstants.CurrentCulture] = ddlCulture;
            return Redirect(returnUrl);
        }
    }
}