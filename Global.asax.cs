using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Group_C_Autoshop
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void SessionStart(object sender, EventArgs e)
        {
            //Initializing the session's variables
            //Vehicle
            Session["chassis"] = "";

            //Additions
            Session["Track"] = "";
            Session["Alarm"] = "";
            Session["Radio"] = "";
            Session["Price"] = "";

            //Spare Parts
            Session["Name"] = "";
            Session["Quantity"] = "";
            Session["Total"] = "";
        }
    }
}