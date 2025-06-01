<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Groupe" %>
<%@ page import="dao.Evenement" %>
<%@ page import="dao.Fanfaron" %>
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
  <h1>Les évènements que vous avez créé</h1>

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

    List<Evenement> events = (List<Evenement>) request.getAttribute("events");
    if (events != null && !events.isEmpty()) {
  %>
  <table>
    <thead>
    <tr>
      <th>Évènement</th>
      <th>Modifier</th>
      <th>Supprimer</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (Evenement event : events) {
        if(event.getCreateur().equals(login)) {
    %>
    <tr>
      <td><%= event.getNom() %></td>
      <td>
        <form action="EvenementControler" method="post" style="display:inline;">
          <input type="hidden" name="action" value="vers_modifier_event" />
          <input type="hidden" name="eventID" value="<%= event.getId() %>" />
          <button type="submit" class="btn-valider">Modifier</button>
        </form>
      </td>
      <td>
        <form action="EvenementControler" method="post" style="display:inline;">
          <input type="hidden" name="action" value="supprimer_event" />
          <input type="hidden" name="eventID" value="<%= event.getId() %>" />
          <button type="submit" class="btn-valider" onclick="return confirm('Confirmer la suppression de l\'évènement ?')">Supprimer</button>
        </form>
      </td>
    </tr>
    <%
      }
    %>

    <%
      }
    %>
    </tbody>
  </table>
  <%
  } else {
  %>
  <p class="no-users">Vous n'avez créé aucun évènement pour le moment.</p>
  <%
    }
  %>

</div>

<%@ include file="footer.jspf" %>

</body>
</html>
