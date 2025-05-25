package dao;

import java.sql.Timestamp;

public class Fanfaron {
    private String login;
    private String nom;
    private String prenom;
    private String adresse;
    private String genre;
    private String mdp;
    private String crtAlimentaire;
    private Timestamp derniereConnection;
    private Timestamp dateCreation;
    private boolean isAdmin;
    private boolean activated;

    public Fanfaron(String login, String nom, String prenom, String adresse, String genre,
                    String mdp, String crtAlimentaire, Timestamp derniereConnection, Timestamp dateCreation, boolean isAdmin
                    , boolean activated) {
        this.login = login;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.genre = genre;
        this.mdp = mdp;
        this.crtAlimentaire = crtAlimentaire;
        this.derniereConnection = derniereConnection;
        this.dateCreation = dateCreation;
        this.isAdmin = isAdmin;
        this.activated = activated;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getCrtAlimentaire() {
        return crtAlimentaire;
    }

    public void setCrtAlimentaire(String crtAlimentaire) {
        this.crtAlimentaire = crtAlimentaire;
    }

    public Timestamp getDerniereConnection() {
        return derniereConnection;
    }

    public void setDerniereConnection(Timestamp derniereConnection) {
        this.derniereConnection = derniereConnection;
    }

    public Timestamp getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Timestamp dateCreation) {
        this.dateCreation = dateCreation;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }


    @Override
    public String toString() {
        return "Fanfaron{" +
                "login='" + login + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", adresse='" + adresse + '\'' +
                ", genre='" + genre + '\'' +
                ", mdp='" + mdp + '\'' +
                ", crtAlimentaire='" + crtAlimentaire + '\'' +
                ", derniereConnection=" + derniereConnection + '\'' +
                ", dateCreation=" + dateCreation + '\'' +
                ", compte activé?=" + activated + '\'' +
                ", admin?=" + isAdmin +
                '}';
    }
}
