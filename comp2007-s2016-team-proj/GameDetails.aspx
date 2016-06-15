<%@ Page Title="Game Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="comp2007_s2016_team_proj.GameDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: This page will display detailed view of selected game.
        Date Created: 06/13/16
        Last Modified: 06/13/16
    -->
    <div class="main">
        <div class="panel">
            <h1>Game Details</h1>
            <div class="row">
                <div class="col-md-6">
                    <asp:DetailsView ID="GameDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="GameID" CssClass="table table-bordered table-striped table-hover">
                        <Fields>
                            <asp:BoundField DataField="GameID" HeaderText="GameID" ReadOnly="True">
                                <HeaderStyle Width="150px" />
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Game: " />
                            <asp:BoundField DataField="GameDescription"
                                HeaderText="Game Description: " />
                            <asp:BoundField DataField="NumSpectators"
                                HeaderText="No. of Spectators: " />
                            <asp:BoundField DataField="WinTeam" 
                                HeaderText="Winning Team: " />
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
