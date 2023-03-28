using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Group_C_Autoshop.UserRoles
{
    public partial class EmployeeLogin : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["Car_Mart_Web_AppConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec ELogin @ID, @password";
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(EmpIDTxt.Text));
            cmd.Parameters.AddWithValue("@password", PassTxt.Text);

            string result = cmd.ExecuteScalar().ToString();

            //Getting the user role
            cmd.CommandText = "Select User_Role from Employee_Login_Details Where Employee_ID = @EmpID";
            cmd.Parameters.AddWithValue("@EmpID", Convert.ToInt32(EmpIDTxt.Text));

            if (result == "First Time Login: Please change your password")
            {
                Session["User"] = EmpIDTxt.Text;
                //Get the role of the employee
                Session["ERole"] = cmd.ExecuteScalar().ToString();
                //Change user password for first login
                Response.Redirect("/Default");
                
            }
            else if (result == "Admin_Personnel")
            {
                Session["User"] = EmpIDTxt.Text;
                Session["ERole"] = "Admin_Personnel";
                Response.Redirect("/Default");
            }
            else if(result == "Mechanic")
            {
                Session["User"] = EmpIDTxt.Text;
                Session["ERole"] = "Mechanic";
                Response.Redirect("/Default");
            }
            else if(result == "Salesman")
            {
                Session["User"] = EmpIDTxt.Text;
                Session["ERole"] = "Salesman";
                Response.Redirect("/Default");
            }
            else
            {
                Literal1.Text = result;
            }

        }
    }
}