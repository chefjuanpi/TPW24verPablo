<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactAdmin.aspx.cs" Inherits="TP_W24.ContactAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/SendMessage.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div>
            <div class="label">Votre Email:</div>
            <asp:TextBox ID="txtEmail" runat="server" Columns="41" /><br />
            <asp:RequiredFieldValidator ErrorMessage="* Le Courriel est manquant" ControlToValidate="txtEmail" runat="server" ValidationGroup="sendMessageValidationGroup" />
        </div>

        <div id="subject">
            <div class="label">Sujet:</div>
            <asp:TextBox ID="txtSubject" runat="server" Columns="41" /><br />
            <asp:RequiredFieldValidator ErrorMessage="* Le sujet est manquant" ControlToValidate="txtSubject" runat="server" ValidationGroup="sendMessageValidationGroup" />
        </div>
        
        Message: <br />
        <asp:TextBox ID="txtMessage" runat="server" Rows="12" Columns="91" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ErrorMessage="* Le message est manquant" ControlToValidate="txtMessage" runat="server" ValidationGroup="sendMessageValidationGroup" />
        <asp:Button ID="cmdSendMsg" Text="Envoyer" runat="server" ValidationGroup="sendMessageValidationGroup" OnClick="cmdSendMsg_Click" />
        <asp:Button ID="cmdCancel" Text="Annuler" runat="server" OnClick="cmdCancel_Click" />
    </div>
</asp:Content>
