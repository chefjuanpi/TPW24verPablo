using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class ContactAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdSendMsg_Click(object sender, EventArgs e)
        {
            try {
              DB.OpenCon();

                SqlCommand com = new SqlCommand("SELECT UserID FROM Users WHERE UserName = @username");
                com.Parameters.AddWithValue("@username", "daveadmin");

                if (DB.ExecuteReader(com))
                {
                    if (DB.DR.Read())
                    {
                        com = new SqlCommand("INSERT INTO PrivateMsgs (WrittenBy, SentTo, Content, PrivateMsgTitle) VALUES (@writtenBy, @sentTo, @content, @privateMsgTitle)");
                        com.Parameters.AddWithValue("@writtenBy", Membership.GetUser().ProviderUserKey);
                        com.Parameters.AddWithValue("@sentTo", Membership.GetUser("daveadmin").ProviderUserKey);
                        com.Parameters.AddWithValue("@content", txtMessage.Text);
                        com.Parameters.AddWithValue("@privateMsgTitle", txtSubject.Text);

                        if (DB.ExecuteNonQuery(com) == 1)
                        {
                            txtSubject.Text = txtMessage.Text = txtMessage.Text = "";
                            txtMessage.Text = "Votre message a été envoyé avec succès";
                        }
                        else
                        {
                            txtMessage.Text = "Une erreur s'est produite. Veuillez contacter l'administrateur ou réessayer plus tard.";
                        }
                    }
                    else
                    {
                        txtMessage.Text = string.Format("* Aucun utilisateur ayant le nom \"{0}\" n'a été trouvé", txtSubject.Text);
                    }
                }

                DB.CloseCon();
            }
            catch (System.Net.Mail.SmtpException ex) {
                if (ex.StatusCode == SmtpStatusCode.MustIssueStartTlsFirst)
                    Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=L'admin n'a pas voullut révéler son vrai mot de passe dans son code source. Pour cette raison, il n'est pas possible de contacter l'administrateur."));
                else
                    throw ex;
            }
            catch (Exception) {
                Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=Une erreur inconnue s'est produite. Contactez l'administrateur ou réessayez plus tard."));
            }
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}