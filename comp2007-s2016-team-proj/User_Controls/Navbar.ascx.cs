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
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    RegUserPlaceHolder.Visible = true;
                    PublicPlaceHolder.Visible = false;

                    //if user's name is admin, show users page as well.
                    if (HttpContext.Current.User.Identity.Name == "admin")
                    {
                        AdminPlaceHolder.Visible = true;
                    }
                }
                else
                {
                    RegUserPlaceHolder.Visible = false;
                    PublicPlaceHolder.Visible = true;
                }
            }
            SetActivePage();
        }

        /**
         * This method adds a css class of "active" to list items
         * relating to the current page
         * 
         * @private
         * @method SetActivePage
         * @return {void}
         */
        private void SetActivePage()
        {
            switch (Page.Title)
            {
                case "Home Page":
                    home.Attributes.Add("class", "active");
                    break;
                case "Main Game Page":
                    game.Attributes.Add("class", "active");
                    break;
                case "Game Register":
                    game.Attributes.Add("class", "active");
                    break;
                case "Game Details":
                    game.Attributes.Add("class", "active");
                    break;
                case "Login":
                    login.Attributes.Add("class", "active");
                    break;
                case "User Detail":
                    edit.Attributes.Add("class", "active");
                    break;
                case "Users":
                    users.Attributes.Add("class", "active");
                    break;
                case "Contact":
                    contact.Attributes.Add("class", "active");
                    break;
            }
        }
    }
}