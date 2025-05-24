<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>La Farandole des Fanfarons</title>
  <link rel="stylesheet" href="acceuil_style.css">
  <style>
    body {
      font-family: Georgia, serif;
      background-color: #f6ced2;
      background-image: url('${pageContext.request.contextPath}/images/instruments.png');
      background-repeat: repeat;
      background-position: top center;
      background-size: contain;
      margin: 0;
      padding: 0;
    }

    .conteneur {
      max-width: 600px;
      margin: 50px auto;
      background-image: url('${pageContext.request.contextPath}/images/sunset.jpeg');
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 12px 30px rgba(255, 115, 39, 0.8);
    }

    .section h2,
    h1 {
      text-align: center;
      color: #b63e18;
      font-weight: bold;
      margin-bottom: 20px;
    }

    h4 {
      text-align: center;
      color: #b94717;
    }

    a {
      color: #b63e18;
      font-weight: bold;
      text-decoration: underline;
    }

    a:hover {
      color: #812d11;
    }

    nav.navbar {
      position: fixed;
      top: 0;
      width: 100%;
      background-color: #e4572e;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0.5em 2em;
      z-index: 1000;
      box-shadow: 0 2px 8px rgba(255, 87, 34, 0.5);
    }

    nav.navbar ul.primary {
      display: flex;
      gap: 2em;
    }

    nav.navbar ul.primary > li > a {
      color: white;
      text-decoration: none;
      font-weight: bold;
      padding: 0.5em 0;
      transition: color 0.3s;
    }

    nav.navbar ul.primary > li > a:hover {
      color: #ffd3b6;
    }

    nav.navbar ul.sub {
      display: none;
      position: absolute;
      top: 100%;
      left: 0;
      background-color: #e4572e;
      padding: 0.5em 0;
      box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    nav.navbar ul.primary li:hover > ul.sub {
      display: block;
    }

    nav.navbar ul.sub li a:hover {
      background-color: #b63e18;
    }

    .avatar-dropdown img {
      height: 40px;
      width: 40px;
      border-radius: 50%;
      border: 2px solid white;
    }

    .avatar-menu {
      background-color: #e4572e;
    }

    .avatar-menu li a:hover {
      background-color: #b63e18;
    }

    .footer-dark {
      background: linear-gradient(135deg, #e4572e, #b63e18);
      color: white;
      text-align: center;
      padding: 30px 15px 20px;
      margin-top: 60px;
      border-top: 5px solid #ffb3b3;
      box-shadow: 0 -5px 20px rgba(255, 87, 34, 0.3);
      font-family: Georgia, serif;
      border-radius: 20px 20px 0 0;
    }

    .footer-dark .container {
      max-width: 800px;
      margin: auto;
    }

    .footer-dark p {
      margin: 10px 0;
      font-size: 0.95em;
      line-height: 1.6;
    }

    .footer-dark a {
      color: #ffd3b6;
      text-decoration: none;
    }

    .footer-dark a:hover {
      color: #fff;
      text-decoration: underline;
    }

    .footer-dark .copyright {
      font-size: 0.8em;
      margin-top: 10px;
      color: #ffeaea;
    }

    ::selection {
      background: #ffd3b6;
      color: #812d11;
    }

    ::-moz-selection {
      background: #ffd3b6;
      color: #812d11;
    }

    ::-webkit-scrollbar {
      width: 10px;
      height: 10px;
    }

    ::-webkit-scrollbar-track {
      background: #ffeaea;
      border-radius: 10px;
    }

    ::-webkit-scrollbar-thumb {
      background: linear-gradient(180deg, #e4572e, #b63e18);
      border-radius: 10px;
      border: 2px solid #ffeaea;
    }

    ::-webkit-scrollbar-thumb:hover {
      background: linear-gradient(180deg, #b63e18, #812d11);
    }



  </style>
</head>
<body>
<div class="wrap">
  <span class="decor"></span>
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
</div>

<div class="content">
  <h1>Bienvenue dans <em>La Farandole des Fanfarons</em></h1>
  <img src="fanfare_img.jpg" alt="Fanfare en pleine action" class="fanfare-img" />

  <p>FanfareHub, c’est la plateforme faite par et pour les fanfarons. Que tu sois trompettiste déchaîné, percussionniste fidèle ou nouveau souffle curieux de rejoindre l'aventure, ici tu trouveras tout ce qu’il te faut pour vivre ta fanfare à fond. Inscris-toi facilement, retrouve le planning des répétitions, inscris-toi aux prestations et ne rate aucun atelier !
    Notre objectif : simplifier l’organisation, booster la convivialité et faire résonner la musique partout où la fanfare passe. Alors accorde ton pupitre, chauffe tes valves, et entre dans le rythme avec FanfareHub ! 🎶
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
