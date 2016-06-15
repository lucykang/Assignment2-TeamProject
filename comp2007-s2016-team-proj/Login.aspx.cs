using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using comp2007_s2016_team_proj.Models;

namespace comp2007_s2016_team_proj
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            //use EF to connect to the server
            using (DefaultConnection db = new DefaultConnection())
            {
                User loginUser;

                //get the user record from db
                loginUser = (from user in db.Users
                             where user.Username == UsernameTextBox.Text
                             select user).FirstOrDefault();

                //if there was no such user found or password doesn't match, show message.
                if(loginUser == null || loginUser.Password != PasswordTextBox.Text)
                {
                    MsgLabel.Text = "Invalid credentials. Please try again.";
                }
                else
                {
                    Response.Redirect("~/MainGamePage.aspx");
                }
                
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }
    }
}