<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="comp2007_s2016_team_proj.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: Landing page for the site where they can choose to login or view as guest
        Date Created: 06/04/16
        Last Modified: 06/15/16
        -->
        <div class="container">
            <div class="wrapper">
                <div class="row text-center panel">
                    <div class="col-sm-4">
                        <i class="fa fa-5x fa-lock"></i>
                        <h2>Login</h2>
                        <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
                        <p><a class="btn btn-submit" href="Login.aspx">Login &raquo;</a></p>
                    </div>
                    <div class="col-sm-4">
                        <i class="fa fa-5x fa-pencil-square-o"></i>
                        <h2>Register</h2>
                        <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
                        <p><a class="btn btn-register" href="Register.aspx">Get Started &raquo;</a></p>
                    </div>
                    <div class="col-sm-4">
                        <i class="fa fa-5x fa-users"></i>
                        <h2>Guest</h2>
                        <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
                        <p><a class="btn btn-default" href="MainGamePage.aspx">Get Started &raquo;</a></p>
                    </div>
                </div> <!-- end of row -->


                <!-- START THE FEATURETTES -->
                <div class ="row panel gamepanel">
                    <% int i = 0; %>
                    <% foreach (var game in previousGames)
                        { %>
                    
                    <div class="row featurette">
                        <div class="col-md-7 <%= (i++ % 2 == 0 ? "" : "col-md-offset-5") %>">
                            <h2 class="featurette-heading"><%= game.WinTeam %> VS <%= game.LostTeam %>
                                <span class="text-muted"><%= game.GameDate.ToString("ddd, MMM dd yyyy") %></span>
                            </h2>
                            <p class="lead">
                                <%= game.WinTeamScore %> - <%= game.LostTeamScore %>
                                <br />
                                <%= game.GameDescription %>
                            </p>
                        </div>
                    </div> <!-- end of row featurette -->
                    <hr class="featurette-divider">
                    <% } %>
                </div>
            </div><!-- end of wrapper -->
        </div><!-- end of container -->
    </div><!-- end of main -->
</asp:Content>
