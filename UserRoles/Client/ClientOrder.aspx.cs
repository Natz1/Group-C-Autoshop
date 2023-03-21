using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Infrastructure;
using Newtonsoft.Json.Linq;
using System.Security.Claims;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using Group_C_Autoshop.UserRoles.Manager;
using Microsoft.AspNet.Identity;

namespace Group_C_Autoshop.UserRoles.EndUser
{
    public partial class ClientOrder : System.Web.UI.Page
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

            //If chassis session variable is not empty
            if (!string.IsNullOrEmpty(Session["chassis"] as string))
            {
                //Get chassis number from session variable
                String chassis = Session["chassis"].ToString();
                //Create a command to get the vehicle values from the database
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText =
                    "Select * from Vehicle where Chassis_Number = @chassis";
                cmd.Parameters.Add("@chassis", SqlDbType.Char);
                cmd.Parameters["@chassis"].Value = chassis;
                cmd.ExecuteNonQuery();

                //Store vehicle details in grid view for client display
                DataTable dt = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                adapt.Fill(dt);
                VehicleList.DataSource = dt;
                VehicleList.DataBind();

                
            }

            //Displays the additions selected in a table
            var table = new DataTable();
            table.Columns.Add("Radio_Installation");
            table.Columns.Add("Car_Alarm");
            table.Columns.Add("Tracking_Device");
            table.Columns.Add("Price");

            var row = table.NewRow();
            row["Tracking_Device"] = Session["Track"].ToString();
            row["Car_Alarm"] = Session["Alarm"].ToString();
            row["Radio_Installation"] = Session["Radio"].ToString();
            row["Price"] = Session["APrice"].ToString();

            table.Rows.Add(row);

            AdditionList.DataSource = table;
            AdditionList.DataBind();


            //Get parts from session array
            Parts[] listing = Session["Parts"] as Parts[];
            //Displays the parts selected in a table
            var table1 = new DataTable();
            table1.Columns.Add("Name");
            table1.Columns.Add("Quantity");
            table1.Columns.Add("Price");
            table1.Columns.Add("Total");

            if (listing.Length != 0)
            {
                foreach (var item in listing)
                {
                    row = table1.NewRow();
                    row["Name"] = item?.MyName;
                    row["Quantity"] = item?.MyQuantity;
                    row["Price"] = item?.MyCost;
                    row["Total"] = item?.MyCost * item?.MyQuantity;

                    table1.Rows.Add(row);
                }
            }

            PartsList.DataSource = table1;
            PartsList.DataBind();
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //Insert into sales table values**********************************
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            //If chassis session variable is not empty
            if (!string.IsNullOrEmpty(Session["chassis"] as string))
            {
                //Inserting sale values using stored procedure****************************
                cmd.CommandText = "Exec Insert_Sale @chassis, @radio, @alarm, @track, @email";

                cmd.Parameters.Add("@chassis", SqlDbType.Char);
                cmd.Parameters["@chassis"].Value = Session["chassis"].ToString();

                cmd.Parameters.Add("@radio", SqlDbType.VarChar);
                cmd.Parameters["@radio"].Value = Session["Radio"].ToString();

                cmd.Parameters.Add("@alarm", SqlDbType.VarChar);
                cmd.Parameters["@alarm"].Value = Session["Alarm"].ToString();

                cmd.Parameters.Add("@track", SqlDbType.VarChar);
                cmd.Parameters["@track"].Value = Session["Track"].ToString();

                cmd.Parameters.Add("@email", SqlDbType.VarChar);
                cmd.Parameters["@email"].Value = Session["Email"].ToString();
                cmd.ExecuteNonQuery();



                //Getting the job number for the sale
                cmd.CommandText = "Select Max(Job_Number) from Work_Done";
                int job = (int)cmd.ExecuteScalar();
                //Get parts from session array and insert into part changed**********************
                Parts[] listing = Session["Parts"] as Parts[];

                if (listing.Length != 0)
                {
                    foreach (var item in listing)
                    {
                        if (item?.MyQuantity != null)
                        {
                            //Insert parts
                            cmd.CommandText =
                            "Insert into Part_Changed (Job_Number,Part_Name,Quantity) Values ('" + job + "','"
                            + item?.MyName + "', '" + item?.MyQuantity + "')";
                            cmd.ExecuteNonQuery();
                        }
                    }
                }


                //Redirect to Invoice Page
                Response.Redirect("ClientInvoice");
            }
            else
            {
                Response.Redirect("OrderError");
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            //Set session variables back to 0
            //Vehicle
            Session["chassis"] = "";

            //Additions
            Session["Track"] = "No";
            Session["Alarm"] = "No";
            Session["Radio"] = "No";
            Session["APrice"] = "0.00";

            //Spare Parts
            Session["Parts"] = new Parts[11]; ;
            Response.Redirect("ClientOrder");
        }
    }
}