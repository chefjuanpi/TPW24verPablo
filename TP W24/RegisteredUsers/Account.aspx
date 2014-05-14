<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="TP_W24.Compte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Account.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
                <asp:Label ID="errmsg" runat="server" Text=""></asp:Label>
                <div>
                    <div class="moitie">
                        <div><asp:Image id="profileImage" runat="server" BorderStyle="Double" Width="200" 
                            Height="200" ImageUrl="~/images/Lachassegalerie.jpg" 
                            ImageAlign="Middle" />

                        </div>
                        <div>
                            <asp:FileUpload ID="FileUpload1" runat="server"/>
                            <asp:RegularExpressionValidator id="ImageValidator1" Display="Dynamic" runat="server" 
                                ErrorMessage="Seulement archives jpg sont acceptées!" 
                                ValidationExpression="^.*\.(jpg|JPG|jpeg|JPEG)$" 
                                ControlToValidate="FileUpload1" ValidationGroup="Image" CssClass="field-validation-error" />
                            <asp:RequiredFieldValidator id="image1" runat="server" Display="Dynamic"
                                ErrorMessage="Selectioner un image!" ControlToValidate="FileUpload1" 
                                ValidationGroup="Image" CssClass="field-validation-error" />
                        </div>
                        <div>
                            <br />
                            <asp:LinkButton ID="UploadImage" runat="server" CssClass="btn btn_blue" 
                                 Text="Image de Profil"  ValidationGroup="Image" OnClick="UploadImage_Click" />
                        </div>
                    </div>
                    <div id="profileInfos">
                    Utilisateur : <strong style="font-size: 16px;"><asp:Label ID="lblUtilisateur" runat="server" Text="" /></strong><br />
                    Prenom : <asp:TextBox ID="txtPrenom" runat="server" Enabled="false" />
                    Nom : <asp:TextBox ID="txtNom" runat="server" Enabled="false" /><br />
                    Ville : <asp:TextBox ID="txtcity" runat="server" Enabled="false" />
                    Province : <asp:TextBox ID="txtProvince" runat="server" Enabled="false" />
                    Pays: <asp:TextBox ID="txtPays" runat="server" Enabled="false" /><br />
                    <asp:TextBox ID="txtCourriel" runat="server" Enabled="false" /><br />
                    <asp:TextBox ID="txtCreated" runat="server" Enabled="false" /><br />
                    <asp:TextBox ID="txtLast" runat="server" Enabled="false" /><br />

                    66 messages (0.212 par jours) <br />

                    </div>

                </div>
                



                <a href="SeeMessages.aspx">Voir messages</a> <br />
                <a href="SendMessage.aspx">Envoyer message</a><br />
                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Se déconnecter" LogoutPageUrl="~/" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn_blue" 
                         Text="Modifier Mot de passe"  ValidationGroup="accountPassManager" PostBackUrl="~/Account/Manage.aspx"/>
    </div>
</asp:Content>
