<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="TP_W24.Membres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Members.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div style="margin-bottom: 4px;">
            * Seules les membres actifs sont affiché. Pour être considéré actif, un membre doit avoir posté au moins un message.
        </div>

        <asp:ListView ID="lvMembers" ItemPlaceholderID="itemPlaceHolder" runat="server" OnPagePropertiesChanged="lvMembers_PagePropertiesChanged">
            <LayoutTemplate>
                <table style="margin-bottom:20px;" >
                    <tr style="height:20px;">
                        <th style="width:180px;">Membre</th>
                        <th style="width:200px;">Enrégistré le</th>
                        <th style="width:200px;">Messages écrits</th>
                        <th style="width:300px;">Dernier message</th>
                        <th style="width:200px;">Date dernier message</th>
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
                        </a>
                    </td>

                    <td>
                        <%# Eval("DateWritten") %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <div style="margin-bottom:20px;">
            <asp:DataPager ID="membersPager" PageSize="20" PagedControlID="lvMembers" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField />
                </Fields>
            </asp:DataPager>
        </div>
        
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
