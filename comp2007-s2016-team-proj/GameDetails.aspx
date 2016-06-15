<%@ Page Title="Game Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="comp2007_s2016_team_proj.GameDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: This page will display detailed view of selected game.
        Date Created: 06/13/16
        Last Modified: 06/13/16
        
    -->
    <div class="main">
        <div class="">
            <h1>Game Details</h1>
            <br />
            <div class="row">
                <div class="col-md-6 panel">
                    <br />
                    <asp:DetailsView ID="GameDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="GameID" CssClass="table table-striped table-borderless">
                        <Fields>
                            <asp:BoundField DataField="GameID" HeaderText="GameID" ReadOnly="True">
                                <HeaderStyle Width="150px" />
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Game: " />
                            <asp:BoundField DataField="GameDescription" HeaderText="Game Description: " />
                            <asp:BoundField DataField="NumSpectators" HeaderText="No. of Spectators: " />
                            <asp:BoundField DataField="WinTeam" HeaderText="Winning Team: " />
                            <asp:BoundField DataField="LostTeam" HeaderText="Lost Team: " />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <div class="row">
                        <asp:DetailsView ID="TeamDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="GameID" CssClass="table table-borderless">
                        <Fields>
                            <asp:BoundField DataField="WinTeam" ItemStyle-CssClass="bg-primary" />
                            <asp:BoundField DataField="WinTeamDescription" ItemStyle-CssClass="bg-warning" />
                            <asp:BoundField DataField="WinTeamScore" FooterText="ddddddd" ItemStyle-CssClass="bg-warning" />
                            <asp:BoundField DataField="LostTeam" ItemStyle-CssClass="bg-danger" />
                            <asp:BoundField DataField="LostTeamDescription" ItemStyle-CssClass="bg-warning" />
                            <asp:BoundField DataField="LostTeamScore" ItemStyle-CssClass="bg-warning" />

                        </Fields>
                    </asp:DetailsView>
                        
                    </div>
                    <div class="row">

                    </div>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
