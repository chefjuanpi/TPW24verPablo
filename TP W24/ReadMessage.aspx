﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReadMessage.aspx.cs" Inherits="TP_W24.ReadMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/ReadMessage.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div id="poster">
            <strong><a id="senderLink" runat="server"></a></strong> <br />
            <img id="profileImg" runat="server" width="64" height="64" /> <br />
        </div>

        <div id="subject" runat="server">
        </div>

        <div id="message">
            <div id="msgContentContainer">
                <p id="msgContent" runat="server"></p>
            </div>

            <div id="msgFooter" runat="server">
            </div>
        </div>
        
        Répondre: <br />
        <asp:TextBox ID="txtMessage" runat="server" Rows="12" Columns="91" TextMode="MultiLine" />
        <asp:Button ID="cmdReply" Text="Répondre" runat="server" OnClick="cmdReply_Click" ValidationGroup="msgValidationGroup" />
        <asp:RequiredFieldValidator ErrorMessage="* Le message est manquant<br/>" ControlToValidate="txtMessage" runat="server" ValidationGroup="msgValidationGroup" />
    </div>
</asp:Content>
