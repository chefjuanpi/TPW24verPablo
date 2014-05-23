<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="TP_W24.Compte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/jquery.ui.all.css" type="text/css" rel="stylesheet" />
    <style type="text/css" media="all">
        h1 {
            color: #000;
            text-align: left;
            font-size: 24px;
            line-height: 60px;
            font-weight: bold;
        }
        .titre {
            color: #000;
            text-align: left;
            font-weight:bold;
            font-size: 14px;
            padding-top:5px;
        }
        .lstBT{
            color: #000;
            text-align: left;
            font-weight:bold;
            font-size: 12px;
            margin-left:35px;
        }

        #body_errmsg {
            color: #A00;
        }
    </style>
    <script type="text/javascript" >
        $(function () {
            $(".txtDate").datepicker({
                dateformat: "mm/dd/yyyy",
                changeMonth: true,
                changeYear: true,
                showOn: "button",
                buttonImage: "../Images/calendar.gif",
                buttonImageOnly: true
            });
        });
</script>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header1" runat="server">
    <div style="margin-left:20%; margin-right:20%; text-align:center;"> 
        <h1>Mon Compte</h1>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left:20%; margin-right:20%; overflow:auto;"> 
        <br />
        <asp:Label ID="errmsg" runat="server" Text=""></asp:Label>
        <div class="moitie">
            <div>
                <asp:Image id="profileImage" runat="server" BorderStyle="Double" Width="200" 
                        Height="200" ImageUrl="~/images/Lachassegalerie.jpg" 
                        ImageAlign="Middle" />
            </div>
            <div>
                <asp:FileUpload ID="FileUpload1" runat="server"/>
                <asp:RegularExpressionValidator id="ImageValidator1" Display="Dynamic" runat="server" 
                    ErrorMessage="Seulement archives jpg sont acceptées!" 
                    ValidationExpression="^.*\.(jpg|JPG|jpeg|JPEG|PNG|png)$" 
                    ControlToValidate="FileUpload1" ValidationGroup="Image" CssClass="field-validation-error" />
                <asp:RequiredFieldValidator id="image1" runat="server" Display="Dynamic"
                    ErrorMessage="Selectioner un image!" ControlToValidate="FileUpload1" 
                    ValidationGroup="Image" CssClass="field-validation-error" />
            </div>
            <div>
                <br />
                <asp:LinkButton ID="UploadImage" runat="server" CssClass="btn btn_blue" 
                        Text="Image de Profil"  ValidationGroup="Image" OnClick="UploadImage_Click" />
                <br />
                <br />
            </div>
        </div>
        <div class="moitie">
            <div>
                <div class="titre">Nom d'utilisateur :</div>
                <div><strong style="font-size: 18px;"><asp:Label ID="lblUtilisateur" runat="server" Text="" /></strong></div>
            </div>
            <div>
                <div  class="titre">Prenom :</div>
                <div><asp:TextBox runat="server" ID="txtPrenom" Enabled="false"/></div>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtprenom"
                            ErrorMessage="acepted a-z ou - et _" ValidationExpression="([a-zA-Z_\-]+)"  ValidationGroup="modPersonalInfo"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="txtprenom"
                            CssClass="field-validation-error" ErrorMessage="* Le Prenom est requis"  ValidationGroup="modPersonalInfo"/>
                </div>
            </div>
            <div>
                <div  class="titre">Nom :</div>
                <div><asp:TextBox runat="server" ID="txtNom" Enabled="false"/></div>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic"  runat="server" ControlToValidate="txtnom"
                            ErrorMessage="acepted a-z ou - et _" ValidationExpression="[a-zA-Z_\-]+"  ValidationGroup="modPersonalInfo"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="txtnom"
                            CssClass="field-validation-error" ErrorMessage="* Le Nom est requis"  ValidationGroup="modPersonalInfo"/>
                </div>
            </div>
            <div>
                <div  class="titre">Date de Naissance :</div>
                <div>
                    <asp:TextBox runat="server" ID="txtNais" Enabled="false" />
                </div>
            </div>
            <div  class="titre">Sexe :</div>
                <div>
                    <asp:RadioButtonList ID="Sexe" CssClass="lstBT" runat="server" RepeatDirection="Vertical" Enabled="False">
                        <asp:ListItem Value="H" >Homme </asp:ListItem>
                        <asp:ListItem Value="F" >Femme </asp:ListItem>
                        <asp:ListItem Value="O" >Outres</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            <div>
                <div  class="titre">Ville :</div>
                <div>
                    <asp:TextBox runat="server" ID="txtcity" Enabled="false"/>
                </div>
            </div>
            <div>
                <div  class="titre">État/Province</div>
                <div>
                    <asp:TextBox runat="server" ID="txtProvince" Enabled="false"/>
                </div>
            </div>
            <div>
                <div  class="titre">Pays</div>
                <div>
                    <asp:TextBox runat="server" ID="txtPays" Enabled="false"/>
                </div>
            </div>
            <div>
                <div class="titre">Courriel :</div>
                <div><asp:TextBox runat="server" ID="txtCourriel" Enabled="false"/></div>
                <div>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="valEmail" runat="server" ErrorMessage="Courriel invalide"
                            CssClass="field-validation-error" ControlToValidate="txtCourriel" 
                            ValidationExpression ="([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})"  ValidationGroup="modPersonalInfo"/>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="valcourriel" runat="server" ControlToValidate="txtCourriel"
                            CssClass="field-validation-error" ErrorMessage="* Le champ Courriel est requis." ForeColor="Red"  ValidationGroup="modPersonalInfo"/>
                </div>
            </div>
            <div>
                <div class="titre">Created le :</div>
                <div><asp:TextBox ID="txtCreated" runat="server" Enabled="false" /></div>
            </div>
            <div>
                <div class="titre">dernier conection le :</div>    
                <div><asp:TextBox ID="txtLast" runat="server" Enabled="false" /></div>
            </div>
            <br />
            <br />
        </div>
        <div>
            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Se déconnecter" CssClass="btn btn_blue" LogoutPageUrl="~/" />
                <br />
                <br />
                <br />
            <asp:LinkButton ID="modPass" runat="server" CssClass="btn btn_blue" 
                        Text="Modifier Mot de passe"  ValidationGroup="accountPassManager" PostBackUrl="~/Account/Manage.aspx"/>
                <br />
                <br />
                <br />
            <asp:LinkButton ID="modINFO" runat="server" CssClass="btn btn_blue" 
                        Text="Modifier Info"  ValidationGroup="123" OnClick="modINFO_Click" />
        </div>
    </div><br />
    <a id="seeMessagesLink" href='../SeeMessages.aspx' runat="server">Voir messages</a> <br />
    <a id="sendMessageLink" runat="server" >Envoyer message</a><br />
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>