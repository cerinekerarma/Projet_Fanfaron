package com.example.projet_fanfaron;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/EvenementControler")
public class EvenementControler extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String vue = "evenement.jsp"; // La vue associée aux événements - vue par default

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
                case "vers_modifier_event":{
                    vue = "modifier_event.jsp";
                    break;
                }
                case "modifier_event":{

                }
                case "supprimer_event":{
                    int idToDelete = Integer.parseInt(req.getParameter("eventID"));
                    EvenementDAO eventDAO = DAOFactory.getEvenementDAO();

                    boolean deleted = eventDAO.delete(idToDelete);

                    if (deleted) {
                        req.setAttribute("message", "Évènement supprimé avec succès.");
                    } else {
                        req.setAttribute("message", "Erreur lors de la suppression de l'évènement.");
                    }

                    List<Evenement> events = eventDAO.findAll();
                    req.setAttribute("events", events);

                    vue = "evenements_crees.jsp";
                    break;
                }
                case "creer_evenement":{
                    session = req.getSession();
                    Fanfaron fanfaron = (Fanfaron) session.getAttribute("user");

                    if (fanfaron == null) {
                        vue = "connexion.jsp";
                        break;
                    }

                    InscriptionGroupeDAO inscriptionGroupeDAO = DAOFactory.getInscriptionGroupeDAO();
                    List<InscriptionGroupe> groupes = inscriptionGroupeDAO.findAllByFanfaron(fanfaron.getLogin());

                    boolean estDansPrestation = false;
                    for (InscriptionGroupe g : groupes) {
                        if (g.getIdGroupe() == 1) {
                            estDansPrestation = true;
                            break;
                        }
                    }

                    if (!estDansPrestation) {
                        req.setAttribute("message", "Cette fonctionnalité est réservée uniquement aux personnes faisant partie de la commission prestation");
                        vue = "groupe.jsp";
                        afficherGroupe(req, login);
                        req.getRequestDispatcher("/"+vue).forward(req, res);
                        break;
                    }
                    else{
                        vue = "evenement_creer.jsp";
                        break;
                    }
                }
                case "vers_evenements_crees":{
                    vue = "evenements_crees.jsp";
                    afficherEvenements(req, login);
                    req.getRequestDispatcher("/"+vue).forward(req, res);
                    break;
                }
                case "ajouter_evenement":{
                    String nom = req.getParameter("nom");
                    LocalDateTime date = LocalDateTime.parse(req.getParameter("date"));
                    int duree = Integer.parseInt(req.getParameter("duree"));
                    String lieu = req.getParameter("lieu");
                    String description = req.getParameter("description");


                    EvenementDAO evenementDAO = DAOFactory.getEvenementDAO();
                    Evenement evenement = new Evenement(date, nom, lieu, description, duree, login);

                    boolean inserted = evenementDAO.insert(evenement);
                    if (!inserted) {
                        System.out.println("Erreur : impossible de créer l'évènement.");
                        vue = "evenement_creer.jsp";
                        break;
                    } else{
                        req.setAttribute("message", "Votre évènement a été crée avec succès.");
                        vue = "evenement.jsp";
                        afficherEvenements(req, login);
                        req.getRequestDispatcher("/"+vue).forward(req, res);
                        break;
                    }
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

        List<Evenement> evenementsCrees = new ArrayList<>();
        for (Evenement e : evenementDAO.findAll()) {
            if (e.getCreateur().equals(login)) {
                evenementsCrees.add(e);
            }
        }
        req.setAttribute("events", evenementsCrees);

    }

    private void afficherGroupe(HttpServletRequest req, String login) {
        GroupeDAO groupeDAO = DAOFactory.getGroupeDAO();
        List<Groupe> groupes = groupeDAO.findAll();
        InscriptionGroupeDAO inscDAO = DAOFactory.getInscriptionGroupeDAO();
        System.out.println(login);
        List<InscriptionGroupe> inscGroupes = inscDAO.findAllByFanfaron(login);
        List<Groupe> inscGroupeList = new ArrayList<>();
        for (InscriptionGroupe inscGroupe : inscGroupes) {
            Groupe groupe = groupeDAO.find(inscGroupe.getIdGroupe());
            inscGroupeList.add(groupe);
            groupes.remove(groupe);
        }
        req.setAttribute("groupes", groupes);
        req.setAttribute("inscGroupes", inscGroupeList);
    }
}
