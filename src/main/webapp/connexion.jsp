<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>Connexion</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="conteneur">
    <% if (session.getAttribute("user") != null) { %>
    <jsp:forward page="acceuil.jsp" />
    <% } %>

    <div class="section">
        <h2>Connexion</h2>
        <form action="UserControler" method="POST">
            <input type="hidden" name="action" id="formAction" value="connexion" />

            <% String msg = (String) request.getAttribute("message");
                if (msg != null) { %>
            <h4><%= msg %></h4>
            <% } %>

            <label for="login">Login :</label>
            <input type="text" id="login" name="login" placeholder="Entrez votre login" required />

            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" placeholder="Saisissez votre mot de passe" required />

            <button type="submit" onclick="document.getElementById('action').value='connexion'">Se connecter</button>
        </form>
        <h4>Vous n'avez pas de compte ?</h4>
        <button type="submit" onclick="window.location.href='${pageContext.request.contextPath}/UserControler?action=versInscription'">
            S'inscrire
        </button>


    </div>
</div>
</body>
</html>
