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
                "SELECT b.BoardID, " + // Changer requête en vue? -> plus performance, code plus simple
                       "BoardCategoryID, " +
                       "BoardName, " +
                       "COUNT(t.TopicID) TopicCount, " +
                       "COUNT(m.MessageID) MessageCount, " +
                       "(SELECT TOP 1 sm.DateWritten, sm.WrittenBy, sm.MessageID, sm.TopicID, st.TopicTitle, su.UserName " +
                       " FROM Messages sm " +
                       " INNER JOIN Topics st " +
                       " ON sm.TopicID = st.TopicID " +
                       " INNER JOIN Users su " +
                       " ON sm.WrittenBy = su.UserName " +
                       " WHERE st.BoardID = b.BoardID " +
                       " ORDER BY sm.DateWritten DESC) " +
                "FROM Boards b " +
                "INNER JOIN Topics t " +
                "ON b.BoardID = t.BoardID " +
                "INNER JOIN [Messages] m " +
                "ON t.TopicID = m.TopicID " +
                "GROUP BY b.BoardID, BoardCategoryID, BoardName;",
                DB.Con);

            daBoards.Fill(dsBoards);

            dsBoards.Relations.Add(
                "BoardsBoardsCategories",
                dsBoards.Tables[0].Columns["BoardCategoryID"],
                dsBoards.Tables[1].Columns["BoardCategoryID"]);

            DB.BindRepeater(rptBoardCategories, dsBoards);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                FillRepeaters();
            }
        }
    }
}