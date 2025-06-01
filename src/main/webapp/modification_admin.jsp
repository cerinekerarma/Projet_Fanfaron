<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.Fanfaron" %>
<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8" />
  <title>Modification</title>
</head>

<body>

<%@ include file="header_admin.jspf" %>

<style>
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

  body {
    margin: 0;
    padding: 0;
    font-family: var(--font-main);
    background: url('${pageContext.request.contextPath}/images/instruments.png') top center repeat;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }
</style>


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

<%@ include file="footer.jspf" %>

</body>
</html>
