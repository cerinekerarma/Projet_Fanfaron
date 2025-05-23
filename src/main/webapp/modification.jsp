<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.Fanfaron" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <title>Modification</title>
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
            font-family: Arial, sans-serif;
            background: #f6ced2;
            margin: 0;
            padding: 0;
        }

        .conteneur {
            margin-top: 50px;
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        h4 {
            text-align: center;
            color: #d32a2a;
        }

        form label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
            color: #dc3545;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        form input:focus {
            border-color: #007BFF;
            outline: none;
        }

        fieldset {
            margin-top: 20px;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #fafafa;
        }

        fieldset legend {
            font-weight: bold;
            color: #dc3545;
            padding: 0 5px;
        }

        input[type="radio"] {
            margin-right: 6px;
        }

        a {
            color: #dc3545;
            font-weight: bold;
            text-decoration: underline;
        }

        a:hover {
            color: #a52828;
        }

        button[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #dc3545;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #a52828;
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

        .section {
            margin-top: 100px;
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
            <img src="profil.png" alt="Profil">
            <ul class="avatar-menu">
                <li><a href="${pageContext.request.contextPath}/UserControler?action=consulter_profil">Profil</a></li>
                <li><a href="${pageContext.request.contextPath}/UserControler?action=versConnexion">Déconnexion</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="conteneur">
    <%
        Fanfaron fanfaron = (Fanfaron) session.getAttribute("user");
        if (fanfaron == null) {
    %>
    <p style="text-align: center;">Utilisateur non connecté.</p>
    <a href="UserControler?action=versConnexion">Connectez-vous</a>
    <%
    } else {
    %>
    <div class="section">
        <h2>Modification</h2>
        <form action="UserControler" method="POST">
            <input type="hidden" id="action" name="action" value="modifier" />

            <%
                String msg = (String) request.getAttribute("message");
                if (msg != null) {
            %>
            <h4><%= msg %></h4>
            <% } %>

            <label for="login">Login :</label>
            <input type="text" id="login" name="login" value="<%= fanfaron.getLogin() %>" required/>

            <label for="name">Nom :</label>
            <input type="text" id="name" name="name" value="<%= fanfaron.getNom() %>" required/>

            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" value="<%= fanfaron.getPrenom() %>" required/>

            <label for="mail">Adresse mail :</label>
            <input type="email" id="mail" name="mail" value="<%= fanfaron.getAdresse() %>" required/>

            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" />

            <fieldset>
                <legend>Genre :</legend>
                <input type="radio" id="male" name="gender" value="homme" <%= "homme".equals(fanfaron.getGenre()) ? "checked" : "" %> required />
                <label for="male">Homme</label>

                <input type="radio" id="female" name="gender" value="femme" <%= "femme".equals(fanfaron.getGenre()) ? "checked" : "" %> />
                <label for="female">Femme</label>

                <input type="radio" id="other" name="gender" value="autre" <%= "autre".equals(fanfaron.getGenre()) ? "checked" : "" %> />
                <label for="other">Autre</label>
            </fieldset>

            <fieldset>
                <legend>Préférences alimentaires :</legend>
                <input type="radio" id="none" name="preferences" value="aucune" <%= "aucune".equals(fanfaron.getCrtAlimentaire()) ? "checked" : "" %> required />
                <label for="none">Aucune</label>

                <input type="radio" id="vegeterian" name="preferences" value="végétarien" <%= "végétarien".equals(fanfaron.getCrtAlimentaire()) ? "checked" : "" %> />
                <label for="vegeterian">Végétarien</label>

                <input type="radio" id="vegan" name="preferences" value="végan" <%= "végan".equals(fanfaron.getCrtAlimentaire()) ? "checked" : "" %> />
                <label for="vegan">Végan</label>

                <input type="radio" id="withoutporc" name="preferences" value="sansporc" <%= "sansporc".equals(fanfaron.getCrtAlimentaire()) ? "checked" : "" %> />
                <label for="withoutporc">Sans Porc</label>
            </fieldset>

            <button type="submit">Modifier</button>
        </form>
    </div>
    <% } %>
</div>

</body>
</html>
