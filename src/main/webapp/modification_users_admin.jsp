<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Fanfaron" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>La Farandole des Fanfarons - Validation des comptes</title>
    <style>
        :root {
            --sunset-orange: #e4572e;
            --sunset-deep: #b63e18;
            --sunset-hover: #812d11;
            --sunset-bg: #fff3f0;
            --sunset-light: #ffd3b6;
            --font-main: 'Georgia', serif;
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

        button.btn-modifier {
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

        button.btn-modifier:hover {
            box-shadow: 0 6px 25px rgba(255, 106, 95, 0.8);
            transform: scale(1.05);
        }

        p.no-users {
            text-align: center;
            font-size: 1.15rem;
            color: #a94b46;
            margin-top: 2rem;
            font-weight: 600;
            font-style: italic;
        }

        @media (max-width: 600px) {
            nav.navbar ul.primary {
                gap: 1rem;
            }

            h1 {
                font-size: 2rem;
            }

            button.btn-modifier {
                padding: 8px 16px;
                font-size: 0.9rem;
            }

            .content {
                margin: 1rem;
                padding: 1.2rem;
            }
        }

        body {
            margin: 0;
            padding: 0;
            font-family: var(--font-main);
            background-color: antiquewhite;
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

        .content {
            padding: 2em;
            flex: 1 0 auto;
            padding-top: 80px;
        }

        .footer-dark {
            background: linear-gradient(135deg, var(--sunset-orange), var(--sunset-deep));
            color: white;
            text-align: center;
            padding: 30px 20px;
            border-top: 5px solid #ffb3b3;
            font-family: var(--font-main);
            border-radius: 20px 20px 0 0;
            flex-shrink: 0;
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

        .footer-dark p {
            background-color: transparent;
            padding: 0;
            margin: 0;
            color: white;
        }


    </style>
</head>
<body>

<nav class="navbar">
    <ul class="primary">
        <li><a href="${pageContext.request.contextPath}/UserControler?action=versAcceuilAdmin">Accueil</a></li>
        <li><a href="evenement_creer.jsp">Créer un évènement</a></li>
        <li>
            <a href="#">Gérer les comptes</a>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath}/UserControler?action=gerer_comptes">Nouveaux comptes</a></li>
                <li><a href="${pageContext.request.contextPath}/UserControler?action=modifier_comptes">Comptes existants</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/UserControler?action=versAjoutUserAdmin">Ajouter un user</a></li>

    </ul>
    <div class="navbar-logo">
        <img src="${pageContext.request.contextPath}/images/logoFF.png" alt="Logo FF" height="50">
    </div>

    <div class="navbar-right">
        <div class="avatar-dropdown">
            <img src="images/profil.png" alt="Profil" />
            <ul class="avatar-menu">
                <li><a href="${pageContext.request.contextPath}/UserControler?action=consulter_profil_admin">Profil</a></li>
                <li><a href="${pageContext.request.contextPath}/UserControler?action=deconnexion">Déconnexion</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="content">
    <h1>GESTION DE COMPTE ADMINISTRATEUR</h1>

    <% String msg = (String) request.getAttribute("message");
        if (msg != null) { %>
    <h4><%= msg %></h4>
    <% } %>

    <%
        List<Fanfaron> fanfarons = (List<Fanfaron>) request.getAttribute("fanfarons");
        if (fanfarons != null && !fanfarons.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>User</th>
            <th>Modifier</th>
            <th>Supprimer</th>
            <th>Rendre Admin</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Fanfaron fanfaron : fanfarons) {
                if(!fanfaron.isAdmin() && fanfaron.isActivated()){
        %>
        <tr>
            <td><%= fanfaron.getLogin() %></td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="modifier_admin" />
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-modifier">Modifier</button>
                </form>
            </td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="suppression_par_admin" />
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-modifier" onclick="if(confirm('Confirmer la suppression du compte')) { document.getElementById('action').value='suppression_par_admin'; return true; } else { return false; }">Supprimer</button>
                </form>
            </td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="rendre_admin" />
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-modifier">Rendre admin</button>
                </form>
            </td>

        </tr>
        <%
            }
        %>

        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p class="no-users">Aucun fanfaron trouvé.</p>
    <%
        }
    %>

</div>

<div class="footer-dark">
    <footer>
        <p>
            Répertoire · À propos de nous · Offres d'emploi · Développeurs · Aide · Mentions légales · Confidentialité · Politique de cookies · Informations légales
        </p>
        <p class="copyright">Copyright © 2025</p>
    </footer>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
