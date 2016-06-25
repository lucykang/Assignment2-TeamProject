using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using comp2007_s2016_team_proj.Models;

namespace comp2007_s2016_team_proj
{
    public partial class MainGamePage : System.Web.UI.Page
    {
        //games from database to be used at the MainGamePage.aspx file.
        public List<Game> games = new List<Game>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchGames();
            }
        }

        /**
         * <summary>
         * This method gets the game data from the DB
         * </summary>
         * 
         * @method FetchGames()
         * @returns {void}
         */
        private void FetchGames()
        {
            using (BaseTrackerConnection db = new BaseTrackerConnection())
            {
                games = (from gameList in db.Games
                         orderby gameList.GameDate descending
                         select gameList).ToList();
            }
        }

    }
}