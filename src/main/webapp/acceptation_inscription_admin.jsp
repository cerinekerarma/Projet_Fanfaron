<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Fanfaron" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>La Farandole des Fanfarons</title>
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

        h1 {
            color: #dc3545;
            font-weight: bold;
            margin: 30px 0 20px;
            text-align: center;
        }

        h4 {
            text-align: center;
            color: #d32a2a;
        }


        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 70%;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        th, td {
            border: 2px solid #ac2a37;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #ffa6aa;
            color: #000;
        }

        button {
            background-color: #dc3545;
            border: none;
            color: white;
            font-weight: bold;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #bb2d3b;
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

        .btn-valider {
            background-color: #28a745;
            border: none;
            color: white;
            font-weight: bold;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn-valider:hover {
            background-color: #218838;
        }

    </style>

</head>
<body>
<div class="wrap">
    <span class="decor"></span>
    <nav class="navbar">
        <ul class="primary">
            <li><a href="page_admin.jsp">Accueil</a></li>
            <li><a href="evenement_creer.jsp">Créer un évènement</a></li>
            <li><a href="${pageContext.request.contextPath}/UserControler?action=gerer_comptes">Gérer les comptes</a></li>
        </ul>

        <div class="navbar-right">
            <div class="avatar-dropdown">
                <img src="images/profil.png" alt="Profil">
                <ul class="avatar-menu">
                    <li><a href="${pageContext.request.contextPath}/UserControler?action=consulter_profil">Profil</a></li>
                    <li><a href="${pageContext.request.contextPath}/UserControler?action=versConnexion">Déconnexion</a></li>
                </ul>
            </div>
        </div>

    </nav>
</div>

<div class="content">
    <h1>GESTION DE COMPTE ADMINISTRATEUR</h1>
    <% String msg = (String) request.getAttribute("message");
        if (msg != null) { %>
    <h4><%= msg %></h4>
    <% } %>

    <%
        List<Fanfaron> fanfarons = (List<Fanfaron>) request.getAttribute("fanfarons");

        boolean hasNonActivated = false;
        if (fanfarons != null && !fanfarons.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>User</th>
            <th>Valider</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Fanfaron fanfaron : fanfarons) {
                if (!fanfaron.isActivated()) {
                    hasNonActivated = true;
        %>
        <tr>
            <td><%= fanfaron.getLogin() %></td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="valider" />
                    <input type="hidden" name="fanfaronID" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-valider" onclick="document.getElementById('action').value='valider'">Valider</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
            if (!hasNonActivated) {
        %>
        <tr>
            <td colspan="3">Aucun user à valider pour le moment.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p>Aucun user à valider pour le moment.</p>
    <%
        }
    %>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
