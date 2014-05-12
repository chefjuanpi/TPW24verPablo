<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginPopUp.ascx.cs" Inherits="TP_W24.Account.WebUserControl1" %>
<%@ Import Namespace="Microsoft.AspNet.Membership.OpenAuth" %>


<fieldset class="loginPopUp">
    <legend>loginPopUP</legend>
    <script> <!--	Controle du ecran Modal de Login  -->
        (function ($) {
            $.fn.extend({
                leanModal: function (options) {
                    var defaults = {
                        top: 100,
                        overlay: 0.5,
                        closeButton: null
                    };
                    var overlay = $("<div id='lean_overlay'></div>");
                    $("body").append(overlay);
                    options = $.extend(defaults, options);
                    return this.each(function () {
                        var o = options;
                        var modal_id = $(this).attr("href");

                        function showModal() {
                            $("#lean_overlay").click(function () {
                                close_modal(modal_id);
                            });
                            $(o.closeButton).click(function () {
                                close_modal(modal_id);
                            });

                            var modal_height = $(modal_id).outerHeight();
                            var modal_width = $(modal_id).outerWidth();

                            $("#lean_overlay").css({
                                "display": "block",
                                opacity: 0
                            });

                            $("#lean_overlay").fadeTo(100, o.overlay);

                            $(modal_id).css({
                                "display": "block",
                                "position": "fixed",
                                "opacity": 0,
                                "z-index": 11000,
                                "left": 50 + "%",
                                "margin-left": -(modal_width / 2) + "px",
                                "top": o.top + "px"
                            });

                            $(modal_id).fadeTo(200, 1);
                        };

                        $(this).click(function (e) {
                            showModal();
                            e.preventDefault();
                        });
                    });

                    function close_modal(modal_id) {
                        $("#lean_overlay").fadeOut(200);
                        $(modal_id).css({
                            "display": "none"
                        });
                    }
                }
            });
        })(jQuery);
    </script>

    <div id="modal" class="popupContainer" style="display:none;">
        <header class="popupHeader">
            <span class="header_title">Connexion</span>
            <span class="modal_close"><i class="fa fa-times"></i></span>
        </header>

        <section class="popupBody">
            <!-- Social Login -->
            <div class="social_login">
                <div class="">
                    <asp:LinkButton ID="Buttonfb" runat="server" OnClick="FBConnect" 
                        ValidationGroup="FB" CssClass="social_box fb">
                        <span class="icon"><i class="fa fa-facebook"></i></span>
                        <span class="icon_title">Utiliser Facebook</span>
                    </asp:LinkButton>

                    <asp:LinkButton ID="ButtonGoogle" runat="server" OnClick="GoogleConnect" 
                        ValidationGroup="FB" CssClass="social_box google">
                        <span class="icon"><i class="fa fa-google-plus"></i></span>
                        <span class="icon_title">Utiliser Google</span>
                    </asp:LinkButton>
                </div>

                <div class="centeredText">
                    <span>Ou utiliser votre courriel</span>
                </div>

                <div class="action_btns">
                    <div class="one_half"><a href="#" id="login_form" class="btn">Se connecter</a></div>
                    <div class="one_half last"><a href="../Account/Register.aspx" id="register_form" class="btn btn_blue">S'inscrire</a></div>
                </div>
            </div>

            <!-- Username & Password Login form -->
            <section id="loginForm">
                <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
                    <LayoutTemplate>
                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                    <fieldset class="user_login">
                        <legend>Formulaire de connexion</legend>
                        <ol>
                            <li>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">Nom d'utilisateur</asp:Label>
                                <asp:TextBox runat="server" ID="UserName" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="Le champ nom d'utilisateur est requis." />
                            </li>
                            <li>
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Mot de passe</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="Le champ mot de passe est requis." />
                            </li>
                            <li>
                                <asp:CheckBox runat="server" ID="RememberMe" Text="Rester Connectée ?" CssClass="checkbox" />
                            </li>
                        </ol>
                        <div class="action_btns">
                            <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Retour</a></div>
                            <div class="one_half last"><asp:LinkButton ID="Button1" runat="server" CommandName="Login" Text="Se connecter" CssClass="btn btn_blue" /></div>
                        </div>            
                        <!--<a href="#" class="forgot_password">Mot de passe oublié?</a>-->
                    </fieldset>
               </LayoutTemplate>
            </asp:Login>
        </section>

        </section>
    </div>

<script>
    function GetAppropriateTop() {
        var maxTop = $(window).height() - 601;
        return maxTop < 200 ? maxTop : 200;
    };

    $(".modal_trigger").leanModal({ top: GetAppropriateTop(), overlay: 0.6, closeButton: ".modal_close" });

    $(function () {
        // Calling Login Form
        $("#login_form").click(function () {
            $(".social_login").hide();
            $(".user_login").show();
            return false;
        });

        // Going back to Social Forms
        $(".back_btn").click(function () {
            $(".user_login").hide();
            $(".user_register").hide();
            $(".social_login").show();
            $(".header_title").text('Login');
            return false;
        });

    });


</script>

</fieldset>