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
            Session["Price"] = "12000";
            Response.Redirect("ClientOrder");
        }

        //Car Alarm
        protected void AlarmBuy_Click(object sender, EventArgs e)
        {
            //Store in session variable
            Session["Alarm"] = "Yes";
            Session["Price"] = "22000";
            Response.Redirect("ClientOrder");
        }

        //Radio
        protected void RadioBuy_Click(object sender, EventArgs e)
        {
            //Store in session variable
            Session["Radio"] = "Yes";
            Session["Price"] = "5000";
            Response.Redirect("ClientOrder");
        }
    }
}