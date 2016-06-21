﻿using System;
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
                case "Home Page":
                    customcss.Visible = false;
                    defaultcss.Visible = true;
                    break;
                default:
                    customcss.Visible = true;
                    defaultcss.Visible = false;
                    break;
            }
            /*
            if (Page.Title == "User Registration")
            {
                //if the page is registration, add attribute.
                //register.Attribute.Add("style", "margin-top: -30px;");
            }
            */
        }
    }
}