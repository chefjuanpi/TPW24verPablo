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
    }
}