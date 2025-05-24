<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Pupitre" %>
<html>
<head>
    <title>Inscription à un Pupitre</title>
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
            padding-top: 70px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h1, h2 {
            color: #dc3545;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            margin: 20px 0 40px;
            text-align: center;
        }

        select {
            padding: 8px;
            font-size: 1rem;
            border: 2px solid #ac2a37;
            border-radius: 4px;
            width: 250px;
            margin-left: 10px;
        }

        button {
            background-color: #dc3545;
            border: none;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            margin-left: 15px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #bb2d3b;
        }

        p.message {
            color: #bb2d3b;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            margin: 0 auto 40px;
            border-collapse: collapse;
            width: 60%;
            max-width: 600px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        th, td {
            border: 2px solid #ac2a37;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #ffa6aa;
        }

        form.inline-form {
            margin: 0;
        }

        /* Navbar copied from profil.jsp */
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
            list-style: none;
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

        nav.navbar ul.primary li {
            position: relative;
        }

        nav.navbar ul.sub {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #dc3545;
            padding: 0.5em 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            list-style: none;
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

<h1>Choisissez un pupitre pour vous inscrire</h1>

<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<p class="message"><%= message %></p>
<%
    }
%>

<%
    List<Pupitre> pupitres = (List<Pupitre>) request.getAttribute("pupitres");
    if (pupitres != null && !pupitres.isEmpty()) {
%>
<form action="PupitreControler" method="post">
    <input type="hidden" name="action" value="inscription" />
    <label for="pupitre">Pupitre :</label>
    <select name="pupitreId" id="pupitre">
        <%
            for (Pupitre pupitre : pupitres) {
        %>
        <option value="<%= pupitre.getId() %>"><%= pupitre.getNom() %></option>
        <%
            }
        %>
    </select>
    <button type="submit">S'inscrire</button>
</form>
<%
} else {
%>
<p style="text-align:center;">Aucun pupitre disponible.</p>
<%
    }
%>

<h2>Pupitres où vous êtes inscrit</h2>

<%
    List<Pupitre> inscPupitres = (List<Pupitre>) request.getAttribute("inscPupitres");
    if (inscPupitres != null && !inscPupitres.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>Nom du pupitre</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Pupitre pupitre : inscPupitres) {
    %>
    <tr>
        <td><%= pupitre.getNom() %></td>
        <td>
            <form action="PupitreControler" method="post" class="inline-form">
                <input type="hidden" name="action" value="desinscription" />
                <input type="hidden" name="pupitreId" value="<%= pupitre.getId() %>" />
                <button type="submit">Se désinscrire</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p style="text-align:center;">Vous n'êtes inscrit à aucun pupitre.</p>
<%
    }
%>

</body>
</html>
