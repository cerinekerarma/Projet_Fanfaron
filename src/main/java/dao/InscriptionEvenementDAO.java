package dao;

import java.util.List;

public interface InscriptionEvenementDAO {
    boolean insert(InscriptionEvenement inscription);
    boolean delete(String idFanfaron, int idEvenement);
    InscriptionEvenement find(String idFanfaron, int idEvenement);
    List<InscriptionEvenement> findAllByFanfaron(String idFanfaron);
    List<InscriptionEvenement> findAll();
    boolean update(InscriptionEvenement inscription);
}
