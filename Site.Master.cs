using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group_C_Autoshop.Account;
using Group_C_Autoshop.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Win32;

namespace Group_C_Autoshop
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            String currentUser = HttpContext.Current.User.Identity.Name.ToString();
            //Saving username to session
            Session["User"] = currentUser;

            //***********************Creating roles
            var roleManager = Context.GetOwinContext().Get<ApplicationRoleManager>();
            string name = "admin";
            //***********************Checking if the role is already present
            var search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "1";
                roles.Name = "admin";
                IdentityResult result = roleManager.Create(roles);
            }

            name = "enduser";
            //***********************Checking if the role is already present
            search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "2";
                roles.Name = "enduser";
                IdentityResult result = roleManager.Create(roles);
            }

            name = "manager";
            //***********************Checking if the role is already present
            search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "3";
                roles.Name = "manager";
                IdentityResult result = roleManager.Create(roles);
            }

            name = "salesman";
            //***********************Checking if the role is already present
            search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "4";
                roles.Name = "salesman";
                IdentityResult result = roleManager.Create(roles);
            }

            name = "mechanic";
            //***********************Checking if the role is already present
            search = roleManager.FindByName(name);
            if (search == null)
            {
                IdentityRole roles = new IdentityRole();
                roles.Id = "5";
                roles.Name = "mechanic";
                IdentityResult result = roleManager.Create(roles);
            }





            //***********************Creating admin user
            var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();
            string email = "admin@gmail.com";
            //***********************Check if user is already present
            var search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "admin@gmail.com",
                    Email = "admin@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Admin123!"); //Password
                userManager.AddToRole(user.Id, "admin");
            }

            //***********************Creating admin user
            userManager = Context.GetOwinContext().Get<ApplicationUserManager>();
            email = "manager@gmail.com";
            //***********************Check if user is already present
            search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "manager@gmail.com",
                    Email = "manager@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Man123!"); //Password
                userManager.AddToRole(user.Id, "manager");
            }

            //***********************Creating admin user
            email = "salesman@gmail.com";
            //***********************Check if user is already present
            search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "salesman@gmail.com",
                    Email = "salesman@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Sale123!"); //Password
                userManager.AddToRole(user.Id, "salesman");
            }

            //***********************Creating admin user
            email = "mechanic@gmail.com";
            //***********************Check if user is already present
            search1 = userManager.FindByEmail(email);
            if (search1 == null)
            {
                var user = new ApplicationUser()
                {
                    UserName = "mechanic@gmail.com",
                    Email = "mechanic@gmail.com"
                };
                IdentityResult result = userManager.Create(user, "Mec123!"); //Password
                userManager.AddToRole(user.Id, "mechanic");
            }



            //***********************Make navigation invisible
            admin.Visible = false;
            admin1.Visible = false;
            admin2.Visible = false;
            admin3.Visible = false;
            admin5.Visible = false;

            manager1.Visible = false;
            manager2.Visible = false;
            manager3.Visible = false;
            manager4.Visible = false;
            manager5.Visible = false;
            manager6.Visible = false;

            salesman1.Visible = false;
            salesman2.Visible = false;
            salesman3.Visible = false;

            mechanic1.Visible= false;
            mechanic2.Visible= false;
            mechanic3.Visible= false;

            //***********************Make navigation visible depending on user role
            if (Context.User.IsInRole("admin") || Session["ERole"].ToString() == "Admin_Personnel")
            {
                admin.Visible = true;
                admin1.Visible = true;
                admin2.Visible = true;
                admin3.Visible = true;
                admin5.Visible = true;

                enduser1.Visible = false;
                enduser3.Visible = false;
                enduser4.Visible = false;
                enduser5.Visible = false;

                general1.Visible = false;
                general2.Visible = false;
            }

            if (Context.User.IsInRole("manager"))
            {
                manager1.Visible = true;
                manager2.Visible = true;
                manager3.Visible = true;
                manager4.Visible = true;
                manager5.Visible = true;
                manager6.Visible = true;

                enduser1.Visible = false;
                enduser3.Visible = false;
                enduser4.Visible = false;
                enduser5.Visible = false;

                general1.Visible = false;
                general2.Visible = false;
            }

            if (Context.User.IsInRole("salesman") || Session["ERole"].ToString() == "Salesman")
            {
                salesman1.Visible = true;
                salesman2.Visible = true;
                salesman3.Visible = true;

                enduser1.Visible = false;
                enduser3.Visible = false;
                enduser4.Visible = false;
                enduser5.Visible = false;

                general1.Visible = false;
                general2.Visible = false;
            }

            if (Context.User.IsInRole("mechanic") || Session["ERole"].ToString() == "Mechanic")
            {
                mechanic1.Visible = true;
                mechanic2.Visible = true;   
                mechanic3.Visible = true;

                enduser1.Visible = false;
                enduser3.Visible = false;
                enduser4.Visible = false;
                enduser5.Visible = false;

                general1.Visible = false;
                general2.Visible = false;
            }

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}