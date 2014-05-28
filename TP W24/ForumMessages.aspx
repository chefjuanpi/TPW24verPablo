<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ForumMessages.aspx.cs" Inherits="TP_W24.ForumMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/ForumMessages.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div id="messagesHeader">
            <div style="float: left; width: 154px;">Autheur</div>
            <div style="float: left; width: 600px;">Message</div>
        </div>

        <asp:Repeater ID="rptMessages" runat="server">
            <ItemTemplate>
                <div class="message">
                    <div class="poster">
                        <strong>
                            <a href='<%= Page.ResolveUrl("~/RegisteredUsers/Account.aspx?Member=")%><%# DataBinder.Eval(Container.DataItem, "[\"WrittenBy\"]") %>'>
                                <%# Eval("UserName") %>
                            </a>
                        </strong> <br />
                        <img class="profileImg" src='<%# Page.ResolveUrl(Eval("photoProfil").ToString()) %>' /> <br />
                        Messages: <%# Eval("messageCount") %>
                    </div>

                    <div class="msgContent">
                        <p>
                            <%# Eval("IsBlocked").ToString() == "True" ?  "<i>Ce message a été supprimé par un administrateur</i>" : Eval("Content") %>
                        </p>
                    </div>

                    <div class="msgFooter">
                        Envoyé le: <%# Eval("DateWritten") %> <br />

                        <% if(User.IsInRole("Admin")) { %>
                            <asp:Button ID="cmdUndelete" ForeColor="Green" Text='Restaurer' runat='server' CommandArgument='<%# Eval("messageID") %>' OnClick="cmdUndelete_Click" />
                            <asp:Button ID="cmdDelete" ForeColor="Red" Text='Supprimer' runat='server' CommandArgument='<%# Eval("messageID") %>' onClick='cmdDeleteMsg_Click' />
                        <% } %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
                 <div id="answerArea">
                    Répondre: <br />
                    <asp:TextBox ID="txtMessage" runat="server" Rows="12" Columns="91" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                    <asp:LoginView ID="LoginView2" runat="server" ViewStateMode="Enabled">
                         <LoggedInTemplate>
                              <asp:Button ID="cmdReply" Text="Répondre" runat="server" OnClick="cmdReply_Click"  ValidationGroup="replyValidationGroup" />
                         </LoggedInTemplate>
                     </asp:LoginView>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="* Le message est manquant<br/>" ControlToValidate="txtMessage" runat="server" ValidationGroup="replyValidationGroup" />
                </div>
    </div>
</asp:Content>
