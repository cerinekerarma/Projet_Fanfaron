<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Evenement" %>
<%@ page import="dao.Fanfaron" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Modification de l'évènement</title>
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
        Evenement event = (Evenement) request.getAttribute("event");
        if (event == null) {
    %>
    <p>Aucun événement sélectionné.</p>
    <%
    } else {
    %>
    <div class="section">
        <h2>Modifier l'évènement</h2>
        <form action="EvenementControler" method="POST">
            <input type="hidden" name="action" value="modifier_evenement" />
            <input type="hidden" name="id" value="<%= event.getId() %>" />

            <%
                String msg = (String) request.getAttribute("message");
                if (msg != null) {
            %>
            <h4><%= msg %></h4>
            <% } %>

            <label for="nom">Nom de l'événement :</label>
            <input type="text" id="nom" name="nom" value="<%= event.getNom() %>" required />

            <label for="date">Date et heure :</label>
            <input type="datetime-local" id="date" name="date"
                   value="<%= event.getDate().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME).replace("T", "T") %>"
                   required />

            <label for="duree">Durée (en minutes) :</label>
            <input type="number" id="duree" name="duree" value="<%= event.getDuree() %>" min="30" required />

            <label for="lieu">Lieu :</label>
            <input type="text" id="lieu" name="lieu" value="<%= event.getLieu() %>" required />

            <label for="description">Description :</label>
            <textarea id="description" name="description" rows="4" required><%= event.getDescription() %></textarea>

            <button type="submit" class="btn-valider">Modifier</button>
        </form>
    </div>
    <%
            }
        }
    %>
</div>

<%@ include file="footer.jspf" %>

</body>
</html>