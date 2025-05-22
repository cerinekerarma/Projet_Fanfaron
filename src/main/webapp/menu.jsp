<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>La Farandole des Fanfarons</title>
  <link rel="stylesheet" href="menu_style.css">
</head>
<body>
<div class="wrap">
  <span class="decor"></span>
  <nav class="navbar">
    <ul class="primary">
      <li><a href="menu.jsp">Accueil</a></li>
      <li>
        <a href="#">Rejoindre</a>
        <ul class="sub">
          <li><a href="groupe.jsp">Rejoindre un groupe</a></li>
          <li><a href="pupitre.jsp">Rejoindre un pupitre</a></li>
          <li><a href="evenement_rejoindre.jsp">Rejoindre un évènement</a></li>
        </ul>
      </li>
      <li><a href="evenement_creer.jsp">Créer un évènement</a></li>
    </ul>

    <div class="navbar-right">
      <div class="avatar-dropdown">
        <img src="profil.png" alt="Profil">
        <ul class="avatar-menu">
          <li><a href="profil.jsp">Profil</a></li>
          <li><a href="connexion.jsp">Déconnexion</a></li>
        </ul>
      </div>
    </div>
  </nav>
</div>

<div class="content">
  <h1>Bienvenue dans <em>La Farandole des Fanfarons</em></h1>
  <p>Explication du site</p>
</div>

<div class="footer-dark">
  <footer>
    <div class="container">
      <p class="copyright">Copyright © 2025</p>
    </div>
  </footer>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
