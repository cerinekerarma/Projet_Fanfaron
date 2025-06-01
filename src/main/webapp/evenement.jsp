<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Evenement" %>
<%@ page import="dao.Pupitre" %>
<%@ page import="dao.InscriptionEvenement" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title>Inscription à un Groupe</title>
</head>
<body>

<%@ include file="header_user.jspf" %>

<div class="conteneur">
    <h1>Rejoindre un évènement</h1>
    <%
        String msg = (String) request.getAttribute("message");
        if (msg != null) {
    %>
    <h4><%= msg %></h4>
    <% } %>

    <%-- Événements auxquels l'utilisateur est déjà inscrit --%>
    <h2>Évènements auxquels vous êtes inscrit</h2>
    <%
        List<Evenement> evenementsInscrits = (List<Evenement>) request.getAttribute("evenementsInscrits");
        Map<Evenement, InscriptionEvenement> mesStatus = (Map<Evenement, InscriptionEvenement>) request.getAttribute("status");
        if (evenementsInscrits != null && !evenementsInscrits.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>Nom</th>
            <th>Date</th>
            <th>Lieu</th>
            <th>Statut</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Evenement evt : evenementsInscrits) { %>
        <tr>
            <td><%= evt.getNom() %></td>
            <td><%= evt.getDate() %></td>
            <td><%= evt.getLieu() %></td>
            <td>
                <form action="EvenementControler" method="post">
                    <input type="hidden" name="action" value="changerStatut" />
                    <input type="hidden" name="evenementId" value="<%= evt.getId() %>" />
                    <select name="statut" onchange="this.form.submit()">
                        <option value="présent" <%= "présent".equals(mesStatus.get(evt).getStatus()) ? "selected" : "" %>>Présent</option>
                        <option value="absent" <%= "absent".equals(mesStatus.get(evt).getStatus()) ? "selected" : "" %>>Absent</option>
                        <option value="incertain" <%= "incertain".equals(mesStatus.get(evt).getStatus()) ? "selected" : "" %>>Incertain</option>
                    </select>
                </form>
            </td>
            <td>
                <form action="EvenementControler" method="post">
                    <input type="hidden" name="action" value="desinscription" />
                    <input type="hidden" name="evenementId" value="<%= evt.getId() %>" />
                    <button type="submit" class="btn-valider">Quitter</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p style="text-align:center;">Vous n'êtes inscrit à aucun évènement.</p>
    <% } %>

    <%-- Autres événements --%>
    <h2>Événements disponibles</h2>

        <%
    List<Evenement> evenementsDisponibles = (List<Evenement>) request.getAttribute("evenementsDisponibles");
    List<Pupitre> pupitres = (List<Pupitre>) request.getAttribute("pupitres");

    if (evenementsDisponibles != null && !evenementsDisponibles.isEmpty()) {
        for (Evenement e : evenementsDisponibles) {
%>
    <div style="border:1px solid #ccc; padding:10px; margin-bottom:10px;">
        <h3><%= e.getNom() %></h3>
        <p>Date : <%= e.getDate() %></p>
        <p>Lieu : <%= e.getLieu() %></p>

        <form action="EvenementControler" method="post">
            <input type="hidden" name="action" value="inscription" />
            <input type="hidden" name="evenementId" value="<%= e.getId() %>" />

            <label for="pupitre-<%= e.getId() %>">Choisissez un pupitre :</label>
            <% if (pupitres != null && !pupitres.isEmpty()) { %>
            <select name="pupitreId" id="pupitre-<%= e.getId() %>">
                <% for (Pupitre p : pupitres) { %>
                <option value="<%= p.getId() %>"><%= p.getNom() %></option>
                <% } %>
            </select>
            <button type="submit" class="btn-valider">S'inscrire</button>
            <% } else { %>
            <p>Vous n'êtes pas encore affecté à un pupitre. Veuillez vous inscrire à un pupitre.</p>
            <% } %>
        </form>
    </div>
        <%
        }
    } else {
%>
    <p>Aucun événement disponible.</p>
        <%
    }
%>

</div>

<%@ include file="footer.jspf" %>

</body>
</html>
