package com.example.projet_fanfaron;

import dao.DAOFactory;
import dao.Fanfaron;
import dao.FanfaronDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.Instant;

@WebServlet("/verif")
public class VerifServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        // Récupération des paramètres du formulaire
        String login = req.getParameter("login");
        String nom = req.getParameter("name");
        String prenom = req.getParameter("prenom");
        String mail = req.getParameter("mail");
        String mail2 = req.getParameter("mail2");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");
        String genre = req.getParameter("gender");
        String preferences = req.getParameter("preferences");

        // Vérifications de base
        if (!mail.equals(mail2)){
            System.out.println("mail1: "+mail);
            System.out.println("mail1: "+mail);

            System.out.println("Erreur mail");
            res.sendRedirect("erreur_credentials.jsp");
            return;
        }

        if(!password.equals(password2)) {
            System.out.println("Erreur mdp");
            res.sendRedirect("erreur_credentials.jsp");
            return;
        }

        Timestamp tempsActuel= Timestamp.from(Instant.now());

        FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
        Fanfaron fanfaron = new Fanfaron(login, nom, prenom, mail, password, genre, preferences, tempsActuel, tempsActuel );
        boolean fanfaronInserted = fanfaronDAO.insert(fanfaron);
        if (!fanfaronInserted) {
            System.out.println("Erreur ne peut pas inserer un fanfaron");
            res.sendRedirect("erreur_utilisateur_existe.jsp");
        }
        else{
            res.sendRedirect("index.jsp");
        }

    }
}
