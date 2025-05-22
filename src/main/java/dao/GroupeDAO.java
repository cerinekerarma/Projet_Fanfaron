package dao;

import java.util.List;

public interface GroupeDAO {
    //boolean insert(Groupe fanfaron);
    //boolean update(Groupe fanfaron);
    //boolean delete(long id);
    Groupe find(String id);
    List<Groupe> findAll();
}
