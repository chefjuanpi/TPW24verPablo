<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CreateNewTopic.aspx.cs" Inherits="TP_W24.CreateNewTopic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CreateNewTopic.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <asp:RequiredFieldValidator ID="subjectValidator" ErrorMessage="Le sujet est manquant<br/>" ControlToValidate="txtSubject" runat="server" validationgroup="newTopicValidationGroup" />
        <asp:RequiredFieldValidator ID="messageValidator" ErrorMessage="Le message est manquant<br/>" ControlToValidate="txtMessage" runat="server" validationgroup="newTopicValidationGroup" />

        <div id="subject">
            <div class="label">Sujet:</div>
            <asp:TextBox ID="txtSubject" runat="server" Columns="41"></asp:TextBox> <br />
        </div>
        
        Message: <br />
        <asp:TextBox ID="txtMessage" runat="server" Rows="12" Columns="91" TextMode="MultiLine"></asp:TextBox>

        <asp:Button ID="cmdCreateTopic" Text="Envoyer" runat="server" OnClick="cmdCreateTopic_Click" validationgroup="newTopicValidationGroup" />
        <asp:Button ID="cmdCancel" Text="Annuler" runat="server" onclick="cmdCancel_Click" />
    </div>
</asp:Content>