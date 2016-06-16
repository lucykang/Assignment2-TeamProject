using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using comp2007_s2016_team_proj.Models;

namespace comp2007_s2016_team_proj
{
    public partial class Default : System.Web.UI.Page
    {

        public List<Game> previousGames = new List<Game>();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (DefaultConnection db = new DefaultConnection())
            {
                previousGames = (from gameList in db.Games
                                 orderby gameList.GameDate descending
                                 select gameList).Take(3).ToList();
            }
        }

    }
}