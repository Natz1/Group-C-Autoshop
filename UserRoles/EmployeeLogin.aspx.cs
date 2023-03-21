using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.UserRoles
{
    public partial class EmployeeLogin : System.Web.UI.Page
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

        protected void Login_Click(object sender, EventArgs e)
        {
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
                Response.Write("<script>alert('Employee successfully logged in.')</script");
                Session["User"] = EmpIDTxt.Text;
                //Get the role of the employee
                Session["ERole"] = cmd.ExecuteScalar().ToString();
                Response.Redirect("/Default");
                
            }
            else if (result == "Admin_Personnel")
            {
                Session["User"] = EmpIDTxt.Text;
                Session["ERole"] = "Admin_Personnel";
                Response.Write("<script>alert('Admin successfully logged in.')</script");
                Response.Redirect("/Default");
            }
            else if(result == "Mechanic")
            {
                Session["User"] = EmpIDTxt.Text;
                Session["ERole"] = "Mechanic";
                Response.Write("<script>alert('Mechanic successfully logged in.')</script");
                Response.Redirect("/Default");
            }
            else if(result == "Salesman")
            {
                Session["User"] = EmpIDTxt.Text;
                Session["ERole"] = "Salesman";
                Response.Write("<script>alert('Salesman successfully logged in.')</script");
                Response.Redirect("/Default");
            }
            else
            {
                Literal1.Text = result;
            }

        }
    }
}