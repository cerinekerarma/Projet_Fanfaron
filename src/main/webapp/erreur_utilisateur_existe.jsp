<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Utilisateur déjà existant</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #fff3cd;
            color: #856404;
            margin: 0;
            padding: 40px;
            text-align: center;
        }
        .warning-container {
            background-color: #ffeeba;
            border: 1px solid #ffeeba;
            padding: 30px;
            border-radius: 10px;
            display: inline-block;
        }
        a {
            color: #856404;
            font-weight: bold;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="warning-container">
    <h1>Erreur : utilisateur déjà existant</h1>
    <p>Le nom d'utilisateur ou l'adresse e-mail est déjà utilisé. Veuillez en choisir un autre.</p>
    <p><a href="inscription.html">Retour à la page d'inscription</a></p>
</div>
</body>
</html>
