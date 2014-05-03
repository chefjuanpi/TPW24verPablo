﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24.Account
{
    public partial class Registrer : System.Web.UI.Page
    {
        string conection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmdRegister_Click(object sender, EventArgs e)
        {
            if (Valider_Ecran())
            {
                MembershipUser u = Membership.CreateUser(txtUser.Text, txtpass.Text, txtCourriel.Text);
                SqlConnection cn = new SqlConnection(conection);
                cn.Open();
                string query = "INSERT INTO Utilisateurs(UserID, FirstName, LastName, Sexe, Country,"
                                + " Province, City, CreationDate, DateLastLogin) Values(@id, @prenom,"
                                + " @nom, @sexe, @country, @province, @city, @creation, @lastLogin)";
                SqlCommand com = new SqlCommand(query, cn);
                com.Parameters.AddWithValue("@id",        u.ProviderUserKey );
                com.Parameters.AddWithValue("@prenom",    txtprenom.Text    );
                com.Parameters.AddWithValue("@nom",       txtnom.Text       );
                com.Parameters.AddWithValue("@sexe",      Sexe.SelectedValue);
                com.Parameters.AddWithValue("@country",   txtpays.Text      );
                com.Parameters.AddWithValue("@province",  txtprovince.Text  );
                com.Parameters.AddWithValue("@city",      txtville.Text     );
                com.Parameters.AddWithValue("@creation",  DateTime.Now      );
                com.Parameters.AddWithValue("@lastLogin", DateTime.Now      );
                com.ExecuteNonQuery();                                             
                cn.Close();
               
                Response.Redirect("../RegisteredUsers/Account.aspx");
                                          
            }                                                    
                                                              
                                          
                                                                 
        }                                                
        protected bool  Valider_Ecran()                 
        {
            string query = "SELECT";
            if (txtpass.Text != txtpass2.Text)
            {
                errmsg.Text = "<h2>ERROR Mot de Passe et Confirmation sont differentes !</h2>";
                return false;
            }

            return true;
        }
    }
}