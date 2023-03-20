using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.UserRoles.Manager
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Click(object sender, EventArgs e)
        {

            EmpData.Insert();
            Response.Redirect("Employees");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            AdminData.Update();
            Response.Redirect("Employees");
        }
    }
}