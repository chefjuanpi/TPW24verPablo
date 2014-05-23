using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class SendMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("ForumBoards.aspx");
            if (!Page.IsPostBack) {
                if (Request.QueryString["Member"] != null) {
                    txtSendTo.Text = Membership.GetUser(new Guid(Request.QueryString["Member"])).UserName;
                }
            }
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            DB.OpenCon();

            SqlCommand com = new SqlCommand("SELECT UserID FROM Users WHERE UserName = @username");
            com.Parameters.AddWithValue("@username", txtSendTo.Text);

            if (DB.ExecuteReader(com)) {
                if (DB.DR.Read()) {
                    msgLiteral.Text = "";

                    com = new SqlCommand("INSERT INTO PrivateMsgs (WrittenBy, SentTo, Content, PrivateMsgTitle) VALUES (@writtenBy, @sentTo, @content, @privateMsgTitle)");
                    com.Parameters.AddWithValue("@writtenBy", Membership.GetUser().ProviderUserKey);
                    com.Parameters.AddWithValue("@sentTo", Membership.GetUser(txtSendTo.Text).ProviderUserKey);
                    com.Parameters.AddWithValue("@content", txtSubject.Text);
                    com.Parameters.AddWithValue("@privateMsgTitle", txtSubject.Text);

                    if (DB.ExecuteNonQuery(com) == 1) {
                        txtSubject.Text = txtSendTo.Text = txtMessage.Text = "";
                        msgLiteral.Text = "Votre message a été envoyé avec succès";
                    }
                    else {
                        msgLiteral.Text = "Une erreur s'est produite. Veuillez contacter l'administrateur ou réessayer plus tard.";
                    }
                }
                else {
                    msgLiteral.Text = string.Format("* Aucun utilisateur ayant le nom \"{0}\" n'a été trouvé", txtSendTo.Text);
                }
            }

            DB.CloseCon();
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForumBoards.aspx");
        }
    }
}