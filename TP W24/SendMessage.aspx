<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="TP_W24.SendMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/SendMessage.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div>
            <asp:Literal ID="msgLiteral" Text="" runat="server" />
        </div>
        <div id="sendTo">
            <div class="label">Envoyer à:</div>
            <asp:TextBox ID="txtSendTo" runat="server" Columns="41" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="* Le receveur du message est requis<br/>" ControlToValidate="txtSendTo" ValidationGroup="sendMessageValidationGroup" runat="server" />
        </div>

        <div id="subject">
            <div class="label">Sujet:</div>
            <asp:TextBox ID="txtSubject" runat="server" Columns="41" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="* Le sujet du message est requis<br/>" ControlToValidate="txtSubject" ValidationGroup="sendMessageValidationGroup" runat="server" />
        </div>
        
        Message: <br />
        <asp:TextBox ID="txtMessage" runat="server" Rows="12" Columns="91" TextMode="MultiLine" />
        <asp:Button ID="sendButton" Text="Envoyer" runat="server" ValidationGroup="sendMessageValidationGroup" OnClick="sendButton_Click" />
        <asp:Button ID="cancelButton" Text="Annuler" runat="server" OnClick="cancelButton_Click" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="* Le contenue du message est requis<br/>" ControlToValidate="txtMessage" ValidationGroup="sendMessageValidationGroup" runat="server" />
    </div>
</asp:Content>
