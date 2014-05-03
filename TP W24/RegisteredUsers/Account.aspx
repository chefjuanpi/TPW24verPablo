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

                <%--<fieldset>
                    <legend>Se connecter</legend>
                    <div>
                        <div class="label">Nom d'utilisateur:</div>
                        <asp:TextBox id="txtLogInUsername" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvLogInUsername" runat="server" ErrorMessage="*" ControlToValidate="txtLogInUsername" />
                    </div>
                    <div>
                        <div class="label">Mot de passe:</div>
                        <asp:TextBox id="txtLogInPassword" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvLogInPassword" runat="server" ErrorMessage="*" ControlToValidate="txtLogInPassword" />
                    </div>
                    <div>
                        <asp:Button id="cmdLogin" Text="Se connecter" runat="server" />
                    </div>
                </fieldset>

                <fieldset>
                    <legend>S'inscrire</legend>
                    <div>
                        <div class="label">Nom d'utilisateur:</div>
                        <div class="inputField"><asp:TextBox id="txtRegUsername" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvRegUsername" runat="server" ErrorMessage="*" ControlToValidate="txtRegUsername" /></div>
                    </div>
                    <div>
                        <div class="label">Mot de passe:</div>
                        <div class="inputField"><asp:TextBox id="txtRegPassword" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvRegPassword" runat="server" ErrorMessage="*" ControlToValidate="txtRegPassword" /></div>
                    </div>
                    <div>
                        <div class="label">Courriel:</div>
                        <div class="inputField"><asp:TextBox id="txtEmail" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" /></div>
                    </div>
                    <div>
                        <div class="label">Date d'aniversaire:</div>
                        <asp:TextBox id="txtBirthDate" runat="server" />
                    </div>
                    <div>
                        <div class="label">Sexe:</div>
                        <asp:RadioButton GroupName="Sex" ID="optSexM" Text="Homme" runat="server" Checked="true" />
                        <asp:RadioButton GroupName="Sex" ID="optSexF" Text="Femme" runat="server" />
                    </div>
                    <div>
                        <div class="label">Ville:</div>
                        <asp:TextBox id="txtCity" runat="server" />
                    </div>
                    <div>
                        <div class="label">Province:</div>
                        <asp:TextBox id="txtProvince" runat="server" />
                    </div>
                    <div>
                        <div class="label">Pays:</div>
                        <asp:TextBox id="txtCountry" runat="server" />
                    </div>
                    <div>
                        <asp:Button id="cmdRegister" Text="S'inscrire" runat="server" />
                    </div>
                </fieldset>--%>
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
                <a href="SendMessage.aspx">Envoyer message</a>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</asp:Content>
