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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UserControler")
public class UserControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "connexion.jsp"; // Vue par défaut

        try {
            switch (action) {
                case null:
                case "gerer_comptes":
                    afficherFanfarons(req, res, "/acceptation_inscription_admin.jsp");
                    return;
                case "connexion": {
                    String login = req.getParameter("login");
                    String password = req.getParameter("password");

                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                    Fanfaron fanfaron = fanfaronDAO.matchPassword(login, password);


                    if (fanfaron == null) {
                        req.setAttribute("message", "Login ou mot de passe incorrect.");
                        System.out.println("Tentative de connexion echouee pour: login=" + login + ", password=" + password);
                        vue = "connexion.jsp";
                        break;
                    }

                    if (!fanfaron.isActivated()) {
                        req.setAttribute("message", "Votre compte n’est pas encore activé.");
                        vue = "connexion.jsp";
                        break;
                    }


                    HttpSession session = req.getSession(true);

                    if(!fanfaron.isAdmin()){
                        session.setAttribute("user", fanfaron);
                        System.out.println("Tentative de connexion reussi pour: login=" + login + ", password=" + password);
                        vue = "acceuil.jsp";
                    }
                    else{
                        vue = "page_admin.jsp";
                    }
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
                case "deconnexion": {
                    req.getSession().invalidate();
                    vue = "connexion.jsp";
                    break;
                }
                case "consulter_profil": {
                    vue = "profil.jsp";
                    break;
                }
                case "modifier_profil": {
                    vue = "modification.jsp";
                    break;
                }
                case "ajouter": {
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
                    } else{
                        req.setAttribute("message", "Inscription réussie. Veuillez attendre l’activation de votre compte par un administrateur.");
                        vue = "connexion.jsp";
                    }
                    break;
                }
                case "modifier": {
                    String login = req.getParameter("login");
                    String nom = req.getParameter("name");
                    String prenom = req.getParameter("prenom");
                    String mail = req.getParameter("mail");
                    String password = req.getParameter("password");
                    String genre = req.getParameter("gender");
                    String preferences = req.getParameter("preferences");

                    HttpSession session = req.getSession();
                    Fanfaron currentUser = (Fanfaron) session.getAttribute("user");

                    if (currentUser == null) {
                        vue = "connexion.jsp";
                        break;
                    }

                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();

                    if (!login.equals(currentUser.getLogin())) {
                        Fanfaron existing = fanfaronDAO.find(login);
                        if (existing != null) {
                            req.setAttribute("message", "Ce login est déjà utilisé par un autre utilisateur.");
                            vue = "modification.jsp";
                            break;
                        }
                    }

                    if (password == null || password.trim().isEmpty()) {
                        // on garde l'ancien mdp s'il le user l'a pas modifie
                        //password = currentUser.getMdp();
                        password = null;
                    }

                    Fanfaron updatedFanfaron = new Fanfaron(
                            login, nom, prenom, mail, genre, password, preferences,
                            currentUser.getDerniereConnection(),
                            currentUser.getDateCreation(),
                            currentUser.isAdmin(),
                            currentUser.isActivated()
                    );

                    boolean updated = fanfaronDAO.update(updatedFanfaron);

                    if (!updated) {
                        req.setAttribute("message", "Erreur lors de la mise à jour.");
                        vue = "modification.jsp";
                    } else {
                        session.setAttribute("user", updatedFanfaron);
                        req.setAttribute("message", "Informations modifiées avec succès.");
                        vue = "profil.jsp";
                    }
                    break;
                }
                case "modifier_infos_users_admin": {
                    HttpSession session = req.getSession();
                    Fanfaron currentUser = (Fanfaron) session.getAttribute("user");

                    if (currentUser == null || !currentUser.isAdmin()) {
                        System.out.println("le current user dans modif user admin est "+currentUser.getLogin());
                        vue = "connexion.jsp";
                        break;
                    }

                    String login = req.getParameter("login");
                    String nom = req.getParameter("name");
                    String prenom = req.getParameter("prenom");
                    String mail = req.getParameter("mail");
                    String password = req.getParameter("password");
                    String genre = req.getParameter("gender");
                    String preferences = req.getParameter("preferences");

                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();

                    Fanfaron existing = fanfaronDAO.find(login);
                    if (existing == null) {
                        req.setAttribute("message", "Utilisateur introuvable.");
                        vue = "modification_users_admin.jsp";
                        break;
                    }

                    if (password == null || password.trim().isEmpty()) {
                        password = existing.getMdp();
                    }

                    Fanfaron updatedFanfaron = new Fanfaron(
                            login, nom, prenom, mail, genre, password, preferences,
                            existing.getDerniereConnection(),
                            existing.getDateCreation(),
                            existing.isAdmin(),
                            existing.isActivated()
                    );

                    boolean updated = fanfaronDAO.update(updatedFanfaron);

                    if (!updated) {
                        req.setAttribute("message", "Erreur lors de la mise à jour.");
                        vue = "modification_users_admin.jsp";
                    } else {
                        req.setAttribute("message", "Informations modifiées avec succès.");
                        List<Fanfaron> listeFanfarons = fanfaronDAO.findAll();
                        req.setAttribute("fanfarons", listeFanfarons);

                        vue = "modification_users_admin.jsp";
                    }
                    break;
                }
                case "valider": {
                    String login = req.getParameter("login");
                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                    Fanfaron f = fanfaronDAO.find(login);

                    if (f == null) {
                        req.setAttribute("message", "Erreur lors de la validation du compte de " + login);
                    } else {
                        f.setActivated(true);
                        boolean updated = fanfaronDAO.update(f);
                        if (!updated) {
                            req.setAttribute("message", "Erreur lors de la validation du compte de " + login);
                        } else {
                            req.setAttribute("message", "Compte de " + login + " activé avec succès");
                            System.out.println("Activation du compte de " + login);
                        }
                    }

                    afficherFanfarons(req, res, "/acceptation_inscription_admin.jsp");
                    return;
                }
                case "modifier_comptes":{
                    afficherFanfarons(req, res, "/modification_users_admin.jsp");
                    return;
                }
                case "modifier_admin":{
                    String login = req.getParameter("login");
                    FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                    Fanfaron f = fanfaronDAO.find(login);
                    req.setAttribute("fanfaron", f);
                    req.getRequestDispatcher("infos_user_admin_modifier.jsp").forward(req, res);

                    break;
                }
                case "suppression": {
                    HttpSession session = req.getSession(false);
                    if (session != null) {
                        Fanfaron deletedUser = (Fanfaron) session.getAttribute("user");
                        if (deletedUser != null) {
                            FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
                            boolean deleted = fanfaronDAO.delete(deletedUser.getLogin());

                            if (deleted) {
                                session.invalidate();
                                System.out.println("user "+deletedUser.getLogin()+" est deleted.");
                                vue = "formulaire.jsp";
                            } else {
                                req.setAttribute("message", "Erreur dans la suppression de votre compte.");
                                vue = "profil.jsp";
                            }
                        } else {
                            req.setAttribute("message", "Votre session a expiré, votre compte n'a pas pu être supprimé.");
                            vue = "connexion.jsp";
                        }
                    } else {
                        req.setAttribute("message", "Session expirée, veuillez vous reconnecter.");
                        vue = "connexion.jsp";
                    }
                    vue = "formulaire.jsp";
                    break;
                }
                default:
                    vue = "connexion.jsp";
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

    private void afficherFanfarons(HttpServletRequest req, HttpServletResponse res, String path) throws ServletException, IOException {
        FanfaronDAO fanfaronDAO = DAOFactory.getFanfaronDAO();
        List<Fanfaron> fanfarons = fanfaronDAO.findAll();
        req.setAttribute("fanfarons", fanfarons);
        for (Fanfaron fanfaron : fanfarons) {
            System.out.println(fanfaron.toString());
        }
        req.getRequestDispatcher(path).forward(req, res);

    }

}
