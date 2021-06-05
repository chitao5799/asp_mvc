using System.Web;
using System.Web.Optimization;

namespace OnlineShop
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //sử dụng bundle để tối ưu css và js cho việc load trang nhanh hơn
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                        "~/Assets/Client/js/jquery-3.3.1.js",
                        "~/Assets/Client/js/bootstrap3.min.js",
                        "~/Assets/Client/js/move-top.js",
                        "~/Assets/Client/js/easing.js",
                        "~/Assets/Client/js/startstop-slider.js",
                        "~/Assets/Client/js/jquery-ui.js"));

            bundles.Add(new ScriptBundle("~/bundles/jsController").Include(
                      "~/Assets/Client/js/Controller/BaseController.js"));

            //bundles.Add(new StyleBundle("~/bundles/css").Include(
            //          "~/Assets/Client/css/bootstrap3.3.7.min.css",
            //          "~/Assets/Client/css/style.css",
            //          "~/Assets/Client/css/slider.css",
            //          "~/Assets/Client/font-awesome-4.7.0/css/font-awesome.min.css",
            //          "~/Assets/Client/css/jquery-ui.css",
            //          "~/Assets/Client/css/BootstrapScocial.css")
            bundles.Add(new StyleBundle("~/bundles/css").Include(
                      "~/Assets/Client/css/*.css",
                      new CssRewriteUrlTransform()));//cách này để ngăn lỗi ko load được 1 số icon (error 404)

            BundleTable.EnableOptimizations = true;
        }
    }
}
