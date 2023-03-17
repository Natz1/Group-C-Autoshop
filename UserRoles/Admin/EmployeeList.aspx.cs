using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_C_Autoshop.Admin
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Click(object sender, EventArgs e)
        {

            EmpData.Insert();
            Response.Redirect("EmployeeList");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            AdminData.Update();
            Response.Redirect("EmployeeList");
        }
    }
}