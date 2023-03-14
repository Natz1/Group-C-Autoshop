using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.UserRoles.EndUser
{
    public partial class ScheduleRepair : System.Web.UI.Page
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

            String com = "Select Mechanic_ID From Mechanic";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            mechanic.DataSource = ds;
            mechanic.DataValueField = "Mechanic_ID";
            mechanic.DataBind();

            ds.Dispose();
        }

        protected void Schedule_Click(object sender, EventArgs e)
        {
            RepairOrder.Insert();
        }
    }
}