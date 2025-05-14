<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Erreur d'identifiants</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            margin: 0;
            padding: 0;
        }

        .conteneur {
            max-width: 500px;
            margin: 80px auto;
            background-color: #fff;
            border-left: 6px solid #dc3545;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            color: #dc3545;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #333;
        }

        .btn-retour {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-retour:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
<div class="conteneur">
    <h2>Erreur d'identifiants</h2>
    <p>Les adresses mail ou les mots de passe ne correspondent pas. Veuillez vérifier vos informations et réessayer.</p>
    <a href="formulaire.jsp" class="btn-retour">Retour à l'inscription</a>
</div>
</body>
</html>
