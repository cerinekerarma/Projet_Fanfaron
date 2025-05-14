<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Inscription</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="conteneur">
  <div class="section">
    <h2>Inscription</h2>
    <form action="verif" method="POST">
      <label for="login">Login :</label>
      <input type="text" id="login" name="login" placeholder="Entrez votre login" required><br>

      <label for="login">Nom :</label>
      <input type="text" id="name" name="name" placeholder="Entrez votre nom" required><br>

      <label for="login">Prénom :</label>
      <input type="text" id="prenom" name="prenom" placeholder="Entrez votre prénom" required><br>

      <label for="login">Adresse mail :</label>
      <input type="email" id="mail" name="mail" placeholder="Entrez votre adresse mail" required><br>

      <label for="login">Adresse mail :</label>
      <input type="email" id="mail2" name="mail" placeholder="Entrez votre adresse mail" required><br>

      <label for="password">Mot de passe :</label>
      <input type="password" id="password" name="password" placeholder="Saisissez votre mot de passe" required><br>

      <label for="password">Mot de passe vérification:</label>
      <input type="password" id="password2" name="password2" placeholder="Saisissez votre mot de passe" required><br>

      <fieldset>
        <legend>Genre :</legend>

        <input type="radio" id="male" name="gender" value="homme">
        <label for="male">Homme</label><br>

        <input type="radio" id="female" name="gender" value="femme">
        <label for="female">Femme</label>

        <input type="radio" id="other" name="gender" value="autre">
        <label for="other">Autre</label>

      </fieldset>
      <br>
      <fieldset>
        <legend> Préférences alimentaires :</legend>

        <input type="radio" id="none" name="preferences" value="aucune">
        <label for="none">Aucune</label><br>

        <input type="radio" id="vegeterian" name="preferences" value="végétarien">
        <label for="none">Végétarien</label><br>

        <input type="radio" id="vegan" name="preferences" value="végan">
        <label for="none">Végan</label><br>

        <input type="radio" id="withoutporc" name="preferences" value="sansporc">
        <label for="withoutporc">Sans Porc</label><br>

      </fieldset>

      <button type="submit">S'inscrire</button>
    </form>
    <div class="link">
      <a href="/forgot-password">Mot de passe oublié ?</a>
    </div>
  </div>
</div>
</body>
</html>
