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

@WebServlet("/PupitreControler")
public class PupitreControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "pupitre.jsp"; // Vue par défaut

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
                case "desinscription": {
                    int pupitreId = Integer.parseInt(req.getParameter("pupitreId"));
                    InscriptionPupitreDAO inscDAO = DAOFactory.getInscriptionPupitreDAO();
                    boolean conf = inscDAO.delete(login, pupitreId);
                    if (conf) {
                        req.setAttribute("message", "Vous avez bien été désinscrit du pupitre !");
                    } else {
                        req.setAttribute("message", "Erreur lors de la désinscription...");
                    }
                    break;
                }
                case "inscription": {
                    int pupitreId = Integer.parseInt(req.getParameter("pupitreId"));
                    InscriptionPupitre inscPupitre = new InscriptionPupitre(login, pupitreId);
                    InscriptionPupitreDAO inscDAO = DAOFactory.getInscriptionPupitreDAO();
                    boolean conf = inscDAO.insert(inscPupitre);
                    if (conf) {
                        req.setAttribute("message", "Inscription au pupitre réussie !");
                    } else {
                        req.setAttribute("message", "Erreur lors de l'inscription...");
                    }
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

        afficherPupitres(req, login);
        req.getRequestDispatcher(vue).forward(req, res);
    }

    private void afficherPupitres(HttpServletRequest req, String login) {
        PupitreDAO pupitreDAO = DAOFactory.getPupitreDAO();
        List<Pupitre> pupitres = pupitreDAO.findAll();

        InscriptionPupitreDAO inscDAO = DAOFactory.getInscriptionPupitreDAO();
        List<InscriptionPupitre> inscPupitres = inscDAO.findAllByFanfaron(login);

        List<Pupitre> inscPupitreList = new ArrayList<>();
        for (InscriptionPupitre inscPupitre : inscPupitres) {
            Pupitre pupitre = pupitreDAO.find(inscPupitre.getIdPupitre());
            inscPupitreList.add(pupitre);
            pupitres.remove(pupitre);
        }

        req.setAttribute("pupitres", pupitres);
        req.setAttribute("inscPupitres", inscPupitreList);
    }
}
