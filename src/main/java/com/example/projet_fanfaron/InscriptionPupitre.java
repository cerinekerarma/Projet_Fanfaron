package com.example.projet_fanfaron;

public class InscriptionPupitre {
    private String idFanfaron;
    private int idPupitre;

    public InscriptionPupitre(String idFanfaron, int idPupitre) {
        this.idFanfaron = idFanfaron;
        this.idPupitre = idPupitre;
    }

    public String getIdFanfaron() {
        return idFanfaron;
    }

    public void setIdFanfaron(String idFanfaron) {
        this.idFanfaron = idFanfaron;
    }

    public int getIdPupitre() {
        return idPupitre;
    }

    public void setIdPupitre(int idPupitre) {
        this.idPupitre = idPupitre;
    }

    @Override
    public String toString() {
        return "InscriptionPupitre{" +
                "idFanfaron='" + idFanfaron + '\'' +
                ", idPupitre=" + idPupitre +
                '}';
    }
}
