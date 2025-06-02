<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.Map" %>
<html>
<head>
  <title>Evnmts crées par vous</title>
</head>
<body>

<%@ include file="header_user.jspf" %>

<style>
  button.btn-valider {
  background: linear-gradient(45deg, #ff6a5f, #feb47b);
  border: none;
  color: #fff;
  padding: 10px 22px;
  font-weight: 700;
  border-radius: 30px;
  cursor: pointer;
  box-shadow: 0 4px 15px rgba(254, 180, 123, 0.6);
  transition: box-shadow 0.3s ease, transform 0.2s ease;
  font-size: 1rem;
  user-select: none;
  }

  button.btn-valider:hover {
  box-shadow: 0 6px 25px rgba(255, 106, 95, 0.8);
  transform: scale(1.05);
  }

  button.btn-valider {
  padding: 8px 16px;
  font-size: 0.9rem;
  }
</style>

<div class="conteneur">
  <h1>Tous les évènements</h1>

  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
  %>
  <h4 class="message"><%= message %></h4>
  <%
    }
  %>

  <%
    Fanfaron fanfaron = (Fanfaron) session.getAttribute("user");
    String login = fanfaron.getLogin();

    List<Evenement> events = (List<Evenement>) request.getAttribute("evenementsDisponibles");
    Map<Evenement, List<InscriptionEvenement>> inscriptions = (Map<Evenement, List<InscriptionEvenement>>) request.getAttribute("evenementsInscrits");
    Map<Integer, String> pupitres = (Map<Integer, String>) request.getAttribute("pupitres");
    if (events != null && !events.isEmpty()) {
  %>

  <%
    for (Evenement event : events) {
    %>
  <h2><%= event.getNom() %></h2>
  <table>
    <thead>
    <tr>
      <th>User</th>
      <th>Status</th>
      <th>Instrument</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (InscriptionEvenement insc : inscriptions.get(event)) {
    %>
    <tr>
      <td><%= insc.getIdFanfaron() %></td>
      <td>
        <%= insc.getStatus() %>
      </td>
      <td>
        <%= pupitres.get(insc.getIdPupitre())%>
      </td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
<%
  }
%>

  <%
    } else {
      %>
  <p> Aucun évènement créé </p>
  <%
    }
  %>
</div>

<%@ include file="footer.jspf" %>

</body>
</html>
