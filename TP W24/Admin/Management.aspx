<!-- La gestion se fait finalement directement sur la page des messages. -->

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="TP_W24.Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Management.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Cette page affichera la liste des tables dans lesquelles des lignes peuvent être enlevé (membres, messages...). Lors d'une clique 
         sur un de ces tables, sont contenue sera afficher et il sera ensuite possible, par un clique, de détruire une ligne de dans la bd. -->
    <div id="content">
        *Dans le vrai code, le contenue ci-dessous sera créé de façon dynamique et pourra provenenir de différentes tables. L'exemple ci-dessous
        montre ce qui se passerait si l'utilisateur avait cliqué pour faire afficher la listes des membres.*

        <div id="dbTableNameContainer">
            NomDeTable
        </div>

        <table id="dbContent">
            <tr id="dbHeader">
                <th>ID</th>
                <th>Prénom</th>
                <th>Nom</th>
                <th>Inscrit le</th>
            </tr>

            <tr class="dbLine">
                <td>
                    <asp:linkbutton ID="Linkbutton1" runat="server" CommandArgument='nomTable;nomChamp;1'>
                        1
                    </asp:linkbutton>
                </td>
                <td>Bill</td>
                <td>Clinton</td>
                <td>2014-04-15</td>
            </tr>

            <tr class="dbLine">
                <td>
                    <asp:linkbutton ID="Linkbutton2" runat="server" CommandArgument='nomTable;nomChamp;2'>
                        2
                    </asp:linkbutton>
                </td>
                <td>Andrew</td>
                <td>Fuller</td>
                <td>2014-04-16</td>
            </tr>

            <tr class="dbLine">
                <td>
                    <asp:linkbutton ID="Linkbutton3" runat="server" CommandArgument='nomTable;nomChamp;3'>
                        3
                    </asp:linkbutton>
                </td>
                <td>Andrée</td>
                <td>Boivin</td>
                <td>2014-04-18</td>
            </tr>
        </table>

        <%--<div id="repeaterContainer">
            <asp:Repeater id="dbContentRepeater" runat="server">
                <HeaderTemplate>
                    
                </HeaderTemplate>
                <ItemTemplate>

                </ItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:Repeater>
        </div>--%>
    </div>
</asp:Content>
