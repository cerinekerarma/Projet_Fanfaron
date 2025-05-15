package dao;

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
}
