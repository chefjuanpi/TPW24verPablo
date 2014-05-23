<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ForumBoards.aspx.cs" Inherits="TP_W24.Forum" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/ForumBoards.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <asp:Repeater ID="rptBoardCategories" runat="server">
            <ItemTemplate>
                <div class="section">
                    <div class="header">
                        <strong><%# Eval("BoardCategoryName") %></strong>
                    </div>

                    <asp:Repeater ID="rptBoards" DataSource='<%# ((DataRowView)Container.DataItem).Row.GetChildRows("BoardsBoardsCategories") %>' runat="server">
                        <ItemTemplate>
                            <div class="board">
                                <div class="title">
                                    <strong>
                                        <a href='Topics.aspx?Board=<%# DataBinder.Eval(Container.DataItem, "[\"BoardID\"]") %>'>
                                            <%# DataBinder.Eval(Container.DataItem, "[\"BoardName\"]") %>
                                        </a>
                                    </strong> <br />
                                    <div class="sumary">
                                        <%# DataBinder.Eval(Container.DataItem, "[\"Description\"]") %>
                                    </div>
                                </div>

                                <div class="stats">
                                    <%# DataBinder.Eval(Container.DataItem, "[\"TopicCount\"]") %> Sujets <br />
                                    <%# DataBinder.Eval(Container.DataItem, "[\"MessageCount\"]") %> Messages
                                </div>

                                <div class="lastPost">
                                    <strong>
                                        <a href='ForumMessages.aspx?Topic=<%# DataBinder.Eval(Container.DataItem, "[\"TopicID\"]") %>'>
                                            Dernier message
                                        </a>
                                    </strong>par
                                    <i>
                                        <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# DataBinder.Eval(Container.DataItem, "[\"WrittenBy\"]") %>'>
                                            <%# DataBinder.Eval(Container.DataItem, "[\"UserName\"]") %>
                                        </a>
                                    </i><br />dans 
                                    <b>
                                        <a href='ForumMessages.aspx?Topic=<%# DataBinder.Eval(Container.DataItem, "[\"TopicID\"]") %>'>
                                            <%# DataBinder.Eval(Container.DataItem, "[\"TopicTitle\"]") %>
                                        </a>
                                    </b><br />
                                    <i><%# DataBinder.Eval(Container.DataItem, "[\"DateWritten\"]") %></i>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="section">
            <div class="header">
                Rechercher un sujet: 
                <input type="text" name="txtSearchTopic" value="" />
                <asp:Button ID="Button1" Text="Rechercher" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
