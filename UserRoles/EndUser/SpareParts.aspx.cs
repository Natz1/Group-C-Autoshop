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
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Back Bumper", Convert.ToInt32(DropDownList1.Text), Convert.ToInt32(TextBox1.Text));
            list[0] = part;
            Session["Parts"] = list;
        }

        protected void Buy1_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Front Bumper", Convert.ToInt32(DropDownList2.Text), Convert.ToInt32(TextBox2.Text));
            list[1] = part;
            Session["Parts"] = list;
        }

        protected void Buy2_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Side Skirt", Convert.ToInt32(DropDownList3.Text), Convert.ToInt32(TextBox3.Text));
            list[2] = part;
            Session["Parts"] = list;
        }

        protected void Buy3_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Spoiler", Convert.ToInt32(DropDownList4.Text), Convert.ToInt32(TextBox4.Text));
            list[3] = part;
            Session["Parts"] = list;
        }

        protected void Buy4_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Rims", Convert.ToInt32(DropDownList5.Text), Convert.ToInt32(TextBox5.Text));
            list[4] = part;
            Session["Parts"] = list;

            Response.Redirect("ClientOrder");
        }

        protected void Buy5_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Tires", Convert.ToInt32(DropDownList6.Text), Convert.ToInt32(TextBox6.Text));
            list[5] = part;
            Session["Parts"] = list;
        }

        protected void Buy6_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Head Lamps", Convert.ToInt32(DropDownList7.Text), Convert.ToInt32(TextBox7.Text));
            list[6] = part;
            Session["Parts"] = list;
        }

        protected void Buy7_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Roof Rails", Convert.ToInt32(DropDownList8.Text), Convert.ToInt32(TextBox8.Text));
            list[7] = part;
            Session["Parts"] = list;
        }

        protected void Buy8_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Mud Guard", Convert.ToInt32(DropDownList9.Text), Convert.ToInt32(TextBox9.Text));
            list[8] = part;
            Session["Parts"] = list;
        }

        protected void Buy9_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Haulage Bay Cover", Convert.ToInt32(DropDownList10.Text), Convert.ToInt32(TextBox10.Text));
            list[9] = part;
            Session["Parts"] = list;
        }

        protected void Buy10_Click(object sender, EventArgs e)
        {
            //Get part info
            Parts[] list = Session["Parts"] as Parts[];
            Parts part = new Parts("Flood Light", Convert.ToInt32(DropDownList11.Text), Convert.ToInt32(TextBox11.Text));
            list[10] = part;
            Session["Parts"] = list;
        }
    }
}