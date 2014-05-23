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
    public partial class SeeMessages : System.Web.UI.Page
    {
        private void FillRepeater()
        {
            DB.OpenCon();

            DataSet dsMessages = new DataSet();

            SqlCommand getMessages = new SqlCommand(
              @"SELECT PrivateMsgID, PrivateMsgTitle, WrittenBy, UserName, DateWritten FROM PrivateMsgs m
                INNER JOIN Users u
                ON m.WrittenBy = u.UserID
                WHERE SentTo = @currentUser",
                DB.Con
                );
            getMessages.Parameters.AddWithValue("@currentUser", Membership.GetUser().ProviderUserKey);

            SqlDataAdapter daMessages = new SqlDataAdapter(getMessages);

            DB.FillDataSet(daMessages, dsMessages);
            DB.BindRepeater(rptPrivateMessages, dsMessages);

            DB.CloseCon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("Default.aspx");
            if (!Page.IsPostBack) {
                FillRepeater();
            }
        }
    }
}