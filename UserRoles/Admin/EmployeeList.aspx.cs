using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;
using Group_C_Autoshop.Models;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;
using System.Web.Configuration;

namespace Group_C_Autoshop.Admin
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["Car_Mart_Web_AppConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();



            EmpData.Insert();

            //Employee log in stored procedure
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select MAX(Employee_ID) from Employee";
            int ID = Convert.ToInt32(cmd.ExecuteScalar());

            //Run stored procedure
            cmd.CommandText = "Exec Add_Password_Employee @username, @password";
            cmd.Parameters.Add("@username", SqlDbType.Int);
            cmd.Parameters["@username"].Value = ID;

            cmd.Parameters.Add("@password", SqlDbType.VarChar);
            cmd.Parameters["@password"].Value = "Password123!";
            cmd.ExecuteNonQuery();

            Response.Redirect("EmployeeList");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            AdminData.Update();
            Response.Redirect("EmployeeList");
        }
    }
}