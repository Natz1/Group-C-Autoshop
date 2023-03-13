using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.EndUser
{
    public partial class Additions : System.Web.UI.Page
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

        //Tracking Device
        protected void TrackBuy_Click(object sender, EventArgs e)
        {
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Insert into Add_on (Radio_Installation, Car_Alarm, Tracking_Device, Cost) values('" + "No" + "','" + "No" + "','" + "Yes" + "', '" + Price1.Text + "')";
            cmd.ExecuteNonQuery();
        }

        //Car Alarm
        protected void AlarmBuy_Click(object sender, EventArgs e)
        {
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Insert into Add_on (Radio_Installation, Car_Alarm, Tracking_Device, Cost) values('" + "No" + "','" + "Yes" + "','" + "No" + "', '" + Price2.Text + "')";
            cmd.ExecuteNonQuery();
        }

        //Radio
        protected void RadioBuy_Click(object sender, EventArgs e)
        {
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Insert into Add_on (Radio_Installation, Car_Alarm, Tracking_Device, Cost) values('" + "Yes" + "', '" + "No" + "','" + "No" + "','" + Price3.Text + "')";
            cmd.ExecuteNonQuery();
        }
    }
}