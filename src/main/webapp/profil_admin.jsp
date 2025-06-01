<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Fanfaron" %>
<html>
<head>
  <title>Profil</title>
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
  <a href="${pageContext.request.contextPath}/UserControler?action=modifier_profil_admin">Modifier</a>
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

<%@ include file="header_admin.jspf" %>

</body>
</html>