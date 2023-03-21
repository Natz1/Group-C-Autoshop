using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Group_C_Autoshop.Models;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace Group_C_Autoshop.Account
{
    public partial class Register : Page
    {
        //Make new SQL Connection
        SqlConnection con = new SqlConnection(@"Data Source=NATZ\NIA;Initial Catalog=Car_Mart_Web_App;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = CEmailTxt.Text, Email = CEmailTxt.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                //Save client info
                ClientData.Insert();

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Exec Add_Password_Pin_Client @username, @password, @pin";
                cmd.Parameters.Add("@username", SqlDbType.VarChar);
                cmd.Parameters["@username"].Value = CEmailTxt.Text;
                Console.WriteLine(CEmailTxt.Text);

                cmd.Parameters.Add("@password", SqlDbType.VarChar);
                cmd.Parameters["@password"].Value = Password.Text;
                Console.WriteLine(Password.Text);

                cmd.Parameters.Add("@pin", SqlDbType.Char);
                cmd.Parameters["@pin"].Value = PIN.Text;
                Console.WriteLine(PIN.Text);
                cmd.ExecuteNonQuery();
                

                //************************When user registers assign the role user to them
                manager.AddToRole(user.Id, "enduser");
                

                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

            
        }
    }
}