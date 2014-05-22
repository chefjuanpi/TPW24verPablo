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

            daMessages.Fill(dsMessages);

            DB.BindRepeater(rptMessages, dsMessages);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                if (Request.QueryString["Topic"] == null)
                    Response.Redirect("Default.aspx");
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
    }
}