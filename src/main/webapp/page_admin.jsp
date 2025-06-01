<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>La Farandole des Fanfarons</title>
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

<div class="conteneur">
    <h1>Bienvenue dans</h1>
    <h1><em>La Farandole des Fanfarons</em></h1>
    <img src="fanfare_img.jpg" alt="Fanfare en pleine action" class="fanfare-img">
    <p>
        FanfareHub, c’est la plateforme faite par et pour les fanfarons.
        Que tu sois trompettiste déchaîné, percussionniste fidèle ou nouveau souffle curieux de rejoindre l'aventure,
        ici tu trouveras tout ce qu’il te faut pour vivre ta fanfare à fond.<br><br>
        Inscris-toi facilement, retrouve le planning des répétitions, inscris-toi aux prestations et ne rate aucun atelier !
        Notre objectif : simplifier l’organisation, booster la convivialité et faire résonner la musique partout où la fanfare passe. 🎶
    </p>
</div>

<%@ include file="footer.jspf" %>

</body>
</html>
