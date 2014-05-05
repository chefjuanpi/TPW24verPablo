<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TP_W24.Account.Registrer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        }

        #body_errmsg {
            color: #A00;
        }
    </style>     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header1" runat="server">
    <div style="margin-left:20%; margin-right:20%; text-align:center;"> 
        <h1>Registre</h1>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left:20%; margin-right:20%;"> 
        <br />
        <asp:Label ID="errmsg" runat="server" Text=""></asp:Label>
        <div>
            <div class="moitie">
                <div>
                    <div class="titre">Nom d'utilisateur :</div>
                    <div><asp:textbox runat="server" id="txtUser" /></div>
                    <div>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="Val_User" runat="server" ControlToValidate="txtUser"
                              CssClass="field-validation-error" ErrorMessage="  * écrit le nom d'utilisateur" />
                        <asp:RegularExpressionValidator Display="Dynamic" ID="valUser" runat="server" ErrorMessage="Seulement Accepte a-z, 0-9 et _"
                              CssClass="field-validation-error" ControlToValidate="txtUser" ValidationExpression ="([a-zA-Z0-9_]{2,50})" />
                    </div>
                </div>
                <div>
                    <div class="titre">Mot de passe :</div>
                    <div><asp:textbox runat="server" id="txtpass" TextMode="Password" /></div>
                    <div>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="valPass" runat="server" ControlToValidate="txtpass"
                              CssClass="field-validation-error" ErrorMessage="* écrit un mot de passe" />
                        <asp:RegularExpressionValidator Display="Dynamic" ID="ValPass2" runat="server" ErrorMessage="minimum 6 Caracteres, a-z, 0-9 et _"
                              CssClass="field-validation-error" ControlToValidate="txtpass" ValidationExpression ="([a-zA-Z0-9_]{6,50})" />

                    </div>
                </div>
                <div>
                    <div class="titre">Confirmer Mot de passe :</div>
                    <div><asp:textbox runat="server" id="txtpass2" TextMode="Password" /></div>
                    <div>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="ValConfirm" runat="server" ControlToValidate="txtpass2"
                              CssClass="field-validation-error" ErrorMessage="* Confirmation de mot de passe obligatoire." />
                    </div>
                </div>
                <div>
                    <div class="titre">Courriel :</div>
                    <div><asp:TextBox runat="server" ID="txtCourriel" /></div>
                    <div>
                        <asp:RegularExpressionValidator Display="Dynamic" ID="valEmail" runat="server" ErrorMessage="Courriel invalide"
                              CssClass="field-validation-error" ControlToValidate="txtCourriel" 
                              ValidationExpression ="([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})" />
                        <asp:RequiredFieldValidator Display="Dynamic" ID="valcourriel" runat="server" ControlToValidate="txtCourriel"
                              CssClass="field-validation-error" ErrorMessage="* Le champ Courriel est requis." ForeColor="Red" />
                    </div>
                </div>
                <div>
                    <div  class="titre">Sexe :</div>
                    <div>
                        <asp:RadioButtonList ID="Sexe" CssClass="lstBT" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="H" >Homme |</asp:ListItem>
                            <asp:ListItem Value="F" >Femme |</asp:ListItem>
                            <asp:ListItem Value="O" >Outres</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="sexe"
                            CssClass="field-validation-error" ErrorMessage="* Selectioner un valeur" />
                    </div>
                </div>
            </div>
            <div class="moitie" >
                <div>
                    <div  class="titre">Prenom :</div>
                    <div><asp:TextBox runat="server" ID="txtprenom" /></div>
                    <div>
                        <asp:RegularExpressionValidator Display="Dynamic" runat="server" ControlToValidate="txtprenom"
                              ErrorMessage="acepted a-z ou - et _" ValidationExpression="([a-zA-Z_\-]+)" />
                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtprenom"
                              CssClass="field-validation-error" ErrorMessage="* Le Prenom est requis" />

                    </div>
                </div>
                <div>
                    <div  class="titre">Nom :</div>
                    <div><asp:TextBox runat="server" ID="txtnom" /></div>
                    <div>
                        <asp:RegularExpressionValidator Display="Dynamic"  runat="server" ControlToValidate="txtnom"
                              ErrorMessage="acepted a-z ou - et _" ValidationExpression="[a-zA-Z_\-]+" />
                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtnom"
                              CssClass="field-validation-error" ErrorMessage="* Le Nom est requis" />
                    </div>
                </div>
                <div>
                    <div  class="titre">Ville :</div>
                    <div>
                        <asp:TextBox runat="server" ID="txtville" />
                    </div>
                </div>
                <div>
                    <div  class="titre">État/Province</div>
                    <div>
                        <asp:TextBox runat="server" ID="txtprovince" />
                    </div>
                </div>
                <div>
                    <div  class="titre">Pays</div>
                    <div>
                        <asp:TextBox runat="server" ID="txtpays" />
                    </div>
                </div>
            </div>
            <div>
                <div class="action_btns">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn_blue"
                        OnClick="cmdRegister_Click" Text="S'inscrire" />
                </div>
            </div>
        </div>
     </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
