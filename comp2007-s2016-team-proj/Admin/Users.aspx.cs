﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//required for EF DB access
using comp2007_s2016_team_proj.Models;
using System.Web.ModelBinding;


namespace comp2007_s2016_team_proj
{
    
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetUsers();
            }
        }

        /**
         * <summary>
         * This method gets the user data from the DB
         * </summary>
         * 
         * @method GetUsers()
         * @returns {void}
         */
        protected void GetUsers()
        {
            using (UserConnection db = new UserConnection())
            {
                var Users = (from users in db.AspNetUsers
                             select users);

                UsersGridView.DataSource = Users.ToList();
                UsersGridView.DataBind();
            }
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int selectedRow = e.RowIndex;

            string UserID = UsersGridView.DataKeys[selectedRow].Values["Id"].ToString();

            using (UserConnection db = new UserConnection())
            {
                AspNetUser deletedUser = (from users in db.AspNetUsers
                                          where users.Id == UserID
                                          select users).FirstOrDefault();
                if(deletedUser != null)
                {
                    db.AspNetUsers.Remove(deletedUser);
                    db.SaveChanges();
                }
            }
            // refresh the grid
            this.GetUsers();
        }
    }
}