using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace TP_W24
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmdRegister_Click(object sender, EventArgs e)
        {
            MembershipUser u = Membership.CreateUser(txtUser.Text, txtpass.Text, txtemail.Text);

            //u.ProviderUserKey

        }
    }
}