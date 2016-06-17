using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using comp2007_s2016_team_proj.Models;
//required for Identity and OWIN
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace comp2007_s2016_team_proj
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            //create a new userStore and userManager object
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore); //user manager takes care of users

            //find the user
            var user = userManager.Find(UsernameTextBox.Text, PasswordTextBox.Text);

            //check if the user is exist
            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                //signing in the user
                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                //redirect to the main menu page
                Response.Redirect("~/Contoso/MainMenu.aspx");
            }
            else
            {
                StatusLabel.Text = "Invalid Username or/and Password";
                AlertFlash.Visible = true;
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }
    }
}