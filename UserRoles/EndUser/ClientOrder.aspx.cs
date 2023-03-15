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
                //Creates salesman dropdown list!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //Admin purposes, will be changes so only admins can access it and alter it
                string com = "Select Salesman_ID From Salesman";
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataSet ds = new DataSet();
                adpt.Fill(ds);
                salesman.DataSource = ds;
                salesman.DataValueField = "Salesman_ID";
                salesman.DataBind();
                ds.Dispose();

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

            //If addition session variables are not empty
            /*if (!string.IsNullOrEmpty(Session["APrice"] as string))
            {
                //Creates mechanic dropdown list!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //Admin purposes, will be changes so only admins can access it and alter it
                string com = "Select Mechanic_ID From Mechanic";
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataSet ds = new DataSet();
                adpt.Fill(ds);
                mechanic.DataSource = ds;
                mechanic.DataValueField = "Mechanic_ID";
                mechanic.DataBind();

                ds.Dispose();

                
            }*/

            //If session variable is not empty
            /*if (!string.IsNullOrEmpty(Session["PPrice"] as string))
            {
                //Creates mechanic dropdown list!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //Admin purposes, will be changes so only admins can access it and alter it
                string com = "Select Mechanic_ID From Mechanic";
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataSet ds = new DataSet();
                adpt.Fill(ds);
                mechanic.DataSource = ds;
                mechanic.DataValueField = "Mechanic_ID";
                mechanic.DataBind();

                ds.Dispose();
            }*/

        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //Insert into sales table values**********************************
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            //*****************************Replace with stored procedure
            DateTime today = DateTime.Today;
            //Save client info
            ClientData.Insert();

            /*cmd.CommandText =
                "Insert into Client (Name, Residential_Address, Email) Values ('" + CNameTxt.Text + "', '" + CAddrTxt.Text + "', '" + CEmailTxt.Text + "')";
            cmd.ExecuteNonQuery();
            //Client Phone
            cmd.CommandText = @"select max(Client_ID) from Client";
            int id = (int)cmd.ExecuteScalar();
            Session["ID"] = id;
            String cphone = CPhoneTxt.Text;
            cmd.CommandText =
                "Insert into Client_Phone Values ('" + id + "','" + cphone + "')";
            cmd.ExecuteNonQuery();*/



            //Update vehicle sold to Yes
            String chassis = Session["chassis"].ToString();
            //Create a command to get the values from the database (Note, need to update purchase and assign salesman in admin)
            cmd.CommandText =
                "UPDATE Vehicle SET Sold = @sold WHERE Chassis_Number = @chassis";
            //Chassis
            cmd.Parameters.Add("@chassis", SqlDbType.Char);
            cmd.Parameters["@chassis"].Value = chassis;
            //Sold
            cmd.Parameters.Add("@sold", SqlDbType.Char);
            cmd.Parameters["@sold"].Value = "Yes";
            cmd.ExecuteNonQuery();


            //************************************************Add Date
            //Enter into Sales
            /*cmd.CommandText =
                "Insert into Sale (Date, Salesman_ID, Chassis_Number, Client_ID) Values ('" + today + "','" + salesman.Text + "', '" + chassis + "', '" + Session["ID"].ToString() + "')";
            cmd.ExecuteNonQuery();*/
            cmd.CommandText =
                "Insert into Sale (Salesman_ID, Chassis_Number, Client_ID) Values ('" + salesman.Text + "', '" + chassis + "', '" + Session["ID"].ToString() + "')";
            cmd.ExecuteNonQuery();

            if (!string.IsNullOrEmpty(Session["PPrice"] as string) || !string.IsNullOrEmpty(Session["Price"] as string))
            {
                //Enter into Work Done
                //Get sale id from db
                cmd.CommandText = @"select max(Sale_ID) from Sale";
                int sale = (int)cmd.ExecuteScalar();
                cmd.CommandText =
                    "Insert into Work_Done Values ('" + mechanic.Text + "', '" + sale + "')";
                cmd.ExecuteNonQuery();

                //********************************************************
                //Addition
                if (!string.IsNullOrEmpty(Session["Track"] as string) && !string.IsNullOrEmpty(Session["Alarm"] as string) &&
                    !string.IsNullOrEmpty(Session["Radio"] as string) && !string.IsNullOrEmpty(Session["Price"] as string))
                {
                    //Find last performed job
                    cmd.CommandText = @"select max(Job_Number) from Work_Done";
                    int job = (int)cmd.ExecuteScalar();
                    //Insert add on
                    cmd.CommandText =
                        "Insert into Add_on Values ('" + job + "', '" + Session["Radio"].ToString() + "', '" + Session["Alarm"].ToString() + "', '"
                        + Session["Track"].ToString() + "', '" + Session["Price"].ToString() + "')";
                    cmd.ExecuteNonQuery();
                }

                //Spares
                if (!string.IsNullOrEmpty(Session["Name"] as string) && !string.IsNullOrEmpty(Session["Quantity"] as string) &&
                !string.IsNullOrEmpty(Session["PPrice"] as string))
                {
                    //Find last performed job
                    cmd.CommandText = @"select max(Job_Number) from Work_Done";
                    int job = (int)cmd.ExecuteScalar();
                    //Insert parts
                    cmd.CommandText =
                    "Insert into Part_Changed (Job_Number,Part_Name,Quantity) Values ('" + job + "', '"
                    + Session["Name"].ToString() + "', '" + Session["Quantity"].ToString() + "')";
                    cmd.ExecuteNonQuery();
                }
            }


            //Redirect to Invoice Page
            Response.Redirect("ClientInvoice");
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