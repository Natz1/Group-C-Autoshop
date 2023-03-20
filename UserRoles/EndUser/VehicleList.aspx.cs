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
    public partial class VehicleList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buy1_Click(object sender, EventArgs e)
        {
            //Get Currently selected chassis number
            Session["chassis"] = FormView1.SelectedValue.ToString();
        }

        protected void Buy2_Click(object sender, EventArgs e)
        {
            //Get Currently selected chassis number
            Session["chassis"] = FormView2.SelectedValue.ToString();
        }

        protected void Buy3_Click(object sender, EventArgs e)
        {
            //Get Currently selected chassis number
            Session["chassis"] = FormView3.SelectedValue.ToString();
        }

        protected void Buy4_Click(object sender, EventArgs e)
        {
            //Get Currently selected chassis number
            Session["chassis"] = FormView4.SelectedValue.ToString();
        }
    }
}