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
                <div class="col-md-5">
                    <asp:FormView ID="TeamDetailsView" runat="server" ItemType="comp2007_s2016_team_proj.Models.Game" SelectMethod="TeamDetailsView_GetItem" RenderOuterTable="false">
                        <ItemTemplate>
                            <div class="row">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h4><%#:Item.WinTeam %></h4>
                                    </div>
                                    <div class="panel-body">
                                        <p><%#:Item.WinTeamDescription %></p>
                                        <p>Total points scored: <%#:Item.WinTeamScore %></p>
                                        <p>Total points allowed: <%#:Item.LostTeamScore %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="panel panel-danger">
                                    <div class="panel-heading">
                                        <h4><%#:Item.LostTeam %></h4>
                                    </div>
                                    <div class="panel-body">
                                        <p><%#:Item.LostTeamDescription %></p>
                                        <p>Total points scored: <%#:Item.LostTeamScore %></p>
                                        <p>Total points allowed: <%#:Item.WinTeamScore %></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
