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
    public partial class CreateNewTopic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect(Page.ResolveUrl("~/Redirect.aspx?Msg=Vous devez être connecté pour accéder à cette page."));
            if (Request.QueryString["Board"] == null)
                Response.Redirect(Page.ResolveUrl("~/Default.aspx"));
        }

        protected void cmdCreateTopic_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Board"] != null) {
                DB.OpenCon();

                SqlCommand com = new SqlCommand("INSERT INTO Topics (BoardID, StartedBy, TopicTitle) VALUES (@boardID, @startedBy, @topicTitle)");
                com.Parameters.Add("@boardID", System.Data.SqlDbType.Int);
                com.Parameters.Add("@startedBy", System.Data.SqlDbType.UniqueIdentifier);
                com.Parameters.Add("@topicTitle", System.Data.SqlDbType.VarChar, 100);
                com.Parameters["@boardID"].Value = Request.QueryString["Board"];
                com.Parameters["@startedBy"].Value = Membership.GetUser().ProviderUserKey;
                com.Parameters["@topicTitle"].Value = txtSubject.Text;

                if (DB.ExecuteNonQuery(com) == 1) {
                    int newTopicID;

                    if (DB.ExecuteScalar(new SqlCommand("SELECT MAX(TopicID) FROM Topics"), out newTopicID)) {
                        com = new SqlCommand("INSERT INTO Messages (TopicID, WrittenBy, Content) VALUES (@topicID, @writtenBy, @content)");
                        com.Parameters.Add("@topicID", System.Data.SqlDbType.Int);
                        com.Parameters.Add("@writtenBy", System.Data.SqlDbType.UniqueIdentifier);
                        com.Parameters.Add("@content", System.Data.SqlDbType.NText);
                        com.Parameters["@topicID"].Value = newTopicID;
                        com.Parameters["@writtenBy"].Value = Membership.GetUser().ProviderUserKey;
                        com.Parameters["@content"].Value = txtMessage.Text;

                        DB.ExecuteNonQuery(com);

                        DB.CloseCon();

                        Response.Redirect(Page.ResolveUrl("~/ForumMessages.aspx?Topic=" + newTopicID));
                    }
                }
                else {
                    Response.Write("Une erreur s'est produite. Contactez l'administrateur ou réessayez plus tard.");

                    DB.CloseCon();
                }
            }
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Page.ResolveUrl("~/Topics.aspx?Board=" + Request.QueryString["Board"]));
        }
    }
}