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
    public partial class Forum : System.Web.UI.Page
    {
        private void FillRepeaters()
        {
            DB.OpenCon();

            DataSet dsBoards = new DataSet();

            SqlDataAdapter daBoards = new SqlDataAdapter(
                "SELECT * FROM BoardCategories;" +
               @"SELECT b.BoardID, b.BoardCategoryID, b.BoardName,
		                m.DateWritten, m.WrittenBy, m.MessageID, m.TopicID,
		                t.topicID, t.TopicTitle,
		                u.UserName,
		                (SELECT COUNT(*) FROM Topics WHERE BoardID = t.BoardID) AS TopicCount,
		                (SELECT COUNT(*) FROM Topics st 
                         INNER JOIN Messages sm 
                         ON st.TopicID = sm.TopicID 
                         WHERE st.BoardID = t.BoardID) AS MessageCount
                FROM Boards b 
                LEFT JOIN Topics t 
                ON b.BoardID = t.BoardID 
                LEFT JOIN [Messages] m 
                ON t.TopicID = m.TopicID
                LEFT JOIN Users u
                ON u.UserId = m.WrittenBy
                WHERE t.topicID = (
	                SELECT TOP 1 st.TopicID FROM Topics st
	                LEFT JOIN [Messages] sm
	                ON st.TopicID = sm.MessageID
	                WHERE st.BoardID = b.BoardID
	                ORDER BY sm.DateWritten DESC
                ) /*AND m.TopicID = (
	                SELECT TOP 1 st.TopicID FROM Topics st
	                LEFT JOIN [Messages] sm
	                ON st.TopicID = sm.MessageID
	                WHERE st.BoardID = b.BoardID
	                ORDER BY sm.DateWritten DESC
                )*/ AND m.messageID = (
	                SELECT MAX(messageID) FROM [Messages]
	                WHERE TopicID = t.TopicID
                )",
                DB.Con);

            DB.FillDataSet(daBoards, dsBoards);

            dsBoards.Relations.Add(
                "BoardsBoardsCategories",
                dsBoards.Tables[0].Columns["BoardCategoryID"],
                dsBoards.Tables[1].Columns["BoardCategoryID"]);

            DB.BindRepeater(rptBoardCategories, dsBoards);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack) {
                FillRepeaters();
            //}
        }
    }
}