package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FanfaronJDBCDAO implements FanfaronDAO {
    private final DbConnectionManager dbManager;

    public FanfaronJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public boolean insert(Fanfaron fanfaron) {
        try (Connection conn = dbManager.getConnection()) {
            String query = "INSERT INTO Fanfaron (login, nom, prenom, adresse, genre, mdp, crt_alimentaire, derniere_connection, date_creation, is_admin, activated) VALUES (?, ?, ?, ?, ?, digest(?, 'sha256'), ?, ?, ?, ?, ?) RETURNING login";
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
                stmt.setBoolean(10, fanfaron.isAdmin());
                stmt.setBoolean(11, fanfaron.isActivated());

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String login = rs.getString("login");
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
        boolean hasPassword = fanfaron.getMdp() != null && !fanfaron.getMdp().trim().isEmpty();
        System.out.println("dans update: "+fanfaron.getMdp());
        String query;
        if (hasPassword) {
            query = "UPDATE Fanfaron SET nom = ?, prenom = ?, adresse = ?, genre = ?, mdp = digest(?, 'sha256'), crt_alimentaire = ? WHERE login = ?";
        } else {
            query = "UPDATE Fanfaron SET nom = ?, prenom = ?, adresse = ?, genre = ?, crt_alimentaire = ? WHERE login = ?";
        }

        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, fanfaron.getNom());
            stmt.setString(2, fanfaron.getPrenom());
            stmt.setString(3, fanfaron.getAdresse());
            stmt.setString(4, fanfaron.getGenre());

            if (hasPassword) {
                stmt.setString(5, fanfaron.getMdp());
                stmt.setString(6, fanfaron.getCrtAlimentaire());
                stmt.setString(7, fanfaron.getLogin());
            } else {
                stmt.setString(5, fanfaron.getCrtAlimentaire());
                stmt.setString(6, fanfaron.getLogin());
            }

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(long id) {
        return false;
    }

    @Override
    public Fanfaron find(String id) {
        String sql = "SELECT login, nom, prenom, adresse, genre, mdp, crt_alimentaire, derniere_connection, date_creation, is_admin, activated FROM Fanfaron  WHERE login = ?";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return new Fanfaron(
                                rs.getString("login"),
                                rs.getString("nom"),
                                rs.getString("prenom"),
                                rs.getString("adresse"),
                                rs.getString("genre"),
                                rs.getString("mdp"),
                                rs.getString("crt_alimentaire"),
                                rs.getTimestamp("derniere_connection"),
                                rs.getTimestamp("date_creation"),
                                rs.getBoolean("is_admin"),
                                rs.getBoolean("activated")
                        );
                    }
                }
            } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Fanfaron matchPassword(String id, String password) {
        String sql = "SELECT login, nom, prenom, adresse, genre, mdp, crt_alimentaire, derniere_connection, date_creation, is_admin, activated FROM Fanfaron  WHERE login = ? and mdp = digest(?, 'sha256')";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Fanfaron(
                            rs.getString("login"),
                            rs.getString("nom"),
                            rs.getString("prenom"),
                            rs.getString("adresse"),
                            rs.getString("genre"),
                            rs.getString("mdp"),
                            rs.getString("crt_alimentaire"),
                            rs.getTimestamp("derniere_connection"),
                            rs.getTimestamp("date_creation"),
                            rs.getBoolean("is_admin"),
                            rs.getBoolean("activated")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Fanfaron> findAll() {
        return null;
    }

}