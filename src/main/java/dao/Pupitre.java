package dao;

import java.util.Objects;

public class Pupitre {
    private int id;
    private String nom;

    public Pupitre(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public String toString() {
        return "Pupitre{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Pupitre pupitre = (Pupitre) o;
        return id == pupitre.id && Objects.equals(nom, pupitre.nom);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nom);
    }
}
