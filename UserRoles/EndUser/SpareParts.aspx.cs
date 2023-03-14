using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.EndUser
{
    public partial class SpareParts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buy_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Door";
            Session["Quantity"] = int.Parse(DropDownList7.Text.ToString());
            Session["Total"] = double.Parse(TextBox1.Text.ToString()) * int.Parse(DropDownList7.Text.ToString());

            Response.Redirect("ClientOrder");
        }

        protected void Buy1_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Mirror";
            Session["Quantity"] = int.Parse(DropDownList6.Text.ToString());
            Session["Total"] = double.Parse(TextBox2.Text.ToString()) * int.Parse(DropDownList6.Text.ToString());
        }

        protected void Buy2_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Head Light";
            Session["Quantity"] = int.Parse(DropDownList5.Text.ToString());
            Session["Total"] = double.Parse(TextBox4.Text.ToString()) * int.Parse(DropDownList5.Text.ToString());
        }

        protected void Buy3_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Tail Light";
            Session["Quantity"] = int.Parse(DropDownList4.Text.ToString());
            Session["Total"] = double.Parse(TextBox6.Text.ToString()) * int.Parse(DropDownList4.Text.ToString());
        }

        protected void Buy4_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Tire";
            Session["Quantity"] = int.Parse(DropDownList3.Text.ToString());
            Session["Total"] = double.Parse(TextBox8.Text.ToString()) * int.Parse(DropDownList3.Text.ToString());
        }

        protected void Buy5_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Bumper";
            Session["Quantity"] = int.Parse(DropDownList2.Text.ToString());
            Session["Total"] = double.Parse(TextBox10.Text.ToString()) * int.Parse(DropDownList2.Text.ToString());
        }

        protected void Buy6_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Brakes";
            Session["Quantity"] = int.Parse(DropDownList1.Text.ToString());
            Session["Total"] = double.Parse(TextBox13.Text.ToString()) * int.Parse(DropDownList1.Text.ToString());
        }
    }
}