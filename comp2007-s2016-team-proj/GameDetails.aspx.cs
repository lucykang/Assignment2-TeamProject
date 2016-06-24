﻿using System;
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

        public int gameID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // if not providing a gameID then leave
            if(Request.QueryString.Count <= 0)
            {
                Response.Redirect("MainGamePage.aspx");
                return;
            }
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
            gameID = Convert.ToInt32(Request.QueryString["GameID"]);
            // connect to EF
            using (BaseTrackerConnection db = new BaseTrackerConnection())
            {
                // query the game details using EF and LINQ
                var games = (from gameList in db.Games
                            //join team in db.Teams on game.WinTeam equals team.TeamID
                            //where game.LostTeam == team.TeamID
                            where gameList.GameID == gameID
                            select gameList);//new { GameName = game.Name, WinTeamName = game.WinTeam.Name });

                if (games == null || games.Count() == 0)
                {
                    Response.Redirect("MainGamePage.aspx");
                    return;
                }

                // bind the result to the GridView
                GameDetailsView.DataSource = games.ToList();
                GameDetailsView.DataBind();
            }

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int gameId
        // can be declared with this method heading too: public IQueryable<Game> TeamDetailsView_GetItem([QueryString("GameID")] int? gameId
        public IQueryable<Game> TeamDetailsView_GetItem()
        {
            var _db = new comp2007_s2016_team_proj.Models.BaseTrackerConnection();
            IQueryable<Game> query = _db.Games;

            query = query.Where(targetGame => targetGame.GameID == gameID);
            return query;
        }
    }
}