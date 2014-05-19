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
                            <a href='Account.aspx?Member=<%# Eval("m.WrittenBy") %>'>
                                <%# Eval("u.UserName") %>
                            </a>
                        </strong> <br />
                        <img class="profileImg" src='<%# Eval("util.photoProfil") %>' /> <br />
                        Messages: <%# Eval("messageCount") %>
                    </div>

                    <div class="msgContent">
                        <p><%# Eval("m.Content") %></p>
                    </div>

                    <div class="msgFooter">
                        Envoyé le: <%# Eval("m.DateWritten") %> <br />
                        Dernière mise-à-jour: <%# Eval("m.DateLastEdited") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <%--<div class="message">
            <div class="poster">
                <strong><a>nomMembre</a></strong> <br />
                <img class="profileImg" src="images/img04.jpg" /> <br />
                Messages: 22
            </div>

            <div class="msgContent">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel convallis orci. Aliquam ultrices sem non dui convallis porta ac at libero. Nulla facilisi. Maecenas aliquet vulputate arcu nec scelerisque.
                    Praesent sit amet lacinia eros, non molestie tellus. Proin id urna nec odio rhoncus convallis. Nullam ac sagittis lacus, a mollis est. Mauris sed mi eget purus tincidunt ornare at ac eros. Aenean quis commodo felis,
                    a bibendum libero. Nulla ut nunc ut orci interdum ultrices. Praesent metus nisi, rutrum et mi sit amet, suscipit convallis nunc.
                </p>
            </div>
            <div class="msgFooter">
                Envoyé le: 2014-04-14 <br />
                Dernière mise-à-jour: 2014-04-14
            </div>
        </div>

        <div class="message" style="border: none;">
            <div class="poster">
                <strong><a>nomMembre</a></strong> <br />
                <img class="profileImg" src="images/img04.jpg" /> <br />
                Messages: 22
            </div>

            <div class="msgContent">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel convallis orci. Aliquam ultrices sem non dui convallis porta ac at libero. Nulla facilisi. Maecenas aliquet vulputate arcu nec scelerisque.
                    Praesent sit amet lacinia eros, non molestie tellus. Proin id urna nec odio rhoncus convallis. Nullam ac sagittis lacus, a mollis est. Mauris sed mi eget purus tincidunt ornare at ac eros. Aenean quis commodo felis,
                    a bibendum libero. Nulla ut nunc ut orci interdum ultrices. Praesent metus nisi, rutrum et mi sit amet, suscipit convallis nunc.

                    Vestibulum blandit ac nisi id varius. Donec ac ante est. Nunc rutrum odio eget elit pellentesque iaculis. Donec vel blandit leo. Integer varius dui eget rhoncus rhoncus. Nullam malesuada elit sit amet imperdiet tincidunt. Aliquam consequat
                    elementum tortor non vulputate. Praesent venenatis, erat ut pellentesque sagittis, magna odio laoreet dolor, a ultricies purus lorem at mi. Etiam fringilla hendrerit felis, et ullamcorper tellus volutpat at. Praesent dapibus
                    accumsan sapien in adipiscing.

                    Proin dignissim ac eros at semper. Praesent id metus sagittis, tincidunt elit et, dictum diam. Mauris venenatis felis mauris, et porttitor massa vulputate non. Suspendisse lobortis eu sem eu adipiscing. Suspendisse blandit porttitor scelerisque.
                    Praesent quis velit pharetra, imperdiet quam a, rutrum massa. Nunc adipiscing lectus risus, nec molestie diam pulvinar ut. In rutrum lacus diam, ac pretium velit lobortis quis.
                </p>
            </div>
            <div class="msgFooter">
                Envoyé le: 2014-04-14
            </div>
        </div>--%>

        <div id="answerArea">
            Répondre: <br />
            <asp:TextBox ID="txtMessage" runat="server" Rows="12" Columns="91" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="cmdReply" Text="Répondre" runat="server" />
        </div>
    </div>
</asp:Content>
