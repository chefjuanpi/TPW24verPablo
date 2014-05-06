using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
                if (!Page.IsValid) return;
                if (Valider_Ecran())
                {
                    MembershipUser u = Membership.CreateUser(txtUser.Text, txtpass.Text, txtCourriel.Text);
                    SqlConnection cn = new SqlConnection(conection);
                    cn.Open();
                    string query = "INSERT INTO Utilisateurs(UserID, FirstName, LastName, Sexe, Country,"
                                    + " Province, City) Values(@id, @prenom, @nom, @sexe, @country, @province, @city)";
                    SqlCommand com = new SqlCommand(query, cn);
                    com.Parameters.AddWithValue("@id", u.ProviderUserKey);
                    com.Parameters.AddWithValue("@prenom", txtprenom.Text);
                    com.Parameters.AddWithValue("@nom", txtnom.Text);
                    com.Parameters.AddWithValue("@sexe", Sexe.SelectedValue);
                    com.Parameters.AddWithValue("@country", txtpays.Text);
                    com.Parameters.AddWithValue("@province", txtprovince.Text);
                    com.Parameters.AddWithValue("@city", txtville.Text);
                    com.ExecuteNonQuery();
                    cn.Close();
                    FormsAuthentication.SetAuthCookie(txtUser.Text, createPersistentCookie: false);
                    Response.Redirect("../RegisteredUsers/Account.aspx");
                }
        }  
                                              
        protected bool  Valider_Ecran()                 
        {
            if (!validerUtilisateur()) return false;

            if (txtpass.Text != txtpass2.Text)
            {
                errmsg.Text = "<h2>ERROR! Le mot de passe et le mot de passe de confirmation ne correspondent pas.</h2>";
                return false;
            }
            if (!validerCourriel()) return false;
            return true;
        }

        protected bool validerUtilisateur()
        {
            string query = "SELECT UserName from Users WHERE UserName = @id";
            SqlConnection cn = new SqlConnection(conection);
            cn.Open();
            SqlCommand com = new SqlCommand(query, cn);
            com.Parameters.AddWithValue("@id", txtUser.Text);
            SqlDataAdapter da = new SqlDataAdapter(com);
            
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                errmsg.Text = "<h2>ERROR! Utilisateur dejà existant</h2>";
                return false;
            }
            else return true;
        }

        protected bool validerCourriel()
        {
            string query = "SELECT Email from Memberships WHERE Email = '" + txtCourriel.Text + "'";
            SqlConnection cn = new SqlConnection(conection);
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                errmsg.Text = "<h2>ERROR! Éxist dejà un Utilisateur avec cete courriel</h2>";
                return false;
            }
            else return true;
        }
    }
}