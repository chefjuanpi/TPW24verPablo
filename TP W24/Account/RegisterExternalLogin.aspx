﻿<%@ Page Language="C#" Title="Inscrire une connexion externe" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="lab6.Account.RegisterExternalLogin" %>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <hgroup class="title">
        <h1>Inscrivez-vous avec votre compte <%: ProviderDisplayName %></h1>
        <h2><%: ProviderUserName %>.</h2>
    </hgroup>

    
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
            <asp:Button runat="server" Text="Se connecter" ValidationGroup="NewUser" OnClick="logIn_Click" />
            <asp:Button runat="server" Text="Annuler" CausesValidation="false" OnClick="cancel_Click" />
        </fieldset>
    </asp:PlaceHolder>
</asp:Content>
