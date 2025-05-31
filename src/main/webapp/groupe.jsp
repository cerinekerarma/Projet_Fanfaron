<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Groupe" %>
<html>
<head>
    <title>Inscription à un Groupe</title>
</head>
<body>

<%@ include file="header_user.jspf" %>

<div class="conteneur">
<h1>Choisissez un groupe pour vous inscrire</h1>

<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<h4 class="message"><%= message %></h4>
<%
    }
%>

<%
    List<Groupe> groupes = (List<Groupe>) request.getAttribute("groupes");
    if (groupes != null && !groupes.isEmpty()) {
%>
<form action="GroupeControler" method="post">
    <input type="hidden" id="action" name="action" value="inscription" />
    <label for="groupe">Groupe :</label>
    <select name="groupeId" id="groupe">
        <%
            for (Groupe groupe : groupes) {
        %>
        <option value="<%= groupe.getId() %>"><%= groupe.getNom() %></option>
        <%
            }
        %>
    </select>
    <button type="submit" class="btn-valider">S'inscrire</button>
</form>
<%
} else {
%>
<p style="text-align:center;">Aucun groupe disponible.</p>
<%
    }
%>

<h2>Groupes où vous êtes inscrit</h2>

<%
    List<Groupe> inscGroupes = (List<Groupe>) request.getAttribute("inscGroupes");
    if (inscGroupes != null && !inscGroupes.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>Nom du groupe</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Groupe groupe : inscGroupes) {
    %>
    <tr>
        <td><%= groupe.getNom() %></td>
        <td>
            <form action="GroupeControler" method="post" class="inline-form">
                <input type="hidden" name="action" value="desinscription" />
                <input type="hidden" name="groupeId" value="<%= groupe.getId() %>" />
                <button type="submit" class="btn-valider">Se désinscrire</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p style="text-align:center;">Vous n'êtes inscrit à aucun groupe.</p>
<%
    }
%>

</div>

<%@ include file="footer.jspf" %>

</body>
</html>
