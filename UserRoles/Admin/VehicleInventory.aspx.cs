using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Group_C_Autoshop.EndUser
{
    public partial class VehicleInventory : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Add1_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["Car_Mart_Web_AppConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            if (IsPostBack)
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText =
                    "UPDATE Car SET Seating_Capacity = @seat WHERE Chassis_Number = @chassis";
                //Chassis
                cmd.Parameters.Add("@chassis", SqlDbType.Char);
                cmd.Parameters["@chassis"].Value = Chassis1.Text;
                //Seat
                cmd.Parameters.Add("@seat", SqlDbType.Int);
                cmd.Parameters["@seat"].Value = Convert.ToInt32(Seat1.Text);
                cmd.ExecuteNonQuery();

                cmd.CommandText =
                    "UPDATE Car SET Wheel_Drive = @wheel WHERE Chassis_Number = @chassis";
                //Wheel
                cmd.Parameters.Add("@wheel", SqlDbType.Char);
                cmd.Parameters["@wheel"].Value = Wheel1.Text;
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("VehicleInventory");
        }

        protected void Add2_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
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
                cmd.CommandText =
                    "UPDATE Four_WD SET Seating_Capacity = @seat,Fuel = @fuel, Vehicle_Size = @size WHERE Chassis_Number = @chassis";
                //Chassis
                cmd.Parameters.Add("@chassis", SqlDbType.Char);
                cmd.Parameters["@chassis"].Value = Chassis2.Text;
                //Update
                cmd.Parameters.Add("@seat", SqlDbType.Int);
                cmd.Parameters["@seat"].Value = Convert.ToInt32(Seat2.Text);

                cmd.Parameters.Add("@fuel", SqlDbType.VarChar);
                cmd.Parameters["@fuel"].Value = Fuel2.Text;

                cmd.Parameters.Add("@size", SqlDbType.VarChar);
                cmd.Parameters["@size"].Value = Size2.Text;
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("VehicleInventory");
        }

        protected void Add3_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
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
                cmd.CommandText =
                    "UPDATE Van SET Haulage_Size = @haulage,Max_Clearance = @max WHERE Chassis_Number = @chassis";
                //Chassis
                cmd.Parameters.Add("@chassis", SqlDbType.Char);
                cmd.Parameters["@chassis"].Value = Chassis3.Text;
                //Update
                cmd.Parameters.Add("@haulage", SqlDbType.VarChar);
                cmd.Parameters["@haulage"].Value = Haulage3.Text;

                cmd.Parameters.Add("@max", SqlDbType.VarChar);
                cmd.Parameters["@max"].Value = Max3.Text;
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("VehicleInventory");
        }
    }
}