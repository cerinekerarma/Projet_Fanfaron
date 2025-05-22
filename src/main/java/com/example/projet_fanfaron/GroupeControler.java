package com.example.projet_fanfaron;

import dao.DAOFactory;
import dao.FanfaronDAO;
import dao.GroupeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class GroupeControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "groupe.jsp"; // Vue par défaut

        try {
            switch (action) {
                case null : {
                    GroupeDAO groupeDAO = DAOFactory.getGroupeDAO();
                    break;
                }
                case "inscription": {

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
}
