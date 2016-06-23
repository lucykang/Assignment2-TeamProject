<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="comp2007_s2016_team_proj.Navbar" %>

<!--
    Authors: Lucy, John
    Purpose: Navbar that will be used to navigate between pages
    Date Created: 06/04/16
    Last Modified: 06/17/16
-->

<nav class="navbar navbar-transparent" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-lg fa-bars"></i>
            </button>
            <a class="navbar-brand" href="/">
                <img src="/Assets/logo.png" alt="Base Tracker" height="48"/>
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="home" runat="server"><a href="/"><i class="fa fa-lg fa-home"></i> Home</a></li>
                <li id="game" runat="server"><a href="/MainGamePage.aspx"><i class="fa fa-lg fa-trophy"></i> Games</a></li>
                
                <asp:PlaceHolder ID="RegUserPlaceHolder" runat="server">
                    <asp:PlaceHolder ID="AdminPlaceHolder" runat="server">
                        <li id="users" runat="server"><a href="/Admin/Users.aspx"><i class="fa fa-lg fa-users"></i> Users</a></li>
                    </asp:PlaceHolder>
                    <li id="myprofile" runat="server"><a href="/Register.aspx?Id=<%= userID %>"><i class="fa fa-lg fa-pencil-square-o"></i> My Account</a></li>
                    <li id="logout" runat="server"><a href="/Logout.aspx"><i class="fa fa-lg fa-sign-out"></i> Logout</a></li>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="PublicPlaceHolder" runat="server">
                    <li id="login" runat="server"><a href="/Login.aspx"><i class="fa fa-lg fa-user"></i> Login</a></li>
                    <li id="edit" runat="server"><a href="/Register.aspx"><i class="fa fa-lg fa-pencil-square-o"></i> Register</a></li>
                </asp:PlaceHolder>

                <li id="contact" runat="server"><a href="../Contact.aspx"><i class="fa fa-lg fa-phone"></i> Contact</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
