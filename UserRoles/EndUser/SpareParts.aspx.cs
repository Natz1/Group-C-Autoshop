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
            Session["Name"] = "Back Bumper";
            Session["Quantity"] = DropDownList1.Text;
            Session["PPrice"] = TextBox1.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy1_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Front Bumper";
            Session["Quantity"] = DropDownList2.Text;
            Session["PPrice"] = TextBox2.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy2_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Side Skirt";
            Session["Quantity"] = DropDownList3.Text;
            Session["PPrice"] = TextBox3.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy3_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Spoiler";
            Session["Quantity"] = DropDownList4.Text;
            Session["PPrice"] = TextBox4.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy4_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Rims";
            Session["Quantity"] = DropDownList5.Text;
            Session["PPrice"] = TextBox5.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy5_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Tires";
            Session["Quantity"] = DropDownList6.Text;
            Session["PPrice"] = TextBox6.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy6_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Head Lamps";
            Session["Quantity"] = DropDownList7.Text;
            Session["PPrice"] = TextBox7.Text;
        }

        protected void Buy7_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Roof Rails";
            Session["Quantity"] = DropDownList8.Text;
            Session["PPrice"] = TextBox8.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy8_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Mud Guard";
            Session["Quantity"] = DropDownList9.Text;
            Session["PPrice"] = TextBox9.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy9_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Haulage Bay Cover";
            Session["Quantity"] = DropDownList10.Text;
            Session["PPrice"] = TextBox10.Text;

            Response.Redirect("ClientOrder");
        }

        protected void Buy10_Click(object sender, EventArgs e)
        {
            //Get part info
            Session["Name"] = "Flood Light";
            Session["Quantity"] = DropDownList11.Text;
            Session["PPrice"] = TextBox11.Text;

            Response.Redirect("ClientOrder");
        }
    }
}