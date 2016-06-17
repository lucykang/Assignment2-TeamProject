<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="comp2007_s2016_team_proj.Contact" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--
        Authors: Lucy, John
        Purpose: This page will be used if they wish to provide feedback or concerns about the site.
        Date Created: 06/04/16
        Last Modified: 06/17/16
        -->
    <div class ="main">
        <div class="container">
            <div class="row">
                <br />
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3>Contact Info</h3>
                        </div>
                        <div class="panel-body">
                            <address>
                                <strong>Lucy</strong><br />
                                1011 Georgian Drive<br />
                                Barrie, ON L9L 2A6<br />
                                <abbr title="Phone">P: </abbr>
                                (705) 555-5163
                            </address>
                            <address>
                                <strong>John Horne</strong><br />
                                1 Toronto Drive<br />
                                Barrie, ON L9L 1L0<br />
                                <abbr title="Phone">P: </abbr>
                                (705) 555-5555
                            </address>
                        </div>
                    </div>
                </div>
                <!-- contact form -->
                <div class="col-md-6 panel">
                    <div class="page-header">
                        <h1>Contact Us</h1>
                    </div>
                    <em>Please fill out all fields to send email to us.</em>
                    <div class="form-group">
                        <div class="input-group input-group-md">
                            <span class="input-group-addon" id="fullname-sizing-addon2"><i class="fa fa-user"></i></span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="FullNameTextBox" placeholder="Full Name" ></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="OrangeRed" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full name is required" ControlToValidate="FullNameTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-md">
                            <span class="input-group-addon" id="company-sizing-addon2"><i class="fa fa-building"></i></span>
                            <asp:TextBox runat="server" CssClass="form-control" ID="CompanyTextBox" placeholder="Company"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="OrangeRed" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Company name is required" ControlToValidate="CompanyTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-md">
                            <span class="input-group-addon" id="email-sizing-addon2"><i class="fa fa-envelope"></i></span>
                            <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="EmailTextBox" placeholder="email@youremail.com"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="OrangeRed" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ControlToValidate="EmailTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-md">
                            <span class="input-group-addon" id="phone-sizing-addon2"><i class="fa fa-phone"></i></span>
                            <asp:TextBox runat="server" TextMode="Phone" CssClass="form-control" ID="PhoneNumberTextBox" placeholder="123-456-7890"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ForeColor="OrangeRed" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone number is required" ControlToValidate="PhoneNumberTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="MessageTextBox">Message: </label>
                        <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="MessageTextBox" placeholder="please write a message."></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="OrangeRed" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Message is required" ControlToValidate="MessageTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text-center">
                        <asp:Button runat="server" ID="SubmitBtn" CssClass="btn btn-submit" Text="Submit" OnClick="Submit_Click" CausesValidation="true" />
                        <asp:Button runat="server" ID="ResetBtn" CssClass="btn btn-reset" Text="Reset" OnClick="ResetBtn_Click" CausesValidation="false" />                        
                    </div>
                </div>
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of main -->
</asp:Content>
