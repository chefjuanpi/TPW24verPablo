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
    public partial class ReadMessage : System.Web.UI.Page
    {
        private void FillMessageInfos(string msgID)
        {
            DB.OpenCon();

            SqlCommand com = new SqlCommand(
              @"SELECT m.*, UserName, photoProfil FROM PrivateMsgs m
                INNER JOIN Users u
                ON m.WrittenBy = u.UserID
                INNER JOIN Utilisateurs util
                ON util.UserID = u.UserID
                WHERE m.SentTo = @currentUser
                AND PrivateMsgID = @msgID");
            com.Parameters.AddWithValue("@currentUser", Membership.GetUser().ProviderUserKey);
            com.Parameters.AddWithValue("@msgID", msgID);

            if (DB.ExecuteReader(com) && DB.DR.Read()) {
                subject.InnerHtml = "<strong>" + DB.DR["PrivateMsgTitle"].ToString() + "</strong>";
                senderLink.InnerHtml = DB.DR["UserName"].ToString();
                senderLink.HRef = Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=" + DB.DR["WrittenBy"].ToString());
                profileImg.Src = DB.DR["photoProfil"].ToString();
                msgContent.InnerHtml = DB.DR["Content"].ToString();
                msgFooter.InnerHtml = " Envoyé le: " + DB.DR["DateWritten"].ToString();
            }

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated || Request.QueryString["msgID"] == null)
                Response.Redirect("Default.aspx");
            if (!Page.IsPostBack) {
                FillMessageInfos(Request.QueryString["msgID"]);
            }
        }

        protected void cmdReply_Click(object sender, EventArgs e)
        {
            DB.OpenCon();

            DB.ExecuteReader(new SqlCommand("SELECT PrivateMsgTitle, WrittenBy FROM PrivateMsgs WHERE PrivateMsgID = " + Request.QueryString["msgID"]));
            if (!DB.DR.Read()) {
                DB.CloseCon();
                Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=Une erreur s'est produite. Contactez l'administrateur ou réessayer plus tard."));
            }
            string title = "Re: " + DB.DR[0];
            string destinedUser = DB.DR[1].ToString();

            SqlCommand insertCmd = new SqlCommand("INSERT INTO PrivateMsgs (WrittenBy, SentTo, PrivateMsgTitle, Content) VALUES (@writtenBy, @sentTo, @privateMsgTitle, @content)");
            insertCmd.Parameters.AddWithValue("@writtenBy", Membership.GetUser().ProviderUserKey);
            insertCmd.Parameters.AddWithValue("@sentTo", destinedUser);
            insertCmd.Parameters.AddWithValue("@privateMsgTitle", title);
            insertCmd.Parameters.AddWithValue("@content", txtMessage.Text);

            if(DB.ExecuteNonQuery(insertCmd) != 1) {
                DB.CloseCon();
                Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=Une erreur s'est produite. Contactez l'administrateur ou réessayer plus tard."));
            }

            DB.CloseCon();
            Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=Votre message a été envoyé avec succès."));
        }
    }
}