package dao;

import java.util.List;

public interface PupitreDAO {
    Pupitre find(int id);
    List<Pupitre> findAll();
}
