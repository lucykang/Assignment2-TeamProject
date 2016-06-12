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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            using(DefaultConnection db = new DefaultConnection())
            {
                User newUser = new Models.User();
                int UserID = 0;

                //if there was a querystring in the URL
                if(Request.QueryString.Count > 0)
                {
                    //get the id from the URL
                    UserID = Convert.ToInt32(Request.QueryString["UserID"]);
                    //get the user from EF
                    newUser = (from user in db.Users
                               where user.UserID == UserID
                               select user).FirstOrDefault();
                }

                //add form data to the new user record
                newUser.Username = UsernameTextBox.Text;
                newUser.Password = PasswordTextBox.Text;



                
                //uncomment the following when db is modified
                
                /*
                newUser.FirstName = FirstNameTextBox.Text;
                newUser.LastName = LastNameTextBox.Text;
                newUser.Email = EmailTextBox.Text;
                */




                //use LINQ to ADO.NET to add/insert new user to the db
                if(UserID == 0)
                {
                    db.Users.Add(newUser);
                }

                //save change
                db.SaveChanges();

                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}