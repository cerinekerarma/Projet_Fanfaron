<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Fanfaron" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>La Farandole des Fanfarons - Validation des comptes</title>
</head>

<body>

<%@ include file="header_admin.jspf" %>

<div class="content">
    <h1>GESTION DE COMPTE ADMINISTRATEUR</h1>

    <% String msg = (String) request.getAttribute("message");
        if (msg != null) { %>
    <h4><%= msg %></h4>
    <% } %>

    <%
        List<Fanfaron> fanfarons = (List<Fanfaron>) request.getAttribute("fanfarons");
        boolean hasNonActivated = false;
        if (fanfarons != null && !fanfarons.isEmpty()) {
    %>

    <table>
        <thead>
        <tr>
            <th>User</th>
            <th>Valider</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Fanfaron fanfaron : fanfarons) {
                if (!fanfaron.isActivated()) {
                    hasNonActivated = true;
        %>
        <tr>
            <td><%= fanfaron.getLogin() %></td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <input type="hidden" name="action" value="valider" />
                    <button type="submit" class="btn-valider">Valider</button>
                </form>
            </td>
        </tr>
        <%      }
        }
            if (!hasNonActivated) {
        %>
        <tr>
            <td colspan="2" class="no-users">Aucun user à valider pour le moment.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <% } else { %>
    <p class="no-users">Aucun user à valider pour le moment.</p>
    <% } %>
</div>

<%@ include file="footer.jspf" %>

</body>
</html>
