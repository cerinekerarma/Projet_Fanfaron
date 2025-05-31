<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <title>Inscription</title>
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

    form label {
      display: block;
      margin: 12px 0 6px;
      font-weight: bold;
      color: #a63d1a;
    }

    form input[type="text"],
    form input[type="email"],
    form input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #d08662;
      background-color: rgba(255, 248, 240, 0.9);
      border-radius: 6px;
      font-size: 14px;
      box-sizing: border-box;
      transition: border-color 0.3s ease;
    }

    form input:focus {
      border-color: #ff6f3c;
      outline: none;
    }

    fieldset {
      margin-top: 20px;
      padding: 10px 15px;
      border: 1px solid #e5b79a;
      border-radius: 6px;
      background-color: rgba(255, 248, 240, 0.85);
    }

    fieldset legend {
      font-weight: bold;
      color: #b63e18;
      padding: 0 5px;
    }

    form input::placeholder {
      color: rgba(255, 161, 114, 0.8);
      font-style: italic;
      letter-spacing: 0.5px;
      opacity: 0.9;
    }


    button[type="submit"],
    button[type="button"].btn {
      margin-top: 20px;
      width: 100%;
      padding: 12px;
      background-color: #e4572e;
      color: white;
      border: none;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button[type="submit"]:hover,
    button[type="button"].btn:hover {
      background-color: #b63e18;
    }

    a {
      color: #b63e18;
      font-weight: bold;
      text-decoration: underline;
    }

    a:hover {
      color: #812d11;
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

    .navbar-logo {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      pointer-events: none;
    }




  </style>

</head>
<body>
<div class="navbar-logo">
  <img src="${pageContext.request.contextPath}/images/logoFF.png" alt="Logo FF" height="50">
</div>

<div class="conteneur">
  <%--
  <% if (request.getSession(true).getAttribute("user") != null){%>
    <jsp:forward page="connexion.jsp"/>
  <%}%>
  --%>


    <div class="section">

    <h2>Inscription</h2>
    <form action="${pageContext.request.contextPath}/UserControler" method="POST">

      <input type="hidden" id="action" name="action" value="ajouter" />

      <% String msg = (String) request.getAttribute("message");
        if(msg != null){ %>
      <h4><%= msg %></h4>
      <% } %>

      <label for="login">Login :</label>
      <input type="text" id="login" name="login" placeholder="Entrez votre login" required/>

      <label for="name">Nom :</label>
      <input type="text" id="name" name="name" placeholder="Entrez votre nom" required/>

      <label for="prenom">Prénom :</label>
      <input type="text" id="prenom" name="prenom" placeholder="Entrez votre prénom" required/>

      <label for="mail">Adresse mail :</label>
      <input type="email" id="mail" name="mail" placeholder="Entrez votre adresse mail" required/>

      <label for="mail2">Adresse mail vérification :</label>
      <input type="email" id="mail2" name="mail2" placeholder="Entrez votre adresse mail" required/>

      <label for="password">Mot de passe :</label>
      <input type="password" id="password" name="password" placeholder="Saisissez votre mot de passe" required />

      <label for="password2">Mot de passe vérification :</label>
      <input type="password" id="password2" name="password2" placeholder="Saisissez votre mot de passe" required/>

      <fieldset>
        <legend>Genre :</legend>
        <input type="radio" id="male" name="gender" value="homme" required/>
        <label for="male">Homme</label>

        <input type="radio" id="female" name="gender" value="femme" />
        <label for="female">Femme</label>

        <input type="radio" id="other" name="gender" value="autre" />
        <label for="other">Autre</label>
      </fieldset>

      <fieldset>
        <legend>Préférences alimentaires :</legend>

        <input type="radio" id="none" name="preferences" value="aucune" required/>
        <label for="none">Aucune</label>

        <input type="radio" id="vegeterian" name="preferences" value="végétarien" />
        <label for="vegeterian">Végétarien</label>

        <input type="radio" id="vegan" name="preferences" value="végan" />
        <label for="vegan">Végan</label>

        <input type="radio" id="withoutporc" name="preferences" value="sansporc" />
        <label for="withoutporc">Sans Porc</label>
      </fieldset>

      <button type="submit" onclick="document.getElementById('action').value='ajouter'">S'inscrire</button>

    </form>
    <h4  style="margin-top: 70px;">Vous avez déjà un compte ?</h4>
    <button type="submit" style="margin-top: 0;" onclick="window.location.href='${pageContext.request.contextPath}/UserControler?action=versConnexion'">
      Se connecter
    </button>


  </div>
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
