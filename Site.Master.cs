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
            var userManager1 = Context.GetOwinContext().Get<ApplicationUserManager>();
            string email1 = "manager@gmail.com";
            //***********************Check if user is already present
            var search2 = userManager.FindByEmail(email1);
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


            //***********************Make navigation invisible
            admin.Visible = false;
            admin1.Visible = false;
            admin2.Visible = false;
            admin3.Visible = false;
            admin4.Visible = false;
            admin5.Visible = false;
            manager1.Visible = false;

            //***********************Make navigation visible depending on user role
            if (Context.User.IsInRole("admin"))
            {
                admin.Visible = true;
                admin1.Visible = true;
                admin2.Visible = true;
                admin3.Visible = true;
                admin4.Visible = true;
                admin5.Visible = true;

                enduser1.Visible = false;
                enduser3.Visible = false;
                enduser4.Visible = false;
                enduser5.Visible = false;
                enduser6.Visible = false;
            }

            if (Context.User.IsInRole("manager"))
            {
                manager1.Visible = true;

                enduser1.Visible = false;
                enduser3.Visible = false;
                enduser4.Visible = false;
                enduser5.Visible = false;
                enduser6.Visible = false;
            }

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}