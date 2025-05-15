package com.example.projet_fanfaron;

import dao.DAOFactory;
import dao.Fanfaron;
import dao.FanfaronDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet("/UserControler")
public class UserControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "formulaire.jsp"; // Vue par défaut

        try {
            switch (action) {
                case "ajouter": {
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
                        vue = "erreur_credentials.jsp";
                        break;
                    }

                    if(!password.equals(password2)) {
                        System.out.println("Erreur mdp");
                        vue = "erreur_credentials.jsp";
                        break;
                    }

                    Timestamp tempsActuel= Timestamp.from(Instant.now());

                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                    Fanfaron fanfaron = new Fanfaron(login, nom, prenom, mail, password, genre, preferences, tempsActuel, tempsActuel );
                    boolean fanfaronInserted = fanfaronDAO.insert(fanfaron);
                    if (!fanfaronInserted) {
                        System.out.println("Erreur ne peut pas inserer un fanfaron");
                        vue = "erreur_credentials.jsp";
                    }
                    else{
                        vue = "index.jsp";
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
        req.getRequestDispatcher(vue).forward(req, res);
    }
}
