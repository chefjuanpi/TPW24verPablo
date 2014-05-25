using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class Topics : System.Web.UI.Page
    {
        private void FillListView(string boardID)
        {
            DB.OpenCon();

            DataSet dsTopics = new DataSet();

            SqlDataAdapter daTopics = new SqlDataAdapter(
                "SELECT DISTINCT t.TopicID, t.TopicTitle, t.StartedDate, t.StartedBy, t.BoardID, t.ViewCount, " +
                       "topicStarter.Username topicStarterUsername, " +
                       "lastPoster.Username lastPosterUsername, " +
                       "m.DateWritten, " +
                       "m.WrittenBy, " + 
                       "(SELECT COUNT(*) FROM Messages WHERE TopicID = t.TopicID) AS MessageCount " +
                "FROM Topics t " + 
                "INNER JOIN [Messages] m " +
                "ON t.TopicID = m.TopicID " +
                "INNER JOIN Users topicStarter " +
                "ON t.StartedBy = topicStarter.UserID " +
                "INNER JOIN Users lastPoster " +
                "ON m.WrittenBy = lastPoster.UserID " +
                "WHERE m.DateWritten = (" +
	                "SELECT MAX(DateWritten) FROM Messages " +
	                "WHERE TopicID = t.TopicID " +
                ") AND t.BoardID = @boardID",
                DB.Con);

            daTopics.SelectCommand.Parameters.AddWithValue("@boardID", boardID);

            DB.FillDataSet(daTopics, dsTopics);
            
            DB.BindControl(lvTopics, dsTopics.Tables[0]);
            //DB.BindControl(rptTopics, dsTopics);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                if (Request.QueryString["Board"] == null)
                    Response.Redirect("Default.aspx");
                else
                    FillListView(Request.QueryString["Board"]);
                    //FillRepeater(Request.QueryString["Board"]);
            }
        }

        protected void cmdNewTopic_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Board"] != null)
                Response.Redirect(Page.ResolveUrl("~/RegisteredUsers/CreateNewTopic.aspx?Board=" + Request.QueryString["Board"]));
        }
    }
}