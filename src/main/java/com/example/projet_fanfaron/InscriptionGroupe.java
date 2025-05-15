package com.example.projet_fanfaron;

public class InscriptionGroupe {
    private String idFanfaron;
    private int idGroupe;

    public InscriptionGroupe(String idFanfaron, int idGroupe) {
        this.idFanfaron = idFanfaron;
        this.idGroupe = idGroupe;
    }

    public String getIdFanfaron() {
        return idFanfaron;
    }

    public void setIdFanfaron(String idFanfaron) {
        this.idFanfaron = idFanfaron;
    }

    public int getIdGroupe() {
        return idGroupe;
    }

    public void setIdGroupe(int idGroupe) {
        this.idGroupe = idGroupe;
    }

    @Override
    public String toString() {
        return "InscriptionGroupe{" +
                "idFanfaron='" + idFanfaron + '\'' +
                ", idGroupe=" + idGroupe +
                '}';
    }
}
