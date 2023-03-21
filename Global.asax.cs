using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
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

        void Session_Start(object sender, EventArgs e)
        {
            Response.Redirect("/Default.aspx");
            //Initializing the session's variables

            //User
            Session["User"] = "";

            //Role
            Session["ERole"] = "";
            //Vehicle
            Session["chassis"] = "";

            //Additions
            Session["Track"] = "No";
            Session["Alarm"] = "No";
            Session["Radio"] = "No";
            Session["APrice"] = "0.00";

            //Spare Parts
            Session["Parts"] = new Parts[11]; ;
        }
    }
}