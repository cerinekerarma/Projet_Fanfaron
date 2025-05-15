package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FanfaronJDBCDAO implements FanfaronDAO {
    private DbConnectionManager dbManager;

    public FanfaronJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public boolean insert(Fanfaron fanfaron) {
        try (Connection conn = dbManager.getConnection()) {
            String query = "INSERT INTO Fanfaron (login, nom, prenom, adresse, genre, mdp, crt_alimentaire, derniere_connection, date_creation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING login";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, fanfaron.getLogin());
                stmt.setString(2, fanfaron.getNom());
                stmt.setString(3, fanfaron.getPrenom());
                stmt.setString(4, fanfaron.getAdresse());
                stmt.setString(5, fanfaron.getGenre());
                stmt.setString(6, fanfaron.getMdp());
                stmt.setString(7, fanfaron.getCrtAlimentaire());
                stmt.setTimestamp(8, new Timestamp(fanfaron.getDerniereConnection().getTime()));
                stmt.setTimestamp(9, new Timestamp(fanfaron.getDateCreation().getTime()));

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String login = rs.getString("login");
                    fanfaron.setLogin(login);
                    return true;
                }
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean update(Fanfaron fanfaron) {
        return false;
    }

    @Override
    public boolean delete(long id) {
        return false;
    }

    @Override
    public Fanfaron find(long id) {
        return null; // Si aucun fanfaron n'est trouvé
    }

    @Override
    public List<Fanfaron> findAll() {
        return null;
    }

}