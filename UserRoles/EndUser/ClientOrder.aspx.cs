using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.UserRoles.EndUser
{
    public partial class ClientOrder : System.Web.UI.Page
    {
        //Get the client ID
        //Make new SQL Connection
        SqlConnection con = new SqlConnection(@"Data Source=NATZ\NIA;Initial Catalog=Car_Mart_Web_App;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            //If session variable is not empty
            if (!string.IsNullOrEmpty(Session["chassis"] as string))
            {
                String chassis = Session["chassis"].ToString();
                //Create a command to get the values from the database
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText =
                    "Select * from Vehicle where Chassis_Number = @chassis";
                cmd.Parameters.Add("@chassis", SqlDbType.Char);
                cmd.Parameters["@chassis"].Value = chassis;
                cmd.ExecuteNonQuery();

                //Store details in grid view
                DataTable dt = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.Fill(dt);
                VehicleList.DataSource = dt;
                VehicleList.DataBind();
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //Insert into sales table values**********************************
            //Create a command to insert the values into the database
            /*SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Insert into Sale values()";
            cmd.ExecuteNonQuery();*/

            //Redirect to Invoice Page
            Response.Redirect("ClientInvoice");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            //Cancel runs a deletion operation from the Additions and Parts Changed table
            //Create a command to remove the values from the database
            /*SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Delete from Add_on where Job_Number = (SELECT Max(Job_Number) FROM Add_on)";
            cmd.ExecuteNonQuery();

            cmd.CommandText =
                "Delete from Part_Changed where Job_Number = (SELECT Max(Job_Number) FROM Part_Changed)";
            cmd.ExecuteNonQuery();*/
            Response.Redirect("ClientOrder");
        }
    }
}