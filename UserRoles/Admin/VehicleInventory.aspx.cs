using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.EndUser
{
    public partial class VehicleInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add1_Click(object sender, EventArgs e)
        {
            CarData.Insert();
        }

        protected void Add2_Click(object sender, EventArgs e)
        {
            WDData.Insert();
        }

        protected void Add3_Click(object sender, EventArgs e)
        {
            VanData.Insert();
        }
    }
}