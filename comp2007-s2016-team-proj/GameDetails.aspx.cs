using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using comp2007_s2016_team_proj.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace comp2007_s2016_team_proj
{
    public partial class GameDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate the game detailsview
            if (!IsPostBack)
            {
                //get the game data
                this.GetGameDetail();
            }
        }

        /**
         * <summary>
         * This method gets the game data from the DB
         * </summary>
         * 
         * @method GetGameDetail
         * @returns {void}
         */
        protected void GetGameDetail()
        {
            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                // query the game details using EF and LINQ
                var Game = (from game in db.Games
                                //join team in db.Teams on game.WinTeam equals team.TeamID
                                //where game.LostTeam == team.TeamID
                            select game);//new { GameName = game.Name, WinTeamName = game.WinTeam.Name });
                
                // bind the result to the GridView
                GameDetailsView.DataSource = Game.AsQueryable().ToList();
                GameDetailsView.DataBind();
                TeamDetailsView.DataSource = Game.AsQueryable().ToList();
                TeamDetailsView.DataBind();
            }
            /*
            using (DefaultConnection teamdb = new DefaultConnection())
            {
                var Team = (from team in teamdb.Teams
                            select team);

                
                GameDetailsView.DataSource = Team.AsQueryable().ToList();
                GameDetailsView.DataBind();
            }
            */
            
        }
    }
}