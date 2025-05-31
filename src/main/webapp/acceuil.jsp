<%@ page import="dao.Fanfaron" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">

<head>
  <title>La Farandole des Fanfarons</title>
</head>

<body>
<%@ include file="header_user.jspf" %>

<%
  String msg = (String) request.getAttribute("message");
  if (msg != null) {
%>
<h4><%= msg %></h4>
<% } %>

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

<%@ include file="footer.jspf" %>
</body>
</html>