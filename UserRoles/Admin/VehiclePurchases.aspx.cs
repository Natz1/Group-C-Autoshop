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
using System.Web.Configuration;

namespace Group_C_Autoshop.UserRoles
{
    public partial class VehiclesPurchases : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            //Make new SQL Connection
            string connection = WebConfigurationManager.ConnectionStrings["Car_Mart_Web_AppConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


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