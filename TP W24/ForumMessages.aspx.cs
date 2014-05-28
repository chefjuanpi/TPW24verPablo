using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class ForumMessages : System.Web.UI.Page
    {
        private void FillRepeaters(string topicID)
        {
            DB.OpenCon();

            DataSet dsMessages = new DataSet();

            SqlDataAdapter daMessages = new SqlDataAdapter(
                "SELECT *, " +
                "(SELECT COUNT(*) FROM Messages " +
                " WHERE WrittenBy = u.UserID) AS messageCount " +
                "FROM Messages m " + 
                "INNER JOIN Users u " +
                "ON m.WrittenBy = u.UserID " +
                "INNER JOIN Utilisateurs util " +
                "ON u.UserID = util.UserID " +
                "WHERE m.TopicID = @topicID",
                DB.Con);

            daMessages.SelectCommand.Parameters.AddWithValue("@topicID", topicID);

            DB.FillDataSet(daMessages, dsMessages);
            DB.BindControl(rptMessages, dsMessages);

            DB.CloseCon();
        }

        private void IncrementTopicViewCount(string topicID)
        {
            DB.OpenCon();

            DB.ExecuteNonQuery(new SqlCommand("UPDATE Topics SET ViewCount = ViewCount + 1 WHERE TopicID = '" + topicID + "'"));

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated) txtMessage.Enabled = true;
            if (!Page.IsPostBack) {
                if (Request.QueryString["Topic"] == null)
                    Response.Redirect("Default.aspx");
                IncrementTopicViewCount(Request.QueryString["Topic"]);
                FillRepeaters(Request.QueryString["Topic"]);
            }
        }

        protected void cmdReply_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Topic"] != null) {
                DB.OpenCon();

                SqlCommand com = new SqlCommand("INSERT INTO Messages (TopicID, WrittenBy, Content) VALUES (@topicID, @writtenBy, @content)");
                com.Parameters.Add("@topicID", System.Data.SqlDbType.Int);
                com.Parameters.Add("@writtenBy", System.Data.SqlDbType.UniqueIdentifier);
                com.Parameters.Add("@content", System.Data.SqlDbType.NText);
                com.Parameters["@topicID"].Value = Request.QueryString["Topic"];
                com.Parameters["@writtenBy"].Value = Membership.GetUser().ProviderUserKey;
                com.Parameters["@content"].Value = txtMessage.Text;

                DB.ExecuteNonQuery(com);

                DB.CloseCon();

                Response.Redirect(Page.ResolveUrl("~/ForumMessages.aspx?Topic=" + Request.QueryString["Topic"]));
            }
        }

        protected void cmdDeleteMsg_Click(object sender, EventArgs e)
        {
            int messageID = int.Parse(((Button)sender).CommandArgument);

            DB.OpenCon();
            DB.ExecuteNonQuery(new SqlCommand("UPDATE Messages SET IsBlocked = 1 WHERE MessageID = " + messageID));
            DB.CloseCon();

            Response.Redirect("ForumMessages.aspx?Topic=" + Request.QueryString["Topic"]);
        }

        protected void cmdUndelete_Click(object sender, EventArgs e)
        {
            int messageID = int.Parse(((Button)sender).CommandArgument);

            DB.OpenCon();
            DB.ExecuteNonQuery(new SqlCommand("UPDATE Messages SET IsBlocked = 0 WHERE MessageID = " + messageID));
            DB.CloseCon();

            Response.Redirect("ForumMessages.aspx?Topic=" + Request.QueryString["Topic"]);
        }
    }
}