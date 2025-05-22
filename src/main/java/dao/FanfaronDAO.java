package dao;

import java.util.List;

public interface FanfaronDAO {
    boolean insert(Fanfaron fanfaron);
    boolean update(Fanfaron fanfaron);
    boolean delete(long id);
    Fanfaron find(String id);
    List<Fanfaron> findAll();
    Fanfaron matchPassword(String id, String password);
}
