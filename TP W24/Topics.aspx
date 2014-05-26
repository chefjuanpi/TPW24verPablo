<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="TP_W24.Topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/ForumTopics.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <asp:ListView ID="lvTopics" ItemPlaceholderID="itemPlaceHolder" runat="server">
            <LayoutTemplate>
                <table style="margin-bottom:10px;">
                    <tr style="height:20px;">
                        <th style="width:500px;">Sujets</th>
                        <th style="width:200px;">Stats</th>
                        <th style="width:400px;">Dernier message</th>
                    </tr>

                    <div id="itemPlaceHolder" runat="server"></div>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <strong>
                            <a href='ForumMessages.aspx?Topic=<%# Eval("TopicID") %>'>
                                <%# Eval("TopicTitle") %>
                            </a>
                        </strong> <br />

                        <div class="startedBy">
                            Sujet commencé par
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# DataBinder.Eval(Container.DataItem, "[\"StartedBy\"]") %>'>
                                <%# Eval("topicStarterUsername") %> <br />
                            </a> le <%# Eval("StartedDate") %>
                        </div>
                    </td>

                    <td>
                        <%# Eval("MessageCount") %> Messages<br />
                        <%# Eval("ViewCount") %> Vues
                    </td>

                    <td> par 
                        <i>
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# DataBinder.Eval(Container.DataItem, "[\"WrittenBy\"]") %>'>
                                <%# Eval("lastPosterUsername") %>
                            </a>
                        </i>.<br />
                        le <i><%# Eval("DateWritten") %></i>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <%--<div id="topicsHeader">
            <div style="float: left;">Sujets</div>
            <div style="float: right;">Dernier message</div>
        </div>

        <asp:Repeater ID="rptTopics" runat="server">
            <ItemTemplate>
                <div class="topic">
                    <div class="title">
                        <strong>
                            <a href='ForumMessages.aspx?Topic=<%# Eval("TopicID") %>'>
                                <%# Eval("TopicTitle") %>
                            </a>
                        </strong> <br />

                        <div class="startedBy">
                            Sujet commencé par
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# DataBinder.Eval(Container.DataItem, "[\"StartedBy\"]") %>'>
                                <%# Eval("topicStarterUsername") %>
                            </a> le <%# Eval("StartedDate") %>
                        </div>
                    </div>

                    <div class="stats">
                        <%# Eval("MessageCount") %> Messages<br />
                        <%# Eval("ViewCount") %> Vues
                    </div>

                    <div class="lastPost"> par 
                        <i>
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# DataBinder.Eval(Container.DataItem, "[\"WrittenBy\"]") %>'>
                                <%# Eval("lastPosterUsername") %>
                            </a>
                        </i>.<br />
                        le <i><%# Eval("DateWritten") %></i>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>--%>
        
        <asp:LinkButton ID="cmdNewTopic" CssClass='newTopicBtn' Text="Nouveau sujet" runat="server" OnClick="cmdNewTopic_Click" />
    </div>
</asp:Content>
