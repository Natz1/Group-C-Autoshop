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

                //If session variable is not empty
                if (!string.IsNullOrEmpty(Session["Track"] as string) && !string.IsNullOrEmpty(Session["Alarm"] as string) &&
                    !string.IsNullOrEmpty(Session["Radio"] as string) && !string.IsNullOrEmpty(Session["Price"] as string))
                {
                    var table = new DataTable();
                    table.Columns.Add("Radio_Installation");
                    table.Columns.Add("Car_Alarm");
                    table.Columns.Add("Tracking_Device");
                    table.Columns.Add("Price");

                    var row = table.NewRow();
                    row["Tracking_Device"] = Session["Track"].ToString();
                    row["Car_Alarm"] = Session["Alarm"].ToString();
                    row["Radio_Installation"] = Session["Radio"].ToString();
                    row["Price"] = Session["Price"].ToString();

                    table.Rows.Add(row);

                    AdditionList.DataSource = table;
                    AdditionList.DataBind();
                }

                //If session variable is not empty
                if (!string.IsNullOrEmpty(Session["Name"] as string) && !string.IsNullOrEmpty(Session["Quantity"] as string) &&
                !string.IsNullOrEmpty(Session["PPrice"] as string))
                {
                    var table1 = new DataTable();
                    table1.Columns.Add("Name");
                    table1.Columns.Add("Quantity");
                    table1.Columns.Add("Price");

                    var row = table1.NewRow();
                    row["Name"] = Session["Name"].ToString();
                    row["Quantity"] = Session["Quantity"].ToString();
                    row["Price"] = Session["PPrice"].ToString();

                    table1.Rows.Add(row);

                    PartsList.DataSource = table1;
                    PartsList.DataBind();
                }
            }
        }

        protected void DataBind1(object sender, GridViewRowEventArgs e)
        {
            //If session variable is not empty
            if (!string.IsNullOrEmpty(Session["Name"] as string) && !string.IsNullOrEmpty(Session["Quantity"] as string) &&
                !string.IsNullOrEmpty(Session["PPrice"] as string))
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[0].Text = Session["Name"].ToString();
                    e.Row.Cells[1].Text = Session["Quantity"].ToString();
                    e.Row.Cells[2].Text = Session["PPrice"].ToString();
                }
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //Insert into sales table values**********************************
            //Create a command to insert the values into the database
            /*SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;

            cmd.CommandType = CommandType.Text;
            cmd.CommandText =
                "Insert into Client (Name, Residentia) Values ('" + CNameTxt.Text + "', '" + CAddrTxt.Text + "', '" + CEmailTxt.Text + "')";
            cmd.ExecuteNonQuery();

            cmd.CommandText =
                "Insert into Client_Phone (Phone_Number) Values ('" + CPhoneTxt + "')";
            cmd.ExecuteNonQuery();

            Response.Redirect("VehiclePurchases");*/

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