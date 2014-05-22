<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="TP_W24.Membres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Members.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div id="membersHeader">
            <div style="float: left; width: 200px;">Sujets</div>
            <div style="float: left; width: 154px;">Enrégistré le</div>
            <div style="float: left;">Messages envoyés</div>
            <div style="float: right;">Dernier message</div>
        </div>

        <asp:Repeater runat="server" id="rptMembers">
            <ItemTemplate>
                <div class="member">
                    <div class="name">
                        <strong>
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# Eval("UserID") %>'>
                                <%# Eval("UserName") %>
                            </a>
                        </strong>
                    </div>

                    <div class="dateRegistered">
                        <%# Eval("CreateDate") %>
                    </div>

                    <div class="stats">
                        <%# Eval("MessageCount") %> Messages
                    </div>

                    <div class="lastPost">
                        <a href='ForumMessages.aspx?Topic=<%# Eval("TopicID") %>'>
                            <%# Eval("TopicTitle") %>
                        </a> <%# Eval("DateWritten") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
