package dao;

import java.time.LocalDateTime;

public class Evenement {
    private int id;
    private LocalDateTime date;
    private String nom;
    private String lieu;
    private String description;
    private String type;

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    private int duree;
    private String createur;

    public Evenement(LocalDateTime date, String nom, String lieu, String description, int duree, String createur) {
        this.date = date;
        this.nom = nom;
        this.lieu = lieu;
        this.description = description;
        this.duree = duree;
        //this.type = type;
        this.createur = createur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCreateur() {
        return createur;
    }

    public void setCreateur(String createur) {
        this.createur = createur;
    }

    @Override
    public String toString() {
        return "Evenement{" +
                "id=" + id +
                ", date=" + date +
                ", nom='" + nom + '\'' +
                ", lieu='" + lieu + '\'' +
                ", description='" + description + '\'' +
                ", duree='" + duree + '\'' +
                ", createur='" + createur + '\'' +
                '}';
    }
}
