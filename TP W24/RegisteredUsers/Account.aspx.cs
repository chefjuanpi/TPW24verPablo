using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class Compte : System.Web.UI.Page
    {
        string conection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection cn = new SqlConnection(conection);

                cn.Open();
                string query = "select u.UserName, m.CreateDate, m.Email, m.LastLoginDate, ut.City, ut.Country, "
                                + " ut.FirstName, ut.LastName, ut.photoProfil, ut.Province, ut.Sexe, ut.DateNais "
                                + "from users u INNER JOIN Memberships m ON m.UserId = u.UserId LEFT JOIN utilisateurs ut "
                                + " ON ut.UserId = u.UserId WHERE u.UserName = @username";
                SqlCommand comuser = new SqlCommand(query, cn);
                comuser.Parameters.AddWithValue("@username", User.Identity.Name);
                SqlDataReader dr = comuser.ExecuteReader();
                if (dr.Read())
                {
                    lblUtilisateur.Text = dr["UserName"].ToString();
                    txtCreated.Text = dr["CreateDate"].ToString();
                    txtCourriel.Text = dr["Email"].ToString();
                    txtLast.Text = dr["LastLoginDate"].ToString();
                    txtcity.Text = dr["City"].ToString();
                    profileImage.ImageUrl = dr["photoProfil"].ToString();
                    txtPays.Text = dr["Country"].ToString();
                    txtPrenom.Text = dr["FirstName"].ToString();
                    txtNom.Text = dr["LastName"].ToString();
                    txtProvince.Text = dr["Province"].ToString();
                    txtNais.Text = dr["DateNais"].ToString();
                    Sexe.SelectedValue = dr["sexe"].ToString();
                }
                cn.Close();
            }

        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string addresse = "~/images/utilisateurs/" + User.Identity.Name + fileExtension;
                FileUpload1.SaveAs(MapPath(addresse));

                string test = MapPath(addresse);

                profileImage.ImageUrl = addresse;
                SqlConnection cn = new SqlConnection(conection);
                cn.Open();
                string query = "UPDATE Utilisateurs SET photoProfil = '" + addresse + "' WHERE UserID = (SELECT "
                                + " u.UserId FROM Users u WHERE u.UserName = @User)";
                SqlCommand com = new SqlCommand(query, cn);
                com.Parameters.AddWithValue("@User", User.Identity.Name);
                com.ExecuteNonQuery();
                cn.Close();
            }
            else errmsg.Text = "Selectioner un fichier de image avant";
        }

        protected void modINFO_Click(object sender, EventArgs e)
        {
            if (modINFO.Text != "Enregistrer")
            {
                barrer_debarrer(true);
                txtNais.CssClass = "txtDate";
                modINFO.Text = "Enregistrer";
                modINFO.ValidationGroup = "modPersonalInfo";
            }
            else
            {
                SqlConnection cn = new SqlConnection(conection);
                cn.Open();
                string query = "Update Utilisateurs set FirstName = @Prenom, LastName = @Nom, sexe = @sexe,"
                                + " Country = @country, Province = @province, city = @City, DateNais = @datenais "
                                + " WHERE UserID = (SELECT u.UserId FROM Users u WHERE u.UserName = @User)";
                SqlCommand com = new SqlCommand(query, cn);
                com.Parameters.AddWithValue("@Prenom", txtPrenom.Text);
                com.Parameters.AddWithValue("@Nom", txtNom.Text);
                com.Parameters.AddWithValue("@sexe", Sexe.SelectedValue);
                com.Parameters.AddWithValue("@country", txtPays.Text);
                com.Parameters.AddWithValue("@province", txtProvince.Text);
                com.Parameters.AddWithValue("@City", txtcity.Text);
                com.Parameters.AddWithValue("@datenais", txtNais.Text);
                com.Parameters.AddWithValue("@User", User.Identity.Name);
                com.ExecuteNonQuery();
                cn.Close();
                barrer_debarrer(true);
                txtNais.CssClass = "";
                modINFO.Text = "Modifier Info";
                modINFO.ValidationGroup = "123";
            }

        }

        protected void barrer_debarrer(bool choix)
        {
            txtPrenom.Enabled = choix;
            txtNom.Enabled = choix;
            txtcity.Enabled = choix;
            txtProvince.Enabled = choix;
            txtPays.Enabled = choix;
            Sexe.Enabled = choix;
        }
    }
}