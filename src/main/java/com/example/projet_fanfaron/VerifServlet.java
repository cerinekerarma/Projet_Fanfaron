package com.example.projet_fanfaron;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;

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
        if (!mail.equals(mail2) || !password.equals(password2)) {
            res.sendRedirect("erreur_credentials.jsp");
            return;
        }

        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/FanfaronDB", "fanfaron_user", "fanfaron_password");

            // Vérification de l’unicité du login
            String checkQuery = "SELECT login FROM fanfaron WHERE login = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, login);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Utilisateur déjà existant
                res.sendRedirect("erreur_utilisateur_existe.html");
                return;
            }

            // Insertion dans la table fanfaron
            String insertQuery = """
                INSERT INTO fanfaron (login, nom, prenom, adresse, genre, mdp, crt_alimentaire, date_creation, derniere_connection)
                VALUES (?, ?, ?, ?, ?, digest(?, 'sha256'), ?, ?, NULL)
                """;

            PreparedStatement insertStmt = con.prepareStatement(insertQuery);
            insertStmt.setString(1, login);
            insertStmt.setString(2, nom);
            insertStmt.setString(3, prenom);
            insertStmt.setString(4, mail);
            insertStmt.setString(5, genre);
            insertStmt.setString(6, password);
            insertStmt.setString(7, preferences);
            insertStmt.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));

            int rows = insertStmt.executeUpdate();

            if (rows > 0) {
                HttpSession session = req.getSession(true);
                session.setAttribute("login", login);
                res.sendRedirect("menu.html");
            } else {
                res.sendRedirect("erreur_insertion.html");
            }

        } catch (Exception e) {
            out.println("""
            <!DOCTYPE html>
            <html lang="fr">
            <head><meta charset="UTF-8"><title>Erreur</title></head>
            <body>
            <h2>Erreur de traitement :</h2>
            <p>""" + e.getMessage() + "</p></body></html>");
        } finally {
            try {
                if (con != null && !con.isClosed()) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
