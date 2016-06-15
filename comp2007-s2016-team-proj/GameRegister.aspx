<%@ Page Title="Game Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameRegister.aspx.cs" Inherits="comp2007_s2016_team_proj.GameRegister" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: This page will allow user to register game.
        Date Created: 06/13/16
        Last Modified: 06/15/16
    -->
    <div class="panel">
        <div class="page-header">
            <h1>Department Details</h1>
            <h3>All fields are required</h3>
        </div>

        <!-- Game Details -->
        <div class="col-md-4">
            <div class="form-group">
                <label class="control-label" for="Name">Name:</label>
                <asp:TextBox CssClass="form-control" ID="Name" placeholder="Name" required="true" MaxLength="50" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="Date">Date:</label>
                <asp:TextBox CssClass="form-control" ID="Date" TextMode="Date" required="true" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="SpecatorCount">How many Spectators:</label>
                <asp:TextBox CssClass="form-control" ID="SpecatorCount" placeholder="Specator Count" required="true" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="Description">Description:</label>
                <asp:TextBox CssClass="form-control" ID="Description" placeholder="Briefly explain what happened" TextMode="MultiLine" required="true" runat="server" />
            </div>
        </div>

        <!-- The Winning Team -->
        <div class="col-md-4">
            <div class="form-group">
                <label class="control-label" for="WinTeamName">The Winning Team:</label>
                <asp:TextBox CssClass="form-control" ID="WinTeamName" placeholder="Winning Team" required="true" MaxLength="50" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="WinTeamScore">The Winning Team:</label>
                <asp:TextBox CssClass="form-control" ID="WinTeamScore" placeholder="Winning Team Score" TextMode="Number" required="true" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="WinTeamDescription">About the Winning Team:</label>
                <asp:TextBox CssClass="form-control" ID="WinTeamDescription" placeholder="About the Winning team" TextMode="MultiLine" required="true" runat="server" />
            </div>
        </div>

        <!-- The Losing Team -->
        <div class="col-md-4">
            <div class="form-group">
                <label class="control-label" for="LoseTeamName">The Losing Team:</label>
                <asp:TextBox CssClass="form-control" ID="LoseTeamName" placeholder="Losing Team" required="true" MaxLength="50" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="LoseTeamScore">The Losing Team:</label>
                <asp:TextBox CssClass="form-control" ID="LoseTeamScore" placeholder="Losing Team Score" TextMode="Number" required="true" runat="server" />
            </div>
            <div class="form-group">
                <label class="control-label" for="LoseTeamDescription">About the Losing Team:</label>
                <asp:TextBox CssClass="form-control" ID="LoseTeamDescription" placeholder="About the Losing team" TextMode="MultiLine" required="true" runat="server" />
            </div>
        </div>
        
        <div class="text-right">
            <asp:Button Text="Cancel" ID="Cancel" runat="server" CssClass="btn btn-warning" UseSubmitBehavior="false" CausesValidation="false" OnClick="Cancel_Click" />
            <asp:Button Text="Save" ID="Save" runat="server" CssClass="btn btn-primary" OnClick="Save_Click" />
        </div>

        <div class="clearfix"></div>
    </div>
</asp:Content>
