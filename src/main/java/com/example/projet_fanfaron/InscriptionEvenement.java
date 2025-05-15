package com.example.projet_fanfaron;

public class InscriptionEvenement {
    private String idFanfaron;
    private int idPupitre;
    private int idEvenement;
    private String status;

    public InscriptionEvenement(String idFanfaron, int idPupitre, int idEvenement, String status) {
        this.idFanfaron = idFanfaron;
        this.idPupitre = idPupitre;
        this.idEvenement = idEvenement;
        this.status = status;
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

    public int getIdEvenement() {
        return idEvenement;
    }

    public void setIdEvenement(int idEvenement) {
        this.idEvenement = idEvenement;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "InscriptionEvenement{" +
                "idFanfaron='" + idFanfaron + '\'' +
                ", idPupitre=" + idPupitre +
                ", idEvenement=" + idEvenement +
                ", status='" + status + '\'' +
                '}';
    }
}
