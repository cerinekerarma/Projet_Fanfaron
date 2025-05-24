package dao;

import java.util.List;

public interface GroupeDAO {
    Groupe find(int id);
    List<Groupe> findAll();
}
