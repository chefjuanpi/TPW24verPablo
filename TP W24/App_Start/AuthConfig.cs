using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Membership.OpenAuth;

namespace TPW24
{
    internal static class AuthConfig
    {
        public static void RegisterOpenAuth()
        {
            // Consultez http://go.microsoft.com/fwlink/?LinkId=252803 pour plus de détails sur la configuration de cette application ASP.NET
            // afin qu'elle prenne en charge la connexion par l'intermédiaire de services externes.

            //OpenAuth.AuthenticationClients.AddTwitter(
            //    consumerKey: "90e9e6df005f20b5a193c36d23fd713f",
            //    consumerSecret: "90e9e6df005f20b5a193c36d23fd713f");

            OpenAuth.AuthenticationClients.AddFacebook(
                appId: "438081452993871",
                appSecret: "a9554c3576c681b47b8d350555459a81");



            //OpenAuth.AuthenticationClients.AddMicrosoft(
            //    clientId: "155567074550166",
            //    clientSecret: "90e9e6df005f20b5a193c36d23fd713f");

            OpenAuth.AuthenticationClients.AddGoogle();

        }
    }
}