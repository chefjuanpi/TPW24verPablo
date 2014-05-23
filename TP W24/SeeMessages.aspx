<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SeeMessages.aspx.cs" Inherits="TP_W24.SeeMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/SeeMessages.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div id="messagesHeader">
            <div style="float: left; width: 300px;">Sujets</div>
            <div style="float: left; width: 254px;">Envoyé par</div>
            <div style="float: right;">Envoyé le</div>
        </div>

        <asp:Repeater ID="rptPrivateMessages" runat="server">
            <ItemTemplate>
                <div class="message">
                    <div class="title">
                        <strong>
                            <a href='ReadMessage.aspx?msgID=<%# Eval("PrivateMsgID") %>'>
                                <%# Eval("PrivateMsgTitle") %>
                            </a>
                        </strong>
                    </div>

                    <div class="sender">
                        <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# Eval("WrittenBy") %>'>
                            <%# Eval("UserName") %>
                        </a>
                    </div>

                    <div class="sentDate">
                        <%# Eval("DateWritten") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="message">
            <div class="title">
                <strong><a href="ReadMessage.aspx?msg=idMsg">titreMessage</a></strong>
            </div>

            <div class="sender">
                <a>nomMembre</a>
            </div>

            <div class="sentDate">
                2014-04-15
            </div>
        </div>

        <div class="message">
            <div class="title">
                <strong><a>titreMessage</a></strong>
            </div>

            <div class="sender">
                <a>nomMembre</a>
            </div>

            <div class="sentDate">
                2014-04-15
            </div>
        </div>
    </div>
</asp:Content>
