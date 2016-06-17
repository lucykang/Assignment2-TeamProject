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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            
            //create a new userStore and userManager object
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore); //user manager takes care of users

            //create a new user object
            var user = new IdentityUser() //constructor structure
            {
                UserName = UsernameTextBox.Text,
                Email = EmailTextBox.Text
            };

            //get result of created user
            IdentityResult result = userManager.Create(user, PasswordTextBox.Text); //hashes the password from the textbox and create the user with the password

            //check if user creation succeeded
            if (result.Succeeded)
            {
                //authenticate and login new user
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

                //redirect user to the main menu page
                Response.Redirect("~/MainGamePage.aspx");
            }
            else
            {
                //display errors in the alert-flash div
                StatusLabel.Text = result.Errors.FirstOrDefault();
                AlertFlash.Visible = true;
            }
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}