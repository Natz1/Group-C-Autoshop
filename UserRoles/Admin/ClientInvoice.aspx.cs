using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.UserRoles.Admin
{
    public partial class ClientInvoice : System.Web.UI.Page
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

        protected void Update_Click(object sender, EventArgs e)
        {
            //Create a command to insert the values into the database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            //Inserting sale values using stored procedure
            cmd.CommandText = "Exec Update_Sale @sale, @salesman, @mechanic, @cost, @desc";

            cmd.Parameters.Add("@sale", SqlDbType.Int);
            cmd.Parameters["@sale"].Value = Sale.Text;

            cmd.Parameters.Add("@salesman", SqlDbType.Int);
            cmd.Parameters["@salesman"].Value = salesm.Text;

            cmd.Parameters.Add("@mechanic", SqlDbType.Int);
            cmd.Parameters["@mechanic"].Value = mechan.Text;

            cmd.Parameters.Add("@cost", SqlDbType.Money);
            cmd.Parameters["@cost"].Value = Repair.Text;

            cmd.Parameters.Add("@desc", SqlDbType.VarChar);
            cmd.Parameters["@desc"].Value = Desc.Text;

            cmd.ExecuteNonQuery();

            Response.Redirect("ClientInvoice");

        }
    }
}