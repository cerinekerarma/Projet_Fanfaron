package dao;

import java.util.List;

public interface InscriptionGroupeDAO {
    boolean insert(InscriptionGroupe inscriptionGroupe);
    boolean delete(String login, int groupeId);
    InscriptionGroupe find(String id);
    List<InscriptionGroupe> findAll();
}
