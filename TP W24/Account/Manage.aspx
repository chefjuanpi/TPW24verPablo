<%@ Page Title="Gérer le compte" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="lab6.Account.Manage" %>

<%@ Import Namespace="Microsoft.AspNet.Membership.OpenAuth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" media="all">
        h1 {
            color: #000;
            text-align: left;
            font-size: 24px;
            line-height: 60px;
            font-weight: bold;
        }
        #body_externalLoginsList_conectButton_0 {
            height: 27px;
            padding-top:3px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="header1" runat="server">
   <div style="margin-left:20%; margin-right:20%; text-align:center;"> 
        <h1>Gerer les conections</h1>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <div style="margin-left:20%; margin-right:20%;"> 
    <section id="passwordForm">
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="message-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

        <p>Vous êtes connecté en tant que :&nbsp<strong style="font-size: x-large; font-weight: bold;"><%: User.Identity.Name %></strong>.</p>

        <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
            <p>
                Vous ne possédez pas de mot de passe local pour ce site. Ajoutez un
                 mot de passe local afin de pouvoir vous connecter sans connexion externe.
            </p>
            <fieldset>
                <legend>Formulaire de définition de mot de passe local</legend>
                <table>
                    <tr>
                        <th>
                            <asp:Label runat="server" AssociatedControlID="password">Mot de passe</asp:Label>
                        </th>
                        <td>
                            <asp:TextBox runat="server" ID="password" TextMode="Password" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                CssClass="field-validation-error" ErrorMessage="Le champ mot de passe est requis."
                                Display="Dynamic" ValidationGroup="SetPassword" />
                            <asp:Label runat="server" ID="newPasswordMessage" CssClass="field-validation-error"
                             AssociatedControlID="password" />
                       </td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label runat="server" AssociatedControlID="confirmPassword">Confirmer le mot de passe </asp:Label>
                        </th>
                        <td>
                            <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Le champ confirmer le mot de passe est requis."
                                ValidationGroup="SetPassword" />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Le mot de passe et le mot de passe de confirmation ne correspondent pas."
                                ValidationGroup="SetPassword" />
                       </td>
                    </tr>
                </table>
                <asp:Button runat="server" Text="Définir le mot de passe" ValidationGroup="SetPassword" OnClick="setPassword_Click" />
            </fieldset>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="changePassword" Visible="false">
            <h2>Modifier le mot de passe</h2>
            <asp:ChangePassword runat="server" CancelDestinationPageUrl="~/" ViewStateMode="Disabled" RenderOuterTable="false" SuccessPageUrl="Manage?m=ChangePwdSuccess">
                <ChangePasswordTemplate>
                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                    <fieldset class="changePassword">
                        <legend class="titre">Modifier les détails du mot de passe :</legend>
                        <br />
                        <br />
                        <table>
                            <tr>
                                <th>
                                    <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword">Mot de passe actuel</asp:Label>
                                </th>
                                <td>
                                    <asp:TextBox runat="server" ID="CurrentPassword" CssClass="passwordEntry" TextMode="Password" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                        CssClass="field-validation-error" ErrorMessage="Le champ confirmer le mot de passe est requis."
                                        ValidationGroup="ChangePassword" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword">Nouveau mot de passe</asp:Label>
                                </th>
                                <td>
                                    <asp:TextBox runat="server" ID="NewPassword" CssClass="passwordEntry" TextMode="Password" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                        CssClass="field-validation-error" ErrorMessage="Le nouveau mot de passe est requis."
                                        ValidationGroup="ChangePassword" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword">Confirmer le nouveau mot de passe</asp:Label>
                                </th>
                                <td>
                                    <asp:TextBox runat="server" ID="ConfirmNewPassword" CssClass="passwordEntry" TextMode="Password" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="field-validation-error" Display="Dynamic" ErrorMessage="La confirmation du nouveau mot de passe est requise."
                                        ValidationGroup="ChangePassword" />
                                    <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                        CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Le nouveau mot de passe et le mot de passe de confirmation ne correspondent pas."
                                        ValidationGroup="ChangePassword" />
                                </td>
                            </tr>
                        </table>
                        <asp:Button runat="server" CommandName="ChangePassword" Text="Modifier le mot de passe" ValidationGroup="ChangePassword" CssClass="btn btn_blue" />
                    </fieldset>
                </ChangePasswordTemplate>
            </asp:ChangePassword>
        </asp:PlaceHolder>
    </section>

    <section id="externalLoginsForm">
        
        <asp:ListView runat="server" ID="externalLoginsList" ViewStateMode="Disabled"
            DataKeyNames="ProviderName,ProviderUserId" OnItemDeleting="externalLoginsList_ItemDeleting">
        
            <LayoutTemplate>
                <h2>Connexions externes inscrites</h2>
                <table>
                    <thead><tr><th>Service</th><th>Nom d'utilisateur</th><th>Dernière utilisation</th><th>&nbsp;</th></tr></thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder"></tr>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    
                    <th style="width:70px;"><%# HttpUtility.HtmlEncode(Item<OpenAuthAccountData>().ProviderDisplayName) %></th>
                    <td style="width:140px;"><%# HttpUtility.HtmlEncode(Item<OpenAuthAccountData>().ProviderUserName) %></td>
                    <td><%# HttpUtility.HtmlEncode(ConvertToDisplayDateTime(Item<OpenAuthAccountData>().LastUsedUtc)) %></td>
                    <td>
                        <asp:Button runat="server" Text="Supprimer" CommandName="Delete" CausesValidation="false" 
                            ToolTip='<%# "Supprimer cette " + Item<OpenAuthAccountData>().ProviderDisplayName + " connexion de votre compte" %>'
                            Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn_blue" ID="conectButton" />
                    </td>
                    
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <h2>Ajouter un'outre connexion </h2>

      <div class="social_login">
                <div>
                    <asp:LinkButton ID="Buttonfb" runat="server"  
                        ValidationGroup="FB" CssClass="social_box fb">
                        <span class="icon"><i class="fa fa-facebook"></i></span>
                        <span class="icon_title">Utiliser Facebook</span>
                    </asp:LinkButton>

                    <asp:LinkButton ID="ButtonGoogle" runat="server" 
                        ValidationGroup="FB" CssClass="social_box google">
                        <span class="icon"><i class="fa fa-google-plus"></i></span>
                        <span class="icon_title">Utiliser Google</span>
                    </asp:LinkButton>
                </div>
          </div>

    </section>
  </div>
</asp:Content>
