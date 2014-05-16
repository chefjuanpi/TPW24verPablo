﻿using System;
using System.Web;
using System.Web.Security;
using Microsoft.AspNet.Membership.OpenAuth;
using System.Configuration;
using System.Data.SqlClient;

namespace lab6.Account
{
    public partial class RegisterExternalLogin : System.Web.UI.Page
    {
        protected string ProviderName
        {
            get { return (string)ViewState["ProviderName"] ?? String.Empty; }
            private set { ViewState["ProviderName"] = value; }
        }

        protected string ProviderDisplayName
        {
            get { return (string)ViewState["ProviderDisplayName"] ?? String.Empty; }
            private set { ViewState["ProviderDisplayName"] = value; }
        }

        protected string ProviderUserId
        {
            get { return (string)ViewState["ProviderUserId"] ?? String.Empty; }
            private set { ViewState["ProviderUserId"] = value; }
        }

        protected string ProviderUserName
        {
            get { return (string)ViewState["ProviderUserName"] ?? String.Empty; }
            private set { ViewState["ProviderUserName"] = value; }
        }

        protected void Page_Load()
        {
            if (!IsPostBack)
            {
                ProcessProviderResult();
            }
        }

        protected void logIn_Click(object sender, EventArgs e)
        {
            CreateAndLoginUser();
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            RedirectToReturnUrl();
        }

        private void ProcessProviderResult()
        {
            // Traiter le résultat à partir d'un fournisseur d'authentification de la demande
            ProviderName = OpenAuth.GetProviderNameFromCurrentRequest();

            if (String.IsNullOrEmpty(ProviderName))
            {
                Response.Redirect(FormsAuthentication.LoginUrl);
            }

            // Générer l'URL de redirection pour la vérification OpenAuth
            var redirectUrl = "~/Account/RegisterExternalLogin";
            var returnUrl = Request.QueryString["ReturnUrl"];
            if (!String.IsNullOrEmpty(returnUrl))
            {
                redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(returnUrl);
            }

            // Vérifier la charge utile OpenAuth
            var authResult = OpenAuth.VerifyAuthentication(redirectUrl);
            ProviderDisplayName = OpenAuth.GetProviderDisplayName(ProviderName);
            if (!authResult.IsSuccessful)
            {
                Title = "Échec de la connexion externe";
                userNameForm.Visible = false;

                providerMessage.Text = String.Format("Échec de la connexion externe {0},", ProviderDisplayName);

                // Pour afficher cette erreur, activer le traçage des pages dans web.config (<system.web><trace enabled="true"/></system.web>) et consulter ~/Trace.axd
                Trace.Warn("OpenAuth", String.Format("Une erreur est survenue lors de la vérification de l'authentification avec {0})", ProviderDisplayName), authResult.Error);
                return;
            }

            // L'utilisateur s'est bien connecté au fournisseur
            // Vérifier si l'utilisateur est déjà inscrit localement
            if (OpenAuth.Login(authResult.Provider, authResult.ProviderUserId, createPersistentCookie: false))
            {
                RedirectToReturnUrl();
            }

            // Stocker les détails du fournisseur dans ViewState
            ProviderName = authResult.Provider;
            ProviderUserId = authResult.ProviderUserId;
            ProviderUserName = authResult.UserName;
            var extra = authResult.ExtraData;

                        


            // Enlever la chaîne de requête de l'action
            Form.Action = ResolveUrl(redirectUrl);

            if (User.Identity.IsAuthenticated)
            {
                // L'utilisateur est déjà authentifié, ajouter la connexion externe et rediriger vers l'URL de renvoi
                OpenAuth.AddAccountToExistingUser(ProviderName, ProviderUserId, ProviderUserName, User.Identity.Name);
                RedirectToReturnUrl();
            }
            else
            {
                // Il s'agit d'un nouvel utilisateur, demander quel est le nom de membre souhaité
                userName.Text = extra["name"];
            }
        }

        private void CreateAndLoginUser()
        {
            if (!IsValid)
            {
                return;
            }

            var createResult = OpenAuth.CreateUser(ProviderName, ProviderUserId, ProviderUserName, userName.Text);
          
            
            string conection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection cn = new SqlConnection(conection);
            cn.Open();
            string query = "UPDATE Memberships SET Email = '" + ProviderUserName + "' WHERE UserID = (SELECT " 
                            + " u.UserId FROM Users u WHERE u.UserName = @User)";
            SqlCommand com = new SqlCommand(query, cn);
            com.Parameters.AddWithValue("@User", userName.Text);
            com.ExecuteNonQuery();
            cn.Close();

            if (!createResult.IsSuccessful)
            {
                userNameMessage.Text = createResult.ErrorMessage;
            }
            else
            {
                // Utilisateur créé & associé OK
                if (OpenAuth.Login(ProviderName, ProviderUserId, createPersistentCookie: false))
                {
                    RedirectToReturnUrl();
                }
            }
        }

        private void RedirectToReturnUrl()
        {
            var returnUrl = Request.QueryString["ReturnUrl"];
            if (!String.IsNullOrEmpty(returnUrl) && OpenAuth.IsLocalUrl(returnUrl))
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                Response.Redirect("../Default.aspx");
            }
        }
    }
}