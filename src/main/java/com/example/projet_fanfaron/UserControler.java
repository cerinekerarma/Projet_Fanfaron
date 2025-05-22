package com.example.projet_fanfaron;

import dao.DAOFactory;
import dao.Fanfaron;
import dao.FanfaronDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
                case null:
                case "connexion": {
                    String login = req.getParameter("login");
                    String password = req.getParameter("password");

                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                    Fanfaron fanfaron = fanfaronDAO.matchPassword(login, password);

                    if (fanfaron == null ) {
                        req.setAttribute("message", "Login ou mot de passe incorrect.");
                        vue = "connexion.jsp";
                        break;
                    }
                    /*
                    if (!fanfaron.isActivated()) {
                        req.setAttribute("message", "Votre compte n’est pas encore activé.");
                        vue = "connexion.jsp";
                        break;
                    }
                    */
                    // Connexion réussie
                    HttpSession session = req.getSession(true);
                    session.setAttribute("user", fanfaron);
                    vue = "menu.jsp";
                    break;
                }

                case "versInscription": {
                    vue = "formulaire.jsp";
                    break;
                }

                case "versConnexion": {
                    vue = "connexion.jsp";
                    break;
                }


                case "ajouter": {
                    // Formulaire d'inscription
                    String login = req.getParameter("login");
                    String nom = req.getParameter("name");
                    String prenom = req.getParameter("prenom");
                    String mail = req.getParameter("mail");
                    String mail2 = req.getParameter("mail2");
                    String password = req.getParameter("password");
                    String password2 = req.getParameter("password2");
                    String genre = req.getParameter("gender");
                    String preferences = req.getParameter("preferences");

                    if (!mail.equals(mail2)) {
                        req.setAttribute("message", "Veuillez saisir 2 mails identiques.");
                        vue = "formulaire.jsp";
                        break;
                    }

                    if (!password.equals(password2)) {
                        req.setAttribute("message", "Veuillez saisir 2 mots de passe identiques.");
                        vue = "formulaire.jsp";
                        break;
                    }

                    Timestamp tempsActuel = Timestamp.from(Instant.now());

                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                    Fanfaron fanfaron = new Fanfaron(login, nom, prenom, mail, genre, password, preferences, tempsActuel, tempsActuel, false, false);
                    Fanfaron f = fanfaronDAO.find(login);

                    if (f != null) {
                        req.setAttribute("message", "Veuillez saisir un autre login, login déjà existant.");
                        vue = "formulaire.jsp";
                        break;
                    }

                    boolean inserted = fanfaronDAO.insert(fanfaron);
                    if (!inserted) {
                        System.out.println("Erreur : impossible d'insérer un fanfaron.");
                        vue = "formulaire.jsp";
                    } else {
                        HttpSession session = req.getSession(true);
                        session.setAttribute("user", fanfaron);
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
