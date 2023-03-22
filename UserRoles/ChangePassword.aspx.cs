using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.UserRoles
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["Car_Mart_Web_AppConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            //Adding employee password
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec Add_Password_Employee @ID, @password";
            //Response.Write("<script language=javascript>alert('" + str + "');</script>");
            cmd.Parameters.AddWithValue("@ID", int.Parse(Session["User"].ToString()));
            cmd.Parameters.AddWithValue("@password", Password.Text);

            string result = cmd.ExecuteScalar().ToString();

            if (result == "Password was added Successfuly")
            {
                Result.Text = "Successfully changed password.";
            }
            else
            {
                Result.Text = "Password change was unsuccessful.";
            }
        }
    }
}