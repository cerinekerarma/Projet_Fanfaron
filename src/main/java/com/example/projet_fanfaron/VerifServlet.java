package com.example.projet_fanfaron;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/verif")
public class VerifServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        // Récupération des paramètres du formulaire
        String login = req.getParameter("login");
        String mail = req.getParameter("mail");
        String mail2 = req.getParameter("mail2");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");
        String gender = req.getParameter("gender");
        String preferences = req.getParameter("preferences");

        // Vérifications de base
        if (!mail.equals(mail2) || !password.equals(password2)) {
            res.sendRedirect("erreur.jsp"); // Crée une page erreur avec un message clair
            return;
        }

        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/webdb", "web_user", "motdepasse");

            // Vérification de l’unicité du login et de l’email
            String checkQuery = "SELECT * FROM utilisateur WHERE login = ? OR mail = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, login);
            checkStmt.setString(2, mail);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Un utilisateur existe déjà avec ce login ou email
                res.sendRedirect("erreur_utilisateur_existe.html");
                return;
            }

            // Insertion de l'utilisateur
            String insertQuery = """
                INSERT INTO utilisateur (login, mail, mdp, genre, preferences, date_creation, derniere_connexion)
                VALUES (?, ?, digest(?, 'sha256'), ?, ?, ?, NULL)
                """;

            PreparedStatement insertStmt = con.prepareStatement(insertQuery);
            insertStmt.setString(1, login);
            insertStmt.setString(2, mail);
            insertStmt.setString(3, password);
            insertStmt.setString(4, gender);
            insertStmt.setString(5, preferences);
            insertStmt.setDate(6, Date.valueOf(LocalDate.now())); // date de création = aujourd’hui

            int rows = insertStmt.executeUpdate();

            if (rows > 0) {
                // Connexion automatique de l’utilisateur
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
