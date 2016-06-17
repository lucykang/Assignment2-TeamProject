using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using comp2007_s2016_team_proj.Models;

namespace comp2007_s2016_team_proj
{
    public partial class GameRegister : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && Request.QueryString.Count > 0)
            {
                FetchGame();
            }
        }

        private void FetchGame()
        {
            int gameID = Convert.ToInt32(Request.QueryString["GameID"]);
            using (BaseTrackerConnection db = new BaseTrackerConnection())
            {
                Game game = (from gameList in db.Games
                        where gameList.GameID == gameID
                        select gameList).FirstOrDefault();

                if(game == null)
                {
                    Response.Redirect("~/MainGamePage.aspx");
                    return;
                }

                // store the game information
                Name.Text = game.Name;
                Date.Text = game.GameDate.ToString("yyyy-MM-dd");
                Description.Text = game.GameDescription;
                SpecatorCount.Text = game.NumSpectators.ToString();

                // store the winning team information
                WinTeamName.Text = game.WinTeam;
                WinTeamScore.Text = game.WinTeamScore.ToString();
                WinTeamDescription.Text = game.WinTeamDescription;

                // store the losing team information
                LoseTeamName.Text = game.LostTeam;
                LoseTeamScore.Text = game.LostTeamScore.ToString();
                LoseTeamDescription.Text = game.LostTeamDescription;

            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MainGamePage.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            using (BaseTrackerConnection db = new BaseTrackerConnection())
            {
                // find out whether we're editing or making a new one then retrieve the object
                Game game;
                if (Request.QueryString.Count > 0)
                {
                    int gameID = Convert.ToInt32(Request.QueryString["GameID"]);
                    game = (from gameList in db.Games
                            where gameList.GameID == gameID
                            select gameList).FirstOrDefault();
                }
                else
                    game = new Game();

                // save game information
                game.Name = Name.Text;
                game.GameDate = Convert.ToDateTime(Date.Text);
                game.GameDescription = Description.Text;
                game.NumSpectators = Convert.ToInt32(SpecatorCount.Text);

                // save winning team information
                game.WinTeam = WinTeamName.Text;
                game.WinTeamScore = Convert.ToInt32(WinTeamScore.Text);
                game.WinTeamDescription = WinTeamDescription.Text;

                // save losing team information
                game.LostTeam = LoseTeamName.Text;
                game.LostTeamScore = Convert.ToInt32(LoseTeamScore.Text);
                game.LostTeamDescription = LoseTeamDescription.Text;

                if (Request.QueryString.Count <= 0)
                {
                    db.Games.Add(game);
                }

                db.SaveChanges();
            }

            Response.Redirect("~/MainGamePage.aspx");
        }

    }
}