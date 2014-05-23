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
    public partial class Default : System.Web.UI.Page
    {
        private void FillRecentTopicsRepeater()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TOP 5 TopicID, TopicTitle, StartedBy, UserName " +
                "FROM Topics t " + 
                "INNER JOIN Users u " +
                "ON t.StartedBy = u.UserID " +
                "ORDER BY StartedDate DESC",
                DB.Con);

            DB.FillDataSet(da, ds);
            DB.BindRepeater(rptRecentTopics, ds);
        }
        private void FillReventMessagesRepeater()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TOP 5 t.TopicID, TopicTitle, WrittenBy, UserName " +
                "FROM Topics t " + 
                "INNER JOIN Messages m " + 
                "ON t.TopicID = m.TopicID " +
                "INNER JOIN Users u " +
                "ON t.StartedBy = u.UserID " +
                "ORDER BY DateWritten DESC",
                DB.Con);

            DB.FillDataSet(da, ds);
            DB.BindRepeater(rptRecentMessages, ds);
        }
        private void FillNewMembersRepeater()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TOP 5 UserID, UserName " +
                "FROM Users u " +
                "ON t.StartedBy = u.UserID " +
                "INNER JOIN Memberships m " +
                "ON u.UserID = m.UserID " +
                "ORDER BY CreateDate DESC",
                DB.Con);

            DB.FillDataSet(da, ds);
            DB.BindRepeater(rptRecentMessages, ds);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                DB.OpenCon();

                FillRecentTopicsRepeater();
                FillReventMessagesRepeater();
                FillNewMembersRepeater();

                DB.CloseCon();
            }
        }
    }
}