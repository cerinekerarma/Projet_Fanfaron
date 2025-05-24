package dao;

import java.util.Objects;

public class Groupe {
    private int id;
    private String nom;

    public Groupe(int id, String nom) {
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
        return "Groupe{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Groupe groupe = (Groupe) o;
        return id == groupe.id && Objects.equals(nom, groupe.nom);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nom);
    }
}
