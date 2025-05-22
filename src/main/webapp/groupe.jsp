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
</body>
</html>
