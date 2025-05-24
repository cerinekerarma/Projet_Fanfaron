package dao;

import java.util.List;

public interface InscriptionPupitreDAO {
    boolean insert(InscriptionPupitre inscriptionPupitre);
    boolean delete(String login, int pupitreId);
    InscriptionPupitre find(String idFanfaron);
    List<InscriptionPupitre> findAllByFanfaron(String idFanfaron);
    List<InscriptionPupitre> findAll();
}
