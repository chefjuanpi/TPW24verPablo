<%@ Page Title="Registre" Language="C#" Title="Inscrire une connexion externe" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="lab6.Account.RegisterExternalLogin" %>


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
       <hgroup class="title">
            <h1>Inscrivez-vous avec votre compte <%: ProviderDisplayName %></h1>
            <h2><%: ProviderUserName %>.</h2>
        </hgroup>
    </div>
</asp:Content>




<asp:Content ContentPlaceHolderID="body" runat="server">
    <div style="margin-left:20%; margin-right:20%; text-align:center;">  
        <asp:Label runat="server" ID="providerMessage" CssClass="field-validation-error" />
    

        <asp:PlaceHolder runat="server" ID="userNameForm">
            <fieldset>
                <legend>Formulaire d'association</legend>
                <p>
                    Vous vous êtes authentifié avec <strong><%: ProviderDisplayName %></strong> en tant que
                    <strong><%: ProviderUserName %></strong>. Veuillez entrer ci-dessous un nom d'utilisateur pour le site actuel
                    et cliquer sur le bouton Se connecter.
                </p>
                <ol>
                    <li class="email">
                        <asp:Label runat="server" AssociatedControlID="userName">Nom d'utilisateur</asp:Label>
                        <asp:TextBox runat="server" ID="userName" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                            Display="Dynamic" ErrorMessage="Le nom d'utilisateur est requis" ValidationGroup="NewUser" />
                    
                        <asp:Label runat="server" ID="userNameMessage" CssClass="field-validation-error" />
                    
                    </li>
                </ol>
                <asp:Button runat="server" Text="Se connecter" ValidationGroup="NewUser" OnClick="logIn_Click" CssClass="btn btn_blue" />
                <asp:Button runat="server" Text="Annuler" CausesValidation="false" OnClick="cancel_Click" CssClass="btn" />
            </fieldset>
        </asp:PlaceHolder>
    </div>
</asp:Content>
