using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using comp2007_s2016_team_proj.Models;

namespace comp2007_s2016_team_proj.UserMenu
{
    public partial class GameDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if there was any string passed by query
            if(Request.QueryString.Count > 0)
            {
                int gameID = Convert.ToInt32(Request.QueryString["GameID"]);
                using (BaseTrackerConnection db = new BaseTrackerConnection())
                {
                    Game game = (from gameList in db.Games
                                 where gameList.GameID == gameID
                                 select gameList).FirstOrDefault();

                    if(game != null)
                    {
                        db.Games.Remove(game);
                        db.SaveChanges();
                    }
                }
            }
            //redirect the user to the main game page after deletion
            Response.Redirect("/MainGamePage.aspx");
        }
    }
}