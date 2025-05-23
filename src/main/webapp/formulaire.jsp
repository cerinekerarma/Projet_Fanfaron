<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <title>Inscription</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    body {
      font-family: Georgia, serif;
      background-color: #f6ced2;
      background-image: url('${pageContext.request.contextPath}/images/background11.jpg');
      background-repeat: repeat;
      background-position: top center;
      background-size: contain;
      margin: 0;
      padding: 0;
    }
    .conteneur {
      max-width: 600px;
      margin: 50px auto;
      background-color: #f6ced2;
      background-image: url('${pageContext.request.contextPath}/images/conteneur4.jpeg');
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    fieldset {
      margin-top: 20px;
      padding: 10px 15px;
      border: 1px solid #ddd;
      border-radius: 6px;
      background-color: #fffafa;
    }
    form input[type="text"],
    form input[type="email"],
    form input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      background-color: #fffafa;
      border-radius: 6px;
      font-size: 14px;
      box-sizing: border-box;
      transition: border-color 0.3s ease;
    }


  </style>

</head>
<body>
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
    <h4>Vous avez déjà un compte ?</h4>
    <button type="submit" onclick="window.location.href='${pageContext.request.contextPath}/UserControler?action=versConnexion'">
      Se connecter
    </button>


  </div>
</div>
</body>
</html>
