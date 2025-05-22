package dao;

import java.util.List;

public interface GroupeDAO {
    //boolean insert(Groupe groupe);
    //boolean update(Groupe groupe);
    //boolean delete(long id);
    Groupe find(String id);
    List<Groupe> findAll();
}
