using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class Compte : System.Web.UI.Page
    {
        private const string GET_USER_QUERY = "select u.UserName, m.CreateDate, m.Email, m.LastLoginDate, ut.City, ut.Country, "
                                            + " ut.FirstName, ut.LastName, ut.photoProfil, ut.Province, ut.Sexe, ut.DateNais "
                                            + "from users u INNER JOIN Memberships m ON m.UserId = u.UserId LEFT JOIN utilisateurs ut "
                                            + " ON ut.UserId = u.UserId WHERE u.UserName = @username";

        string conection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string requestedMemberID = Request.QueryString["Member"];

                if (requestedMemberID == null || requestedMemberID == Membership.GetUser().ProviderUserKey.ToString()) {
                    sendMessageLink.Visible = false;
                    afficherInfo();
                }
                else {
                    HideEditControls();
                    afficherInfo(requestedMemberID);
                    sendMessageLink.HRef = Page.ResolveUrl("~/SendMessage.aspx?Member=" + requestedMemberID);
                }
            }

        }

        private void HideEditControls()
        {
            seeMessagesLink.Visible = false;
            LoginStatus1.Visible = false;
            modPass.Visible = false;
            UploadImage.Visible = false;
            FileUpload1.Visible = false;
            modINFO.Visible = false;
        }

        private void afficherInfo(string userID)
        {
            DB.OpenCon();

            SqlCommand getUser = new SqlCommand(GET_USER_QUERY);
            string username = Membership.GetUser(new Guid(userID)).UserName;
            string u2 = User.Identity.Name;
            getUser.Parameters.AddWithValue("@username", Membership.GetUser(new Guid(userID)).UserName);

            if(DB.ExecuteReader(getUser) && DB.DR.Read()) {
                lblUtilisateur.Text = DB.DR["UserName"].ToString();
                txtCreated.Text = DB.DR["CreateDate"].ToString();
                txtCourriel.Text = DB.DR["Email"].ToString();
                txtLast.Text = DB.DR["LastLoginDate"].ToString();
                txtcity.Text = DB.DR["City"].ToString();
                profileImage.ImageUrl = DB.DR["photoProfil"].ToString();
                txtPays.Text = DB.DR["Country"].ToString();
                txtPrenom.Text = DB.DR["FirstName"].ToString();
                txtNom.Text = DB.DR["LastName"].ToString();
                txtProvince.Text = DB.DR["Province"].ToString();
                txtNais.Text = DB.DR["DateNais"].ToString();
                Sexe.SelectedValue = DB.DR["sexe"].ToString();
            }

            DB.CloseCon();
        }

        private void afficherInfo()
        {
            SqlConnection cn = new SqlConnection(conection);

            cn.Open();
            SqlCommand comuser = new SqlCommand(GET_USER_QUERY, cn);
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
        //protected void byebye()
        //{

        //}

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string addresse = "~/images/utilisateurs/" + User.Identity.Name + fileExtension;
                FileUpload1.SaveAs(MapPath(addresse));
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
                Barrer_debarrer(true);
                modINFO.Text = "Enregistrer";
                modINFO.ValidationGroup = "modPersonalInfo";
                txtNais.CssClass = "txtDate";
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
                afficherInfo();
                modINFO.Text = "Modifier Info";
                modINFO.ValidationGroup = "123";
                txtNais.CssClass = "";
            }

        }

        private void Barrer_debarrer(bool choix)
        {
            txtNais.Enabled = choix;
            txtPrenom.Enabled = choix;
            txtNom.Enabled = choix;
            txtcity.Enabled = choix;
            txtProvince.Enabled = choix;
            txtPays.Enabled = choix;
            Sexe.Enabled = choix;
        }
    }
}