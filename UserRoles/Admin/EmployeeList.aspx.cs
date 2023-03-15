using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.Admin
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=NATZ\NIA;Initial Catalog=Car_Mart_Web_App;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            //Creates employee dropdown list
            string com = "Select Employee_ID From Employee";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            EmpID.DataSource = ds;
            EmpID.DataValueField = "Employee_ID";
            EmpID.DataBind();

            ds.Dispose();

            //Creates supervisor dropdown list
            com = "Select Supervisor_ID From Employee";
            adpt = new SqlDataAdapter(com, con);
            ds = new DataSet();
            adpt.Fill(ds);
            SupTxt.DataSource = ds;
            SupTxt.DataValueField = "Supervisor_ID";
            SupTxt.DataBind();

            ds.Dispose();
        }

        protected void Add_Click(object sender, EventArgs e)
        {

            EmpData.Insert();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            AdminData.Update();
        }
    }
}