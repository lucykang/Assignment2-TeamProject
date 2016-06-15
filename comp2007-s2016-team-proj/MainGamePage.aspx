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
        <div runat="server" id="GameList">
            <div class="col-md-4">
                <div class="thumbnail text-center gamebox">
                    <h3>
                        Phillies 
                        -
                        Blue Jays
                    </h3>
                    <div class="date">6/15/16</div>
                    <div class="caption">
                        <div class="col-sm-6 text-center">3</div>
                        <div class="col-sm-6 text-center">11</div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
