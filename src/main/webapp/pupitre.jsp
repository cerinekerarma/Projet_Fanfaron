<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Pupitre" %>
<html>
<head>
    <title>Inscription à un Pupitre</title>
</head>
<body>

<%@ include file="header_user.jspf" %>

<div class="conteneur">
<h1>Choisissez un pupitre pour vous inscrire</h1>

<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<h4 class="message"><%= message %></h4>
<%
    }
%>

<%
    List<Pupitre> pupitres = (List<Pupitre>) request.getAttribute("pupitres");
    if (pupitres != null && !pupitres.isEmpty()) {
%>
<form action="PupitreControler" method="post">
    <input type="hidden" name="action" value="inscription" />
    <label for="pupitre">Pupitre :</label>
    <select name="pupitreId" id="pupitre">
        <%
            for (Pupitre pupitre : pupitres) {
        %>
        <option value="<%= pupitre.getId() %>"><%= pupitre.getNom() %></option>
        <%
            }
        %>
    </select>
    <button type="submit" class="btn-valider">S'inscrire</button>
</form>
<%
} else {
%>
<p style="text-align:center;">Aucun pupitre disponible.</p>
<%
    }
%>

<h2>Pupitres où vous êtes inscrit</h2>

<%
    List<Pupitre> inscPupitres = (List<Pupitre>) request.getAttribute("inscPupitres");
    if (inscPupitres != null && !inscPupitres.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>Nom du pupitre</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Pupitre pupitre : inscPupitres) {
    %>
    <tr>
        <td><%= pupitre.getNom() %></td>
        <td>
            <form action="PupitreControler" method="post" class="inline-form">
                <input type="hidden" name="action" value="desinscription" />
                <input type="hidden" name="pupitreId" value="<%= pupitre.getId() %>" />
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
<p style="text-align:center;">Vous n'êtes inscrit à aucun pupitre.</p>
<%
    }
%>
</div>

<%@ include file="footer.jspf" %>

</body>
</html>
