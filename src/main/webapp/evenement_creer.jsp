<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.Fanfaron" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <title>Créer un évènement</title>
</head>

<body>

<%@ include file="header_user.jspf" %>

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
        <h2>Créer un évènement</h2>
        <form action="EvenementControler" method="POST">
            <input type="hidden" name="action" value="ajouter_evenement" />

            <%
                String msg = (String) request.getAttribute("message");
                if (msg != null) {
            %>
            <h4><%= msg %></h4>
            <% } %>

            <label for="nom">Nom de l'événement :</label>
            <input type="text" id="nom" name="nom" placeholder="Entrez le nom de l'événement" required />

            <label for="date">Date et heure :</label>
            <input type="datetime-local" id="date" name="date" required />

            <label for="duree">Durée (en minutes) :</label>
            <input type="number" id="duree" name="duree" placeholder="Ex: 90" required />

            <label for="lieu">Lieu :</label>
            <input type="text" id="lieu" name="lieu" placeholder="Ex: 1 rue Polytech Lyon 69100 Villeurbanne ou Polytech Lyon" required />

            <label for="description">Description :</label>
            <textarea id="description" name="description" rows="4" placeholder="Décrivez l'événement ici..." required></textarea>

            <button type="submit" onclick="window.location.href='${pageContext.request.contextPath}/EvenementControler?action=ajouter_evenement'">Créer l'événement</button>
        </form>
    </div>
    <% } %>
</div>

<%@ include file="footer.jspf" %>

</body>
</html>
