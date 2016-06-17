<%@ Page Title="User Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="comp2007_s2016_team_proj.Register" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: This page will allow the user to register a new account
            - a button to renavigate to the login page if they already have one
        Date Created: 06/04/16
        Last Modified: 06/17/16
    -->
    <div class="main">
        <div class="row">
            <div class="wrapper">
                <div class="form-signin panel" id="register" runat="server">
                    <h3 class="form-signin-heading text-center">
                        <img src="Assets/icon.png" alt="Base Tracker" width="100"/>
                    </h3>
                    <hr>
                    <h3 class="form-signin-heading text-center">User Detail</h3><br>
                    <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">
                        <asp:Label runat="server" ID="StatusLabel" />
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="UsernameTextBox">Username </label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="UsernameTextBox" placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="UsernameRequiredFieldValidator" runat="server" ErrorMessage="Username is required" ControlToValidate="UsernameTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="PasswordTextBox">Password </label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="PasswordTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="ConfirmPasswordTextBox">Confirm </label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="ConfirmPasswordTextBox" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ErrorMessage="Your Passwords Must Match" Type="String" Operator="Equal"  ControlToValidate="ConfirmPasswordTextBox" runat="server"
                                ControlToCompare="PasswordTextBox" CssClass="label label-danger" />
                    </div>
                    <!--
                    <div class="form-group">
                        <label class="control-label" for="FirstNameTextBox">First Name</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="FirstNameTextBox" placeholder="First Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="FirstNameRequiredFieldValidator" runat="server" ErrorMessage="First name is required" ControlToValidate="FirstNameTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="LastNameTextBox">Last Name</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="LastNameTextBox" placeholder="Last Name" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="LastNameRequiredFieldValidator" runat="server" ErrorMessage="Last name is required" ControlToValidate="LastNameTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    -->
                    <div class="form-group">
                        <label class="control-label" for="EmailTextBox">Email</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="EmailTextBox" placeholder="your@email.com" required="true" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Email is required" ControlToValidate="EmailTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group text-center">
                        <asp:Button runat="server" ID="SubmitBtn" CssClass="btn btn-submit" Text="Submit" CausesValidation="true" OnClick="SubmitBtn_Click"/>
                        <asp:Button Text="Cancel" ID="CancelBtn" CssClass="btn btn-cancel" runat="server" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelBtn_Click" />
                    </div>
                </div>
            </div> <!-- end of wrapper -->
        </div>
    </div> <!-- end of main -->
</asp:Content>
