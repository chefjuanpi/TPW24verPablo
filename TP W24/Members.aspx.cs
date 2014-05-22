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
    public partial class Membres : System.Web.UI.Page
    {
        private void FillRepeater(string usernameLike = "", int msgCountMin = 1)
        {
            DB.OpenCon();

            DataSet dsMessages = new DataSet();

            SqlCommand getMembers = new SqlCommand(
              @"SELECT * FROM Users u
                INNER JOIN Memberships m
                ON u.UserID = m.UserID
                LEFT JOIN Topics t
                ON t.StartedBy = u.UserID 
                LEFT JOIN (SELECT WrittenBy, COUNT(MessageID) MessageCount FROM Messages GROUP BY WrittenBy) MessageCount
                ON u.UserID = MessageCount.WrittenBy
                LEFT JOIN Messages mess
                ON mess.WrittenBy = u.UserID
                WHERE t.TopicID = (
	                SELECT TOP 1 st.TopicID FROM Topics st
	                LEFT JOIN [Messages] sm
	                ON st.TopicID = sm.MessageID
	                WHERE st.StartedBy = u.UserID
	                ORDER BY sm.DateWritten DESC
                )
                AND Mess.MessageID = (
	                SELECT MAX(messageID) FROM [Messages]
	                WHERE TopicID = t.TopicID
	                AND StartedBy = u.UserID
                )
                AND u.UserName LIKE '%' + @usernameLike + '%'
                AND MessageCount > @msgCountMin",
                DB.Con
              );

            getMembers.Parameters.AddWithValue("@usernameLike", usernameLike);
            getMembers.Parameters.AddWithValue("@msgCountMin", msgCountMin);

            SqlDataAdapter daMessages = new SqlDataAdapter(getMembers);

            daMessages.Fill(dsMessages);

            DB.BindRepeater(rptMembers, dsMessages);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                FillRepeater();
            }
        }
    }
}