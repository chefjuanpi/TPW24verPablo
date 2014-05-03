<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrer.aspx.cs" Inherits="TP_W24.Account.Registrer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" media="all">
        h1 {
            color: #000;
            text-align: left;
            font-size: 24px;
            line-height: 60px;
            font-weight: bold;
        }
        th {
            color: #000;
            text-align: left;
            font-weight:bold;
            font-size: 14px;
        }
        tr {
            height:40px;
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
        <table>
            <tr>
                <th>Nom d'utilisateur :</th>
                <td><asp:textbox runat="server" id="txtUser" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="Val_User" runat="server" ControlToValidate="txtUser"
                          CssClass="field-validation-error" ErrorMessage="  * écrit le nom d'utilisateur" />
                </td>
            </tr>

            <tr>
                <th>Mot de passe :</th>
                <td><asp:textbox runat="server" id="txtpass" TextMode="Password" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpass"
                          CssClass="field-validation-error" ErrorMessage="  * écrit un mot de passe" />

                </td>
            </tr>

            <tr>
                <th>Confirmer <br /> Mot de passe :</th>
                <td><asp:textbox runat="server" id="txtpass2" TextMode="Password" /></td>
                <td><asp:RequiredFieldValidator ID="valPass2" runat="server" ControlToValidate="txtpass2"
                          CssClass="field-validation-error" ErrorMessage="  * Repeter le mot de passe" />
                </td>
            </tr>
            <tr>
                <th>Courriel :</th>
                <td><asp:TextBox runat="server" ID="txtCourriel" /></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCourriel"
                          CssClass="field-validation-error" ErrorMessage="  * Le champ Courriel est requis." />
                </td>
            </tr>
            <tr>
                <th>Prenom :</th>
                <td><asp:TextBox runat="server" ID="txtprenom" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="valPrenom" runat="server" ControlToValidate="txtprenom"
                          CssClass="field-validation-error" ErrorMessage="  * Repeter le mot de passe" />

                </td>
            </tr>
            <tr>
                <th>Nom :</th>
                <td><asp:TextBox runat="server" ID="txtnom" /></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtnom"
                          CssClass="field-validation-error" ErrorMessage="  * Repeter le meme mot de passe" />
                </td>
            </tr>
            <tr>
                <th>Sexe :</th>
                <td>
                    <asp:RadioButtonList ID="Sexe" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="H">Homme |</asp:ListItem>
                        <asp:ListItem Value="F">Femme |</asp:ListItem>
                        <asp:ListItem Value="O">Outres</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="sexe" ErrorMessage="* Selectioner le sexe" />
                </td>
            </tr>
            <tr>
                <th>Ville :</th>
                <td>
                    <asp:TextBox runat="server" ID="txtville" />

                </td>
            </tr>
            <tr>
                <th>État/Province</th>
                <td>
                    <asp:TextBox runat="server" ID="txtprovince" />

                </td>
            </tr>
            <tr>
                <th>Pays</th>
                <td>
                    <asp:TextBox runat="server" ID="txtpays" />

                </td>
            </tr>
            <tr>
                <th class="action_btns" colspan="2">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn_blue" OnClick="cmdRegister_Click" Text="S'inscrire" />
                </th>
            </tr>
        </table>
     </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
