<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Evenement" %>
<%@ page import="dao.Pupitre" %>
<html>
<head>
    <title>Inscription à un Groupe</title>
    <style>
        :root {
            --sunset-orange: #e4572e;
            --sunset-deep: #b63e18;
            --sunset-hover: #812d11;
            --sunset-bg: #fff3f0;
            --sunset-light: #ffd3b6;
            --font-main: 'Georgia', serif;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: var(--font-main);
            background: url('${pageContext.request.contextPath}/images/instruments.png') top center repeat;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .conteneur {
            max-width: 700px;
            margin: 100px auto 40px;
            background: url('${pageContext.request.contextPath}/images/sunset.jpeg') center/cover no-repeat;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(255, 115, 39, 0.8);
            color: var(--sunset-deep);
            flex: 1;
            background-blend-mode: overlay;
        }

        h1, h2, h4 {
            text-align: center;
            color: var(--sunset-deep);
            font-weight: bold;
        }

        p {
            line-height: 1.6;
            color: #4a2c1a;
            background-color: rgba(255, 255, 255, 0.85);
            padding: 20px;
            border-radius: 12px;
        }

        a {
            color: var(--sunset-deep);
            font-weight: bold;
            text-decoration: underline;
        }
        a:hover {
            color: var(--sunset-hover);
        }

        nav.navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: var(--sunset-orange);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            z-index: 1000;
            box-shadow: 0 2px 12px rgba(255, 87, 34, 0.6);
        }

        nav.navbar ul.primary {
            list-style: none;
            display: flex;
            gap: 2em;
            margin: 0;
            padding: 0;
        }

        nav.navbar ul.primary > li > a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        nav.navbar ul.primary > li > a:hover {
            color: var(--sunset-light);
        }

        nav.navbar ul.sub {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: var(--sunset-orange);
            padding: 0.5em 1em;
            border-radius: 0 0 8px 8px;
            min-width: 180px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            list-style: none;
        }
        nav.navbar ul.primary li:hover > ul.sub {
            display: block;
        }
        nav.navbar ul.sub li a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            white-space: nowrap;
        }
        nav.navbar ul.sub li a:hover {
            background-color: var(--sunset-hover);
        }
        nav.navbar ul.primary li {
            position: relative;
        }

        .navbar-logo {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            pointer-events: none;
        }

        .avatar-dropdown {
            position: relative;
            display: flex;
            align-items: center;
            gap: 10px;
        }


        .avatar-dropdown img {
            height: 40px;
            width: 40px;
            border-radius: 50%;
            border: 2px solid white;
            cursor: pointer;
            margin-right: 150px;
        }
        .avatar-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: var(--sunset-orange);
            border-radius: 8px;
            list-style: none;
            padding: 0.5em 0;
            margin-top: 0;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            z-index: 1000;
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
            background-color: var(--sunset-deep);
        }

        .content {
            padding: 2em;
        }

        .fanfare-img {
            max-width: 100%;
            border-radius: 12px;
            margin: 20px auto;
            display: block;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .footer-dark {
            background: linear-gradient(135deg, var(--sunset-orange), var(--sunset-deep));
            color: white;
            text-align: center;
            padding: 30px 20px;
            border-top: 5px solid #ffb3b3;
            font-family: var(--font-main);
            border-radius: 20px 20px 0 0;
        }
        .footer-dark p {
            background-color: transparent;
            padding: 0;
            margin: 0;
            color: white;
        }


        .footer-dark a {
            color: var(--sunset-light);
        }
        .footer-dark a:hover {
            color: white;
        }
        .footer-dark .copyright {
            font-size: 0.85em;
            margin-top: 10px;
        }

        ::selection {
            background: var(--sunset-light);
            color: var(--sunset-hover);
        }
        ::-webkit-scrollbar {
            width: 10px;
        }
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(180deg, var(--sunset-orange), var(--sunset-deep));
            border-radius: 8px;
        }


        .footer-dark {
            background: linear-gradient(135deg, var(--sunset-orange), var(--sunset-deep));
            color: white;
            text-align: center;
            padding: 30px 20px;
            border-top: 5px solid #ffb3b3;
            font-family: var(--font-main);
            border-radius: 20px 20px 0 0;
        }
        .footer-dark p {
            background-color: transparent;
            padding: 0;
            margin: 0;
            color: white;
        }

        .footer-dark a {
            color: var(--sunset-light);
        }
        .footer-dark a:hover {
            color: white;
        }
        .footer-dark .copyright {
            font-size: 0.85em;
            margin-top: 10px;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        thead tr th {
            background: rgba(28, 142, 161, 0.8);
            color: white;
            font-weight: 700;
            padding: 14px 12px;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 2px 10px rgba(24, 147, 147, 0.4);
            text-transform: uppercase;
            letter-spacing: 1.1px;
            font-size: 0.95rem;
        }

        tbody tr {
            background: #fff5f4;
            box-shadow: 0 2px 10px rgba(255, 106, 95, 0.15);
            border-radius: 12px;
            transition: transform 0.25s ease;
        }

        tbody tr:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(255, 106, 95, 0.3);
        }

        tbody tr td {
            text-align: center;
            padding: 14px 10px;
            color: #6f3a3a;
            font-weight: 600;
            border-bottom: none;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
            table-layout: fixed;
        }

        thead tr th, tbody tr td {
            width: 50%;
        }

        button.btn-valider {
            padding: 8px 16px;
            font-size: 0.9rem;
        }

        button.btn-valider {
            background: linear-gradient(45deg, #ff6a5f, #feb47b);
            border: none;
            color: #fff;
            padding: 10px 22px;
            font-weight: 700;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(254, 180, 123, 0.6);
            transition: box-shadow 0.3s ease, transform 0.2s ease;
            font-size: 1rem;
            user-select: none;
        }

        button.btn-valider:hover {
            box-shadow: 0 6px 25px rgba(255, 106, 95, 0.8);
            transform: scale(1.05);
        }

        select {
            background-color: var(--sunset-bg);
            color: var(--sunset-deep);
            border: 2px solid var(--sunset-orange);
            padding: 10px 16px;
            border-radius: 12px;
            font-family: var(--font-main);
            font-size: 1rem;
            box-shadow: 0 4px 10px rgba(255, 115, 39, 0.3);
            transition: box-shadow 0.3s ease;
        }

        select:hover {
            box-shadow: 0 6px 16px rgba(255, 115, 39, 0.5);
        }

        select:focus {
            outline: none;
            border-color: var(--sunset-hover);
            box-shadow: 0 0 0 3px rgba(255, 87, 34, 0.3);
        }



    </style>
</head>
<body>

<nav class="navbar">
    <ul class="primary">
        <li><a href="${pageContext.request.contextPath}/UserControler?action=versAcceuilUser">Accueil</a></li>
        <li>
            <a href="#">Rejoindre</a>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath}/GroupeControler">Rejoindre un groupe</a></li>
                <li><a href="${pageContext.request.contextPath}/PupitreControler">Rejoindre un pupitre</a></li>
                <li><a href="${pageContext.request.contextPath}/EvenementControler">Rejoindre un évènement</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/EvenementControler?action=creer_evenement">Créer un évènement</a></li>
        <li>
            <a href="#">Mes évènements</a>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath}/EvenementControler?action=vers_evenements_crees">Crées</a></li>
                <li><a href="${pageContext.request.contextPath}/EvenementControler?action=vers_evenements_inscrits">Inscrits</a></li>
            </ul>
        </li>

    </ul>

    <div class="navbar-logo">
        <img src="${pageContext.request.contextPath}/images/logoFF.png" alt="Logo FF" height="50">
    </div>


    <div class="avatar-dropdown" style="display: flex; align-items: center; gap: 10px;">
        <img src="images/profil.png" alt="Profil" style="height: 40px; width: 40px; border-radius: 50%; border: 2px solid white; cursor: pointer;">
        <ul class="avatar-menu">
            <li><a href="${pageContext.request.contextPath}/UserControler?action=consulter_profil">Profil</a></li>
            <li><a href="${pageContext.request.contextPath}/UserControler?action=deconnexion">Déconnexion</a></li>
        </ul>
    </div>
</nav>

<div class="conteneur">
    <h1>Rejoindre un évènement</h1>
    <%
        String msg = (String) request.getAttribute("message");
        if (msg != null) {
    %>
    <h4><%= msg %></h4>
    <% } %>

    <%-- Événements auxquels l'utilisateur est déjà inscrit --%>
    <h2>Évènements auxquels vous êtes inscrit</h2>
    <%
        List<Evenement> evenementsInscrits = (List<Evenement>) request.getAttribute("evenementsInscrits");
        if (evenementsInscrits != null && !evenementsInscrits.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>Nom</th>
            <th>Date</th>
            <th>Lieu</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Evenement evt : evenementsInscrits) { %>
        <tr>
            <td><%= evt.getNom() %></td>
            <td><%= evt.getDate() %></td>
            <td><%= evt.getLieu() %></td>
            <td>
                <form action="EvenementControler" method="post">
                    <input type="hidden" name="action" value="quitter" />
                    <input type="hidden" name="evenementId" value="<%= evt.getId() %>" />
                    <button type="submit" class="btn-valider">Quitter</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p style="text-align:center;">Vous n'êtes inscrit à aucun évènement.</p>
    <% } %>

    <%-- Autres événements --%>
    <h2>Événements disponibles</h2>

        <%
    List<Evenement> evenementsDisponibles = (List<Evenement>) request.getAttribute("evenementsDisponibles");
    List<Pupitre> pupitres = (List<Pupitre>) request.getAttribute("pupitres");

    if (evenementsDisponibles != null && pupitres != null) {
        for (Evenement e : evenementsDisponibles) {
%>
    <div style="border:1px solid #ccc; padding:10px; margin-bottom:10px;">
        <h3><%= e.getNom() %></h3>
        <p>Date : <%= e.getDate() %></p>
        <p>Lieu : <%= e.getLieu() %></p>

        <form action="EvenementControler" method="post">
            <input type="hidden" name="action" value="inscription" />
            <input type="hidden" name="evenementId" value="<%= e.getId() %>" />

            <label for="pupitre-<%= e.getId() %>">Choisissez un pupitre :</label>
            <select name="pupitreId" id="pupitre-<%= e.getId() %>">
                <% for (Pupitre p : pupitres) { %>
                <option value="<%= p.getId() %>"><%= p.getNom() %></option>
                <% } %>
            </select>

            <button type="submit">S'inscrire</button>
        </form>
    </div>
        <%
        }
    } else {
%>
    <p>Aucun événement ou aucun pupitre disponible.</p>
        <%
    }
%>

</div>

<div class="footer-dark">
    <footer>
        <div class="container">
            <p>
                Répertoire · À propos de nous · Offres d'emploi · Développeurs · Aide · Mentions légales · Confidentialité · Politique de cookies · Informations légales
            </p>
            <p class="copyright">Copyright © 2025</p>
        </div>
    </footer>
</div>


</body>
</html>
