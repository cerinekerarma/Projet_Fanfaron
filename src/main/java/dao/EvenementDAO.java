package dao;

import java.util.List;

public interface EvenementDAO {
    Evenement find(int id);
    List<Evenement> findAll();
    boolean insert(Evenement evenement);
    boolean update(Evenement evenement);
    boolean delete(int id);
}
