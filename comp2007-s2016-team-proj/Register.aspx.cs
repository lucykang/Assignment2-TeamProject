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
            if (!IsPostBack)
            {
                //if there was a querystring, it's edit profile page.
                if (Request.QueryString.Count > 0)
                {
                    PasswordPlaceHolder.Visible = false;
                    this.GetUser();
                }
                else //if none, then it's register page.
                {
                    PasswordPlaceHolder.Visible = true;
                }
            }
        }

        /**
         * <summary>
         * This method gets the user data from the DB
         * </summary>
         * 
         * @method GetUser()
         * @returns {void}
         */
        protected void GetUser()
        {
            string UserID = Request.QueryString["Id"].ToString();

            using (UserConnection db = new UserConnection())
            {
                AspNetUser updatedUser = (from user in db.AspNetUsers
                                          where user.Id == UserID
                                          select user).FirstOrDefault();

                if (updatedUser != null)
                {
                    UsernameTextBox.Text = updatedUser.UserName;
                    EmailTextBox.Text = updatedUser.Email;
                }
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string UserID = "";

            // if updating user
            if (Request.QueryString.Count > 0)
            {
                using (UserConnection db = new UserConnection())
                {
                    AspNetUser newUser = new AspNetUser();

                    UserID = Request.QueryString["Id"].ToString();

                    newUser = (from users in db.AspNetUsers
                               where users.Id == UserID
                               select users).FirstOrDefault();

                    newUser.UserName = UsernameTextBox.Text;
                    newUser.Email = EmailTextBox.Text;

                    db.SaveChanges();

                    // redirect to the users list
                    Response.Redirect("~/Admin/Users.aspx");

                }
            }

            // if creating a new user
            if (UserID == "")
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
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}