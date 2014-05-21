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
    public partial class ForumTopics : System.Web.UI.Page
    {
        private void FillRepeaters(string boardID)
        {
            DB.OpenCon();

            DataSet dsBoards = new DataSet();

            SqlDataAdapter daBoards = new SqlDataAdapter("SELECT TOP 1 t.TopicID, " + // Changer cette requête en vue avec trigger pour augmenter t.ViewCount. Une fois changé en vue, il sera aussi plus aisé de faire le messageCount
                                                                      "t.TopicTitle, " + 
                                                                      "t.StartedDate, " + // Champ à ajouter
                                                                      "(SELECT Username FROM Users " +
                                                                      " WHERE UserID = topicStarterID) AS topicStarter, " +
                                                                      "t.StartedBy topicStarterID, " +
                                                                      "t.BoardID, " +
                                                                      "t.ViewCount, " + // Champ à ajouter
                                                                      "m.DateWritten, " +
                                                                      "(SELECT Username FROM Users " +
                                                                      " WHERE UserID = lastPosterID) AS lastPoster, " +
                                                                      "m.WrittenBy lastPosterID, " + 
                                                                      "u.Username, " +
                                                                      "COUNT(m.MessageID) MessageCount " +
                                                         "FROM Topics t " + 
                                                         "INNER JOIN Users u " +
                                                         "ON t.StartedBy = u.UserID " +
                                                         "INNER JOIN Messages m " +
                                                         "ON t.TopicID = m.TopicID " +
                                                         "WHERE t.BoardID = @boardID " +
                                                         "ORDER BY m.DateWritten DESC", DB.Con);

            daBoards.SelectCommand.Parameters.AddWithValue("@boardID", boardID);

            daBoards.Fill(dsBoards);

            DB.BindRepeater(rptTopics, dsBoards);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                if (Request.QueryString["Board"] == null)
                    Response.Redirect("Default.aspx");
                FillRepeaters(Request.QueryString["Board"]);
            }
        }
    }
}