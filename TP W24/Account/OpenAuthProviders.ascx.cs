using System;
using System.Collections.Generic;
using System.Web;
using Microsoft.AspNet.Membership.OpenAuth;

namespace lab6.Account
{
    public partial class OpenAuthProviders : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.PreRenderComplete += Page_PreRenderComplete;


            if (IsPostBack)
            {
                var provider = Request.Form["provider"];
                if (provider == null)
                {
                    return;
                }

                var redirectUrl = "~/Account/RegisterExternalLogin";
                if (!String.IsNullOrEmpty(ReturnUrl))
                {
                    var resolvedReturnUrl = ResolveUrl(ReturnUrl);
                    redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(resolvedReturnUrl);
                }

                OpenAuth.RequestAuthentication(provider, redirectUrl);
            }
        }


        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {

<<<<<<< HEAD
            providersList.DataSource = OpenAuth.AuthenticationClients.GetAll();
            OpenAuth.AuthenticationClients.GetByProviderName("facebook");
=======
            string f = OpenAuth.AuthenticationClients.GetByProviderName("facebook");
>>>>>>> 270f3fd40fdf538ee0e859fce18a7d98d492d631
            providersList.DataBind();
            



       
        }

<<<<<<< HEAD


=======
>>>>>>> 270f3fd40fdf538ee0e859fce18a7d98d492d631
        protected T Item<T>() where T : class
        {
            return Page.GetDataItem() as T ?? default(T);
        }


        public string ReturnUrl { get; set; }


    }
<<<<<<< HEAD


=======
>>>>>>> 270f3fd40fdf538ee0e859fce18a7d98d492d631
}