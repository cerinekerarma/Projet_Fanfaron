<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Fanfaron" %>
<html>
<head>
    <title>Profil</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
        }

        body {
            font-family: sans-serif;
            background: #f6ced2;
            margin: 0;
            padding: 0;
            padding-top: 70px;
            display: flex;
            flex-direction: column;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 60%;
        }

        th, td {
            border: 2px solid #ac2a37;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #ffa6aa;
        }

        a {
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #dc3545;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        h1 {
            margin-top: 50px;
            text-align: center;
            color: #dc3545;
            font-weight: bold;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav.navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #dc3545;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5em 2em;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        nav.navbar ul.primary {
            display: flex;
            gap: 2em;
        }

        nav.navbar ul.primary li {
            position: relative;
        }

        nav.navbar ul.primary > li > a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 0.5em 0;
            transition: color 0.3s;
        }

        nav.navbar ul.primary > li > a:hover {
            color: #ffb3b3;
        }

        nav.navbar ul.sub {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #dc3545;
            padding: 0.5em 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        nav.navbar ul.primary li:hover > ul.sub {
            display: block;
        }

        nav.navbar ul.sub li {
            width: 200px;
        }

        nav.navbar ul.sub li a {
            display: block;
            padding: 0.5em 1em;
            color: white;
            text-decoration: none;
        }

        nav.navbar ul.sub li a:hover {
            background-color: #bb2d3b;
        }

        .navbar-right {
            display: flex;
            align-items: center;
            gap: 1.5em;
        }

        .avatar-dropdown {
            position: relative;
            cursor: pointer;
        }

        .avatar-dropdown img {
            height: 40px;
            width: 40px;
            border-radius: 50%;
            border: 2px solid white;
        }

        .avatar-menu {
            display: none;
            position: absolute;
            top: 110%;
            right: 0;
            background-color: #dc3545;
            list-style: none;
            padding: 0.5em 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            min-width: 150px;
            z-index: 1001;
        }

        .avatar-dropdown:hover .avatar-menu {
            display: block;
        }

        .avatar-menu li a {
            display: block;
            padding: 0.5em 1em;
            color: white;
            text-decoration: none;
        }

        .avatar-menu li a:hover {
            background-color: #bb2d3b;
        }


    </style>
</head>
<body>

<nav class="navbar">
    <ul class="primary">
        <li><a href="acceuil.jsp">Accueil</a></li>
        <li>
            <a href="#">Rejoindre</a>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath}/GroupeControler">Rejoindre un groupe</a></li>
                <li><a href="${pageContext.request.contextPath}/PupitreControler">Rejoindre un pupitre</a></li>
                <li><a href="${pageContext.request.contextPath}/EvenementControler">Rejoindre un évènement</a></li>
            </ul>
        </li>
        <li><a href="evenement_creer.jsp">Créer un évènement</a></li>
    </ul>

    <div class="navbar-right">
        <div class="avatar-dropdown">
            <img src="images/profil.png" alt="Profil">
            <ul class="avatar-menu">
                <li><a href="${pageContext.request.contextPath}/UserControler?action=consulter_profil">Profil</a></li>
                <li><a href="${pageContext.request.contextPath}/UserControler?action=deconnexion">Déconnexion</a></li>
            </ul>
        </div>
    </div>

</nav>


<h1>Profil</h1>

<%
    Fanfaron fanfaron = (Fanfaron) session.getAttribute("user");
    if (fanfaron != null) {
%>
<% String message = (String) request.getAttribute("message");
    if (message != null) { %>
<p style="color:#bb2d3b; text-align:center;"><%= message %></p>
<% } %>

<table>
    <tr>
        <th>Login</th>
        <td><%= fanfaron.getLogin() %></td>
    </tr>
    <tr>
        <th>Nom</th>
        <td><%= fanfaron.getNom() %></td>
    </tr>
    <tr>
        <th>Prénom</th>
        <td><%= fanfaron.getPrenom() %></td>
    </tr>
    <tr>
        <th>Adresse mail</th>
        <td><%= fanfaron.getAdresse() %></td>
    </tr>
    <tr>
        <th>Genre</th>
        <td><%= fanfaron.getGenre() %></td>
    </tr>
    <tr>
        <th>Mot de passe</th>
        <td>••••••••</td>
    </tr>
    <tr>
        <th>Critère alimentaire</th>
        <td><%= fanfaron.getCrtAlimentaire() %></td>
    </tr>
</table>

<div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/UserControler?action=modifier_profil">Modifier</a>
</div>
<div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/UserControler?action=suppression"
       onclick="return confirm('Confirmer la suppression du compte');">
        Supprimer le compte
    </a>
</div>


<%
} else {
%>
<p style="text-align: center;">Utilisateur non connecté.</p>
<%
    }
%>

</body>
</html>