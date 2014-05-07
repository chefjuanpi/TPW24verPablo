using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24.Account
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FBConnect(object sender, EventArgs e)
        {
            OpenAuth.RequestAuthentication("facebook", "~/Account/RegisterExternalLogin");
        }
    }
}