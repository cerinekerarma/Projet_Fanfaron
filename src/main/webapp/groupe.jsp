<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Groupe" %>
<html>
<head>
    <title>Inscription à un Groupe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        select, button {
            padding: 8px;
            margin-top: 20px;
        }
        form {
            margin-top: 40px;
        }
    </style>
</head>
<body>
<h1>Choisissez un groupe pour vous inscrire</h1>
<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<p style="color: green; font-weight: bold;"><%= message %></p>
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
    <br>
    <button type="submit">S'inscrire</button>
</form>
<%
} else {
%>
<p>Aucun groupe disponible.</p>
<%
    }
%>

<h2>Groupes où vous êtes inscrit</h2>
<%
    List<Groupe> inscGroupes = (List<Groupe>) request.getAttribute("inscGroupes");
    if (inscGroupes != null && !inscGroupes.isEmpty()) {
%>
<table style="margin: 0 auto; border-collapse: collapse;">
    <tr>
        <th style="padding: 8px; border: 1px solid #ccc;">Nom du groupe</th>
        <th style="padding: 8px; border: 1px solid #ccc;">Action</th>
    </tr>
    <%
        for (Groupe groupe : inscGroupes) {
    %>
    <tr>
        <td style="padding: 8px; border: 1px solid #ccc;"><%= groupe.getNom() %></td>
        <td style="padding: 8px; border: 1px solid #ccc;">
            <form action="GroupeControler" method="post" style="margin: 0;">
                <input type="hidden" name="action" value="desinscription" />
                <input type="hidden" name="groupeId" value="<%= groupe.getId() %>" />
                <!-- Id du fanfaron à récupérer d'une autre source (session ?) -->
                <button type="submit">Se désinscrire</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
<%
} else {
%>
<p>Vous n'êtes inscrit à aucun groupe.</p>
<%
    }
%>

</body>
</html>
