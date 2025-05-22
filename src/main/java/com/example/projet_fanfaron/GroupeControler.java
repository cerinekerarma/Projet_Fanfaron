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

@WebServlet("/GroupeControler")
public class GroupeControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "groupe.jsp"; // Vue par défaut

        HttpSession session = req.getSession(true);
        if (session.getAttribute("user") == null) {
            res.sendRedirect("/UserControler");
        }
        String login = ((Fanfaron) session.getAttribute("user")).getLogin();

        try {
            switch (action) {
                case null : {
                    afficherGroupe(req);
                    break;
                }
                case "desinscription": {
                    int groupeId = Integer.parseInt(req.getParameter("groupeId"));
                    InscriptionGroupeDAO inscDAO = DAOFactory.getInscriptionGroupeDAO();
                    boolean conf = inscDAO.delete("t", groupeId);
                    if(conf){
                        req.setAttribute("message", "Vous avez bien été désinscrit !");
                    } else {
                        req.setAttribute("message", "Il y a eu une erreur dans votre désinscription...");
                    }
                    afficherGroupe(req);
                    break;
                }
                case "inscription": {
                    System.out.println("inscription");
                    int groupeId = Integer.parseInt(req.getParameter("groupeId"));
                    InscriptionGroupe inscGroupe = new InscriptionGroupe("t", groupeId);
                    InscriptionGroupeDAO inscDAO = DAOFactory.getInscriptionGroupeDAO();
                    boolean conf = inscDAO.insert(inscGroupe);
                    if(conf){
                        req.setAttribute("message", "Vous avez bien été inscrit !");
                    } else {
                        req.setAttribute("message", "Il y a eu une erreur dans votre inscription...");
                    }
                    afficherGroupe(req);
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
        req.getRequestDispatcher(vue).forward(req, res);
    }

    private void afficherGroupe(HttpServletRequest req) {
        GroupeDAO groupeDAO = DAOFactory.getGroupeDAO();
        List<Groupe> groupes = groupeDAO.findAll();
        req.setAttribute("groupes", groupes);
        InscriptionGroupeDAO inscDAO = DAOFactory.getInscriptionGroupeDAO();
        List<InscriptionGroupe> inscGroupes = inscDAO.findAll();
        List<Groupe> inscGroupeList = new ArrayList<>();
        for (InscriptionGroupe inscGroupe : inscGroupes) {
            inscGroupeList.add(groupeDAO.find(inscGroupe.getIdGroupe()));
        }
        req.setAttribute("inscGroupes", inscGroupeList);
    }
}
