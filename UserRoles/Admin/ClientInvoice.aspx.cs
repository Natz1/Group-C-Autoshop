using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.EndUser
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


            //Creates salesman dropdown list
            string com = "Select Salesman_ID From Salesman";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            salesman.DataSource = ds;
            salesman.DataValueField = "Salesman_ID";
            salesman.DataBind();
            ds.Dispose();

            //Creates mechanic dropdown list
            string com1 = "Select Mechanic_ID From Mechanic";
            SqlDataAdapter adpt1 = new SqlDataAdapter(com1, con);
            DataSet ds1 = new DataSet();
            adpt1.Fill(ds1);
            mechanic.DataSource = ds1;
            mechanic.DataValueField = "Mechanic_ID";
            mechanic.DataBind();

            ds1.Dispose();
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
            cmd.Parameters["@salesman"].Value = salesman.Text;

            cmd.Parameters.Add("@mechanic", SqlDbType.Int);
            cmd.Parameters["@mechanic"].Value = mechanic.Text;

            cmd.Parameters.Add("@cost", SqlDbType.Money);
            cmd.Parameters["@cost"].Value = Repair.Text;

            cmd.Parameters.Add("@desc", SqlDbType.VarChar);
            cmd.Parameters["@desc"].Value = Desc.Text;

            cmd.ExecuteNonQuery();
        }
    }
}