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

<style>
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 12px;
    }

    thead tr th {
        background: rgba(28, 142, 161, 0.8);
        color: white;
        font-weight: 700;
        padding: 14px 12px;
        border-radius: 12px 12px 0 0;
        box-shadow: 0 2px 10px rgba(24, 147, 147, 0.4);
        text-transform: uppercase;
        letter-spacing: 1.1px;
        font-size: 0.95rem;
    }

    tbody tr {
        background: #fff5f4;
        box-shadow: 0 2px 10px rgba(255, 106, 95, 0.15);
        border-radius: 12px;
        transition: transform 0.25s ease;
    }

    tbody tr:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 20px rgba(255, 106, 95, 0.3);
    }

    tbody tr td {
        text-align: center;
        padding: 14px 10px;
        color: #6f3a3a;
        font-weight: 600;
        border-bottom: none;
    }

    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 12px;
        table-layout: fixed;
    }

    thead tr th, tbody tr td {
        width: 50%;
    }

    button.btn-modifier {
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

    button.btn-modifier:hover {
        box-shadow: 0 6px 25px rgba(255, 106, 95, 0.8);
        transform: scale(1.05);
    }
</style>

<div class="content">
    <h1>GESTION DE COMPTE ADMINISTRATEUR</h1>

    <% String msg = (String) request.getAttribute("message");
        if (msg != null) { %>
    <h4><%= msg %></h4>
    <% } %>

    <%
        List<Fanfaron> fanfarons = (List<Fanfaron>) request.getAttribute("fanfarons");
        if (fanfarons != null && !fanfarons.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>User</th>
            <th>Modifier</th>
            <th>Supprimer</th>
            <th>Rendre Admin</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Fanfaron fanfaron : fanfarons) {
                if(!fanfaron.isAdmin() && fanfaron.isActivated()){
        %>
        <tr>
            <td><%= fanfaron.getLogin() %></td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="modifier_admin" />
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-modifier">Modifier</button>
                </form>
            </td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="suppression_par_admin" />
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-modifier" onclick="if(confirm('Confirmer la suppression du compte')) { document.getElementById('action').value='suppression_par_admin'; return true; } else { return false; }">Supprimer</button>
                </form>
            </td>
            <td>
                <form action="UserControler" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="rendre_admin" />
                    <input type="hidden" name="login" value="<%= fanfaron.getLogin() %>" />
                    <button type="submit" class="btn-modifier">Rendre admin</button>
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
    <p class="no-users">Aucun fanfaron trouvé.</p>
    <%
        }
    %>

</div>

<%@ include file="footer.jspf" %>

</body>
</html>
