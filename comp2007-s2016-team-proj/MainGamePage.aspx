<%@ Page Title="Main Game Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainGamePage.aspx.cs" Inherits="comp2007_s2016_team_proj.MainGamePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Game.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: This page will display multiple view of games from database.
        Date Created: 06/13/16
        Last Modified: 06/15/16
    -->
    <div class="panel">
        <div class="page-header">
            <h1>Recent Games</h1>
        </div>
        <div style="margin-left: 15px; margin-bottom: 10px">
            <a href="GameRegister.aspx" class="btn btn-success"><i class="fa fa-lg fa-plus"></i></a>
        </div>
        <div runat="server" id="GameList">

            <% foreach (var game in games) { %>
                <div class="col-md-4">
                    <div class="thumbnail text-center gamebox">
                        <h3><a href="GameDetails.aspx?GameID=<%= game.GameID %>">
                            <%= game.WinTeam %> 
                            -
                            <%= game.LostTeam %>
                        </a></h3>
                        <div class="date"><%= game.GameDate %></div>
                        <div class="caption">
                            <div class="col-sm-6 text-center alert-success"><%= game.WinTeamScore %></div>
                            <div class="col-sm-6 text-center alert-danger"><%= game.LostTeamScore %></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            <% } %>

            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
