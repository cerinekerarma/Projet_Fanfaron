package dao;

import java.util.List;

public interface InscriptionGroupeDAO {
    boolean insert(InscriptionGroupe inscriptionGroupe);
    boolean update(InscriptionGroupe inscriptionGroupe);
    boolean delete(long id);
    InscriptionGroupe find(String id);
    List<InscriptionGroupe> findAll();
}
