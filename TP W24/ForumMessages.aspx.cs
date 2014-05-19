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
    }
}