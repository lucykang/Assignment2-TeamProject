<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="comp2007_s2016_team_proj.Navbar" %>

<!--
    Authors: Lucy, John
    Purpose: Navbar that will be used to navigate between pages
    Date Created: 06/04/16
    Last Modified: 06/15/16
    -->
<nav class="navbar navbar-transparent" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
                <img src="/Assets/logo.png" alt="Base Tracker" width="140" />
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="home" runat="server"><a href="/"><i class="fa fa-lg fa-home"></i> Home</a></li>
                <li id="game" runat="server"><a href="MainGamePage.aspx"><i class="fa fa-lg fa-trophy"></i> Game</a></li>
                <li id="login" runat="server"><a href="Login.aspx"><i class="fa fa-lg fa-user"></i> Login</a></li>
                <li id="edit" runat="server"><a href="Register.aspx"><i class="fa fa-lg fa-pencil-square-o"></i> Register</a></li>
                <li id="contact" runat="server"><a href="Contact.aspx"><i class="fa fa-lg fa-phone"></i> Contact</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
