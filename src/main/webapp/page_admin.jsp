<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>La Farandole des Fanfarons</title>
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
            margin-right: 100px;
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
    </style>
</head>
<body>

<nav class="navbar">
    <ul class="primary">
        <li><a href="page_admin.jsp">Accueil</a></li>
        <li><a href="evenement_creer.jsp">Créer un évènement</a></li>
        <li>
            <a href="#">Gérer les comptes</a>
            <ul class="sub">
                <li><a href="${pageContext.request.contextPath}/UserControler?action=gerer_comptes">Nouveaux comptes</a></li>
                <li><a href="${pageContext.request.contextPath}/UserControler?action=modifier_comptes">Comptes existants</a></li>
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
    <h1>Bienvenue dans</h1>
    <h1><em>La Farandole des Fanfarons</em></h1>
    <img src="fanfare_img.jpg" alt="Fanfare en pleine action" class="fanfare-img">
    <p>
        FanfareHub, c’est la plateforme faite par et pour les fanfarons.
        Que tu sois trompettiste déchaîné, percussionniste fidèle ou nouveau souffle curieux de rejoindre l'aventure,
        ici tu trouveras tout ce qu’il te faut pour vivre ta fanfare à fond.<br><br>
        Inscris-toi facilement, retrouve le planning des répétitions, inscris-toi aux prestations et ne rate aucun atelier !
        Notre objectif : simplifier l’organisation, booster la convivialité et faire résonner la musique partout où la fanfare passe. 🎶
    </p>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>
