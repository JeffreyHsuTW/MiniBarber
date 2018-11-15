using System.Web;
using System.Web.Optimization;

namespace MiniBarber.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            #region CSS

            // Bootstrap core CSS
            bundles.Add(new StyleBundle("~/Content/BootstrapCore").Include(
                      "~/Content/vendor/bootstrap/css/bootstrap.min.css"));

            // Custom fonts for this template
            bundles.Add(new StyleBundle("~/Content/CustomFonts").Include(
                      "~/Content/vendor/fontawesome-free/css/all.min.css"));

            // Page level plugin CSS

            bundles.Add(new StyleBundle("~/Content/PageLevelPlugin").Include(
                      "~/Content/vendor/datatables/dataTables.bootstrap4.css"));

            // Custom styles for this template
            bundles.Add(new StyleBundle("~/Content/CustomStyles").Include(
                      "~/Content/css/sb-admin.css"));

            #endregion

            #region Javascript

            // Bootstrap core JavaScript
            bundles.Add(new ScriptBundle("~/bundles/BootstrapCore").Include(
                        "~/Content/vendor/jquery/jquery.min.js",
                        "~/Content/vendor/bootstrap/js/bootstrap.bundle.min.js"));

            // Core plugin JavaScript
            bundles.Add(new ScriptBundle("~/bundles/CorePlugin").Include(
                        "~/Content/vendor/jquery-easing/jquery.easing.min.js"));

            // Page level plugin JavaScript
            bundles.Add(new ScriptBundle("~/bundles/PageLevelPlugin").Include(
                        "~/Content/vendor/chart.js/Chart.min.js",
                        "~/Content/vendor/datatables/jquery.dataTables.js",
                        "~/Content/vendor/datatables/dataTables.bootstrap4.js"));

            // Custom scripts for all pages
            bundles.Add(new ScriptBundle("~/bundles/CustomScripts").Include(
                        "~/Content/js/sb-admin.min.js"));

            // Demo scripts for this page
            bundles.Add(new ScriptBundle("~/bundles/DemoScripts").Include(
                        "~/Content/js/demo/datatables-demo.js",
                        "~/Content/js/demo/chart-area-demo.js"));

            #endregion

            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            //// Use the development version of Modernizr to develop with and learn from. Then, when you're
            //// ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js"));

            //bundles.Add(new StyleBundle("~/Content/css").Include(
            //          "~/Content/bootstrap.css",
            //          "~/Content/site.css"));
        }
    }
}
