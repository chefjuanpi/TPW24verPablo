<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="TP_W24.Compte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Account.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <asp:LoginView ID="accountLoginView" runat="server" ViewStateMode="Disabled">
            <AnonymousTemplate>
                <script type="text/javascript">

                </script>


            </AnonymousTemplate>
            <LoggedInTemplate>
                <div id="profileImage">
                    <img src="images/img04.jpg" />
                </div>

                <div id="profileInfos">
                    <strong style="font-size: 16px;">nomMembre</strong> <br />
                    Homme, 29 ans <br />
                    Jonquière, Québec, Canada <br />
                    unCourriel@hotmail.ca <br />
                    66 messages (0.212 par jours) <br />
                    Enrégistré le 2014-03-13 <br />
                    Dernière activité le 2014-04-02 à 14:52
                </div>

                <a href="SeeMessages.aspx">Voir messages</a> <br />
                <a href="SendMessage.aspx">Envoyer message</a><br />
                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Se déconnecter" LogoutPageUrl="~/" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn_blue" Style="font-size: 18px; font-weight: bold;"
                         Text="Modifier Mot de passe"  ValidationGroup="accountPassManager" PostBackUrl="~/Account/Manage.aspx"/>
            </LoggedInTemplate>
        </asp:LoginView>

    </div>
</asp:Content>
