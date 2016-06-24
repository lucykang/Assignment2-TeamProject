<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="comp2007_s2016_team_proj.Users" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <br />
        <div class="panel">
            <div class="row">
                <div class="panel game-form">
                    <h1 class="text-center">Users</h1>
                    <div class="text-right">
                        <a href="../Register.aspx" class="btn btn-submit"><i class="fa fa-plus"></i> Register New User</a>
                    </div>
                    <p><br /></p>
                    <asp:GridView runat="server" ID="UsersGridView" AutoGenerateColumns="false"
                        CssClass="table table-striped table-borderless" OnRowDeleting="UsersGridView_RowDeleting" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="User Name" Visible="true" />
                            <asp:BoundField DataField="Email" HeaderText="Email" Visible="true" />
                            <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/User/UserDetails.aspx" 
                                DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../Register.aspx?Id={0}" 
                                ControlStyle-CssClass="btn btn-register btn-sm" />
                            <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" 
                                ShowDeleteButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-cancel btn-sm" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
