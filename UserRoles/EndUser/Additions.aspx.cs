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
         protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Tracking Device
        protected void TrackBuy_Click(object sender, EventArgs e)
        {
            //Store in session variable
            Session["Track"] = "Yes";
            //convert the previous price to a double
            Session["APrice"] = Convert.ToDouble(Session["APrice"]) + 5000.00;
        }

        //Car Alarm
        protected void AlarmBuy_Click(object sender, EventArgs e)
        {
            //Store in session variable
            Session["Alarm"] = "Yes";
            Session["APrice"] = Convert.ToDouble(Session["APrice"]) + 2500.00;
        }

        //Radio
        protected void RadioBuy_Click(object sender, EventArgs e)
        {
            //Store in session variable
            Session["Radio"] = "Yes";
            Session["APrice"] = Convert.ToDouble(Session["APrice"]) + 7500.00;
        }
    }
}