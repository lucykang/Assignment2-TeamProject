using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//required for Identity and OWIN
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;


namespace comp2007_s2016_team_proj
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //accessing the session (store session info)
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            authenticationManager.SignOut();

            //redirect to the default page
            Response.Redirect("~/Default.aspx");
        }
    }
}