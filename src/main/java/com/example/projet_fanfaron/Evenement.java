package com.example.projet_fanfaron;

import java.time.LocalDateTime;

public class Evenement {
    private int id;
    private LocalDateTime date;
    private String nom;
    private String lieu;
    private String description;
    private String type;
    private String createur;

    public Evenement(int id, LocalDateTime date, String nom, String lieu, String description, String type, String createur) {
        this.id = id;
        this.date = date;
        this.nom = nom;
        this.lieu = lieu;
        this.description = description;
        this.type = type;
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
                ", type='" + type + '\'' +
                ", createur='" + createur + '\'' +
                '}';
    }
}
