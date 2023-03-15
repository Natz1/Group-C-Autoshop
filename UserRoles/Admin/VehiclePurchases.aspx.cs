using Group_C_Autoshop.UserRoles.EndUser;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Reflection;

namespace Group_C_Autoshop.UserRoles
{
    public partial class VehiclesPurchases : System.Web.UI.Page
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

        protected void Add_Click(object sender, EventArgs e)
        {
            //Create a command to save values
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Insert into Vehicle Values ('" + ChassisTxt.Text + "', '" + YrTxt.Text + "', '" + ColourTxt.Text + "', '" + MakeTxt.Text +
                "','" + ModTxt.Text + "','" + TypeTxt.Text + "','" + ConTxt.Text + "','" + ImportTxt.Text + "','" + MarkUpTxt.Text +
                "','" + EngineTxt.Text + "','" + CCTxt.Text + "','" + MileTxt.Text + "','" + SoldTxt.Text + "')";
            cmd.ExecuteNonQuery();

            cmd.CommandText =
                "Insert into Purchase (Date, Value, Cost, Salesman_ID, Chassis_Number) Values ('" + DateTxt.Text + "', '" + 
                ValueTxt.Text + "', '" + CostTxt.Text + "','" + SalesmanTxt.Text + "','" + ChassisTxt.Text + "')";
            cmd.ExecuteNonQuery();

            Response.Redirect("VehiclePurchases");
        }
    }
}