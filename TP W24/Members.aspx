<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="TP_W24.Membres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Members.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div style="margin-bottom: 4px;">
            * Seules les membres actifs sont affiché. Pour être considéré actif, un membre doit avoir posté au moins un message.
        </div>

        <asp:ListView ID="lvMembers" ItemPlaceholderID="itemPlaceHolder" runat="server">
            <LayoutTemplate>
                <table>
                    <tr>
                        <td>Sujets</td>
                        <td>Enrégistré le</td>
                        <td>Messages écrits</td>
                        <td>Dernier message</td>
                    </tr>
                    <div id="itemPlaceHolder" runat="server"></div>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <strong>
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# Eval("UserID") %>'>
                                <%# Eval("UserName") %>
                            </a>
                        </strong>
                    </td>

                    <td>
                        <%# Eval("CreateDate") %>
                    </td>

                    <td>
                        <%# Eval("MessageCount") %> Messages
                    </td>

                    <td>
                        <a href='ForumMessages.aspx?Topic=<%# Eval("TopicID") %>'>
                            <%# Eval("TopicTitle") %>
                        </a> <%# Eval("DateWritten") %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <div>
            <asp:DataPager ID="membersPager" PageSize="20" PagedControlID="lvMembers" runat="server">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
        </div>

        <%--<div id="membersHeader">
            <div style="float: left; width: 200px;">Sujets</div>
            <div style="float: left; width: 154px;">Enrégistré le</div>
            <div style="float: left;">Messages écrits</div>
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
        </asp:Repeater>--%>
        
        Rafiner la recherche: <br />
        <table>
            <tr>
                <td>
                    Nom:
                </td>
                <td>
                    <asp:TextBox ID="txtCriteriaName" runat="server" /> <br />
                </td>
            </tr>

            <tr>
                <td>
                    Messages minimum:
                </td>
                <td>
                    <asp:TextBox ID="txtCriterianMsgMin" runat="server" /> <br />
                </td>
            </tr>
        </table>
        <asp:Button ID="cmdRefinedSearch" Text="Rechercher" runat="server" OnClick="cmdRefinedSearch_Click" />
    </div>
</asp:Content>
