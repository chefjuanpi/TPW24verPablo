using System;
using System.Collections.Generic;
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
                string emailHeader = "";

                if (User.Identity.IsAuthenticated)
                    emailHeader += "Membre: " + Membership.GetUser().UserName + "\n\r";

                emailHeader += "Courriel: " + txtEmail + "\n\r";

                MailMessage mail = new MailMessage("w24tp2admin@gmail.com", "w24tp2admin@gmail.com", txtSubject.Text, emailHeader + txtMessage.Text);

                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.Credentials = new System.Net.NetworkCredential("w24tp2admin@gmail.com", "myPassword");

                smtp.EnableSsl = true;

                smtp.Send(mail);

                Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=Votre message à été envoyé avec succès!"));
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