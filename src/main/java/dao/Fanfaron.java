package dao;

import java.time.LocalDateTime;

public class Fanfaron {
    private String login;
    private String nom;
    private String prenom;
    private String adresse;
    private String genre;
    private String mdp;
    private String crtAlimentaire;
    private LocalDateTime derniereConnection;
    private LocalDateTime dateCreation;

    public Fanfaron() {
        // Constructeur par défaut
    }

    public Fanfaron(String login, String nom, String prenom, String adresse, String genre,
                    String mdp, String crtAlimentaire, LocalDateTime derniereConnection, LocalDateTime dateCreation) {
        this.login = login;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.genre = genre;
        this.mdp = mdp;
        this.crtAlimentaire = crtAlimentaire;
        this.derniereConnection = derniereConnection;
        this.dateCreation = dateCreation;
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

    public LocalDateTime getDerniereConnection() {
        return derniereConnection;
    }

    public void setDerniereConnection(LocalDateTime derniereConnection) {
        this.derniereConnection = derniereConnection;
    }

    public LocalDateTime getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(LocalDateTime dateCreation) {
        this.dateCreation = dateCreation;
    }

    @Override
    public String toString() {
        return "Fanfaron{" +
                "login='" + login + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", adresse='" + adresse + '\'' +
                ", genre='" + genre + '\'' +
                ", mdp='******'" +
                ", crtAlimentaire='" + crtAlimentaire + '\'' +
                ", derniereConnection=" + derniereConnection +
                ", dateCreation=" + dateCreation +
                '}';
    }
}
