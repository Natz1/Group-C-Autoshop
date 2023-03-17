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
            PurchaseData.Insert();

            //Adding salesman ID
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Exec Add_Salesman_Id @chassis, @salesman";
            cmd.Parameters.Add("@chassis", SqlDbType.Char);
            cmd.Parameters["@chassis"].Value = ChassisTxt.Text;

            cmd.Parameters.Add("@salesman", SqlDbType.Int);
            cmd.Parameters["@salesman"].Value = SalesmanTxt.Text;

            
            cmd.ExecuteNonQuery();
            Response.Redirect("VehiclePurchases");
        }
    
    }
}