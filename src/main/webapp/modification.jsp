<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.Fanfaron" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>Modification</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="conteneur">

    <%
        // On récupère l'utilisateur connecté dans la session
        Fanfaron fanfaron = (Fanfaron) session.getAttribute("user");

        if (fanfaron == null) {
    %>
    <p style="text-align: center;">Utilisateur non connecté.</p>
    <a href="UserControler?action=versConnexion">Connectez-vous</a>
    <%
    } else {
        // Utilisateur connecté, on affiche le formulaire
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
            <input type="password" id="password" name="password" value="******" required />

            <%
                String genre = fanfaron.getGenre();
                String preferences = fanfaron.getCrtAlimentaire();
            %>

            <fieldset>
                <legend>Genre :</legend>

                <input type="radio" id="male" name="gender" value="homme" <%= "homme".equals(genre) ? "checked" : "" %> required />
                <label for="male">Homme</label>

                <input type="radio" id="female" name="gender" value="femme" <%= "femme".equals(genre) ? "checked" : "" %> />
                <label for="female">Femme</label>

                <input type="radio" id="other" name="gender" value="autre" <%= "autre".equals(genre) ? "checked" : "" %> />
                <label for="other">Autre</label>
            </fieldset>

            <fieldset>
                <legend>Préférences alimentaires :</legend>

                <input type="radio" id="none" name="preferences" value="aucune" required <%= "aucune".equals(preferences) ? "checked" : "" %> />
                <label for="none">Aucune</label>

                <input type="radio" id="vegeterian" name="preferences" value="végétarien" <%= "végétarien".equals(preferences) ? "checked" : "" %> />
                <label for="vegeterian">Végétarien</label>

                <input type="radio" id="vegan" name="preferences" value="végan" <%= "végan".equals(preferences) ? "checked" : "" %> />
                <label for="vegan">Végan</label>

                <input type="radio" id="withoutporc" name="preferences" value="sansporc" <%= "sansporc".equals(preferences) ? "checked" : "" %> />
                <label for="withoutporc">Sans Porc</label>
            </fieldset>

            <button type="submit">Modifier</button>

        </form>
        <a href="${pageContext.request.contextPath}/UserControler?action=versConnexion">
            Vous avez déjà un compte ? Connectez-vous &lt;--
        </a>
    </div>

    <%
        } // fin else utilisateur connecté
    %>

</div>
</body>
</html>
