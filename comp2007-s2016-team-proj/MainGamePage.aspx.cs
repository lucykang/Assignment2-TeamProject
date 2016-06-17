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

        public List<Game> games = new List<Game>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchGames();
            }
        }

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