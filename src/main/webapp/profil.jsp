<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Fanfaron" %>
<html>
<head>
    <title>Profil</title>
</head>
<body>

<%@ include file="header_user.jspf" %>

<h1 style="margin-top: 100px; ">Profil</h1>

<%
    Fanfaron fanfaron = (Fanfaron) session.getAttribute("user");
    if (fanfaron != null) {
%>
<% String message = (String) request.getAttribute("message");
    if (message != null) { %>
<p style="color:#bb2d3b; text-align:center;"><%= message %></p>
<% } %>

<table>
    <tr>
        <th>Login</th>
        <td><%= fanfaron.getLogin() %></td>
    </tr>
    <tr>
        <th>Nom</th>
        <td><%= fanfaron.getNom() %></td>
    </tr>
    <tr>
        <th>Prénom</th>
        <td><%= fanfaron.getPrenom() %></td>
    </tr>
    <tr>
        <th>Adresse mail</th>
        <td><%= fanfaron.getAdresse() %></td>
    </tr>
    <tr>
        <th>Genre</th>
        <td><%= fanfaron.getGenre() %></td>
    </tr>
    <tr>
        <th>Mot de passe</th>
        <td>••••••••</td>
    </tr>
    <tr>
        <th>Critère alimentaire</th>
        <td><%= fanfaron.getCrtAlimentaire() %></td>
    </tr>
</table>

<div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/UserControler?action=modifier_profil">Modifier</a>
</div>
<div style="text-align: center; margin-bottom: 35px;" >
    <a href="${pageContext.request.contextPath}/UserControler?action=suppression"
       onclick="return confirm('Confirmer la suppression du compte');">
        Supprimer le compte
    </a>
</div>


<%
} else {
%>
<p style="text-align: center;">Utilisateur non connecté.</p>
<%
    }
%>

<%@ include file="footer.jspf" %>

</body>
</html>