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
                                + " ut.FirstName, ut.LastName, ut.photoProfil, ut.Province, ut.Sexe from users u "
                                + " INNER JOIN Memberships m ON m.UserId = u.UserId LEFT JOIN utilisateurs ut "
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



                }
                cn.Close();
            }

        }
        protected void byebye()
        {

        }

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
    }
}