package com.example.projet_fanfaron;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/EvenementControler")
public class EvenementControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "evenement.jsp"; // La vue associée aux événements

        HttpSession session = req.getSession(true);
        if (session.getAttribute("user") == null) {
            res.sendRedirect("UserControler");
            return;
        }
        String login = ((Fanfaron) session.getAttribute("user")).getLogin();

        try {
            switch (action) {
                case null: {
                    break;
                }
                case "inscription": {
                    int eventId = Integer.parseInt(req.getParameter("evenementId"));
                    int pupitreId = Integer.parseInt(req.getParameter("pupitreId"));
                    InscriptionEvenementDAO inscDAO = DAOFactory.getInscriptionEvenementDAO();
                    boolean conf = inscDAO.insert(new InscriptionEvenement(login, eventId, pupitreId, "incertain"));
                    req.setAttribute("message", conf ?
                            "Vous avez bien été inscrit à l'événement !" :
                            "Erreur lors de votre inscription...");
                    break;
                }
                case "desinscription": {
                    int eventId = Integer.parseInt(req.getParameter("evenementId"));
                    InscriptionEvenementDAO inscDAO = DAOFactory.getInscriptionEvenementDAO();
                    boolean conf = inscDAO.delete(login, eventId);
                    req.setAttribute("message", conf ?
                            "Vous avez bien été désinscrit de l'événement !" :
                            "Erreur lors de votre désinscription...");
                    break;
                }
                default:
                    res.sendError(404, "Action non supportée");
                    return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(500, "Erreur serveur : " + e.getMessage());
            return;
        }

        afficherEvenements(req, login);
        req.getRequestDispatcher(vue).forward(req, res);
    }

    private void afficherEvenements(HttpServletRequest req, String login) {
        EvenementDAO evenementDAO = DAOFactory.getEvenementDAO();
        List<Evenement> tousEvenements = evenementDAO.findAll();

        InscriptionEvenementDAO inscDAO = DAOFactory.getInscriptionEvenementDAO();
        List<InscriptionEvenement> mesInscriptions = inscDAO.findAllByFanfaron(login);

        List<Evenement> evenementsInscrits = new ArrayList<>();
        for (InscriptionEvenement inscription : mesInscriptions) {
            Evenement e = evenementDAO.find(inscription.getIdEvenement());
            evenementsInscrits.add(e);
            tousEvenements.remove(e);
        }

        req.setAttribute("evenementsInscrits", evenementsInscrits);
        req.setAttribute("evenementsDisponibles", tousEvenements);


        List<Pupitre> userPupitres = new ArrayList<>();
        PupitreDAO pupitreDAO = DAOFactory.getPupitreDAO();
        InscriptionPupitreDAO inscriptionPupitreDAO = DAOFactory.getInscriptionPupitreDAO();
        List<InscriptionPupitre> pupitres = inscriptionPupitreDAO.findAllByFanfaron(login);
        for (InscriptionPupitre pupitre : pupitres) {
            userPupitres.add(pupitreDAO.find(pupitre.getIdPupitre()));
        }
        req.setAttribute("pupitres", userPupitres);
    }
}
