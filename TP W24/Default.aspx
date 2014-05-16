<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_W24.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#tirage").click(function () {
                dir = "dro"
                Change(dir);
            });

            $(".fleche").click(function () {
                var alt = $(this).attr("alt");
                Change(alt);
            });
            cpt = 0
            function Change(dir) {
                if (dir == "gauche")
                    cpt++;
                else
                    cpt--;
                if (cpt > 2)
                    cpt = 0;
                else if (cpt < 0)
                    cpt = 2;
                $("#tirage").attr("src", "Images/tirage/" + "quebec" + cpt + ".jpg");
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header1" runat="server">
    <div style="zoom: 130%; margin-left:15%; margin-right:10%;"> 
            <img class="fleche" src="images/tirage/leftArrow.png" alt="gauche" />
            <img id="tirage" src="images/tirage/quebec0.jpg" aria-busy="True" />
            <img class="fleche" src="images/tirage/rightArrow.png" alt="droit"/>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <ul class="sub-container">
        
		<li class="sujets">
			<ul>
				<li>
					<h2>Récents sujets</h2>
					<ul>
						<li><a href="#">Sujet 1</a> <i>Autheur 1</i></li>
						<li><a href="#">Sujet 2</a> <i>Autheur 2</i></li>
						<li><a href="#">Sujet 3</a> <i>Autheur 3</i></li>
						<li><a href="#">Sujet 4</a> <i>Autheur 4</i></li>
						<li><a href="#">Sujet 5</a> <i>Autheur 5</i></li>
					</ul>
				</li>
				<li>
					<h2>Récents messages</h2>
					<ul>
						<li><a href="#">Sujet du message 1</a> <i>Autheur 1</i></li>
						<li><a href="#">Sujet du message 2</a> <i>Autheur 2</i></li>
						<li><a href="#">Sujet du message 3</a> <i>Autheur 3</i></li>
						<li><a href="#">Sujet du message 4</a> <i>Autheur 4</i></li>
						<li><a href="#">Sujet du message 5</a> <i>Autheur 5</i></li>
					</ul>
				</li>
				<li>
					<h2>Nouveaux membres</h2>
					<ul>
						<li><a href="#">Nom membre 1</a></li>
						<li><a href="#">Nom membre 2</a></li>
						<li><a href="#">Nom membre 3</a></li>
						<li><a href="#">Nom membre 4</a></li>
						<li><a href="#">Nom membre 5</a></li>
					</ul>
				</li>
			</ul>
		</li>
		<!-- end #links -->
        <li class="sub-info">
			<ul class="post">
				<li><h2 class="title">Qu'est-ce qu'est ce site?</h2></li>
				<li class="story">
					<p><strong>Les Coulisses du Québec</strong> est un forum sur la culture québécoise. Les internautes y sont invités pour
                        en apprendre sur cette province, et pour partager les légendes, recettes, moeurs et autres particularitées de la
                        seule province canadienne Francophone.
					</p>
				</li>
			</ul>
			<ul class="post">
				<li><h2 class="title">Par où commencer?</h2></li>
				<li class="story">
					<p>Pourquoi pas vous  <a href="Account.aspx">inscrire</a>!? Vous pourrez ensuite créer des sujet et répondre aux messages.
                        Si vous êtes déja inscrit, nous vous invitons donc à visiter le <a href="ForumBoards.aspx">forum</a> et prendre part à notre communauté.
					</p>
				</li>
			</ul>
			<ul class="post">
				<li><h2 class="title">Questions? Commentaires?</h2></li>
				<li class="story">
					<p>Vous pouvez contacter l'administrateur en cliquant <a href="../ContactAdmin.aspx">ici.</a> Prévoyez un délai pouvant atteindre 48h avant
                        de recevoir une réponse.
					</p>
				</li>
			</ul>
		</li>
		<!-- end #posts -->
	</ul>
    <div style="clear: both;">&nbsp;</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">

</asp:Content>  
