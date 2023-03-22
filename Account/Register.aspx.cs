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
using System.Web.Configuration;

namespace Group_C_Autoshop.Account
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["Car_Mart_Web_AppConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();



            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
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
                

                cmd.Parameters.Add("@password", SqlDbType.VarChar);
                cmd.Parameters["@password"].Value = Password.Text;
                

                cmd.Parameters.Add("@pin", SqlDbType.Char);
                cmd.Parameters["@pin"].Value = PIN.Text;
                
                cmd.ExecuteNonQuery();
                

                //************************When user registers assign the role user to them
                manager.AddToRole(user.Id, "enduser");
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

            
        }
    }
}