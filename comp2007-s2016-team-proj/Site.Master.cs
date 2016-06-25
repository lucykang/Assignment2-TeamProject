using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace comp2007_s2016_team_proj
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Page.Title)
            {
                // if it's default page, it uses default.css file
                case "Home Page":
                    customcss.Visible = false;
                    defaultcss.Visible = true;
                    break;
                default: //it uses custom.css file for the rest of the pages
                    customcss.Visible = true;
                    defaultcss.Visible = false;
                    break;
            }
        }
    }
}