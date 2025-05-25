package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EvenementJDBCDAO implements EvenementDAO {

    private final DbConnectionManager dbManager;

    public EvenementJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public Evenement find(int id) {
        String query = "SELECT * FROM evenement WHERE id = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return ligneToEvenement(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log properly in production
        }
        return null;
    }

    @Override
    public List<Evenement> findAll() {
        List<Evenement> evenements = new ArrayList<>();
        String query = "SELECT * FROM evenement ORDER BY date DESC";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                evenements.add(ligneToEvenement(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evenements;
    }

    @Override
    public boolean insert(Evenement evenement) {
        String query = "INSERT INTO evenement (date, nom, lieu, description, type, createur) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setTimestamp(1, Timestamp.valueOf(evenement.getDate()));
            stmt.setString(2, evenement.getNom());
            stmt.setString(3, evenement.getLieu());
            stmt.setString(4, evenement.getDescription());
            stmt.setString(5, evenement.getType());
            stmt.setString(6, evenement.getCreateur());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Evenement evenement) {
        String query = "UPDATE evenement SET date = ?, nom = ?, lieu = ?, description = ?, type = ?, createur = ? WHERE id = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setTimestamp(1, Timestamp.valueOf(evenement.getDate()));
            stmt.setString(2, evenement.getNom());
            stmt.setString(3, evenement.getLieu());
            stmt.setString(4, evenement.getDescription());
            stmt.setString(5, evenement.getType());
            stmt.setString(6, evenement.getCreateur());
            stmt.setInt(7, evenement.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String query = "DELETE FROM evenement WHERE id = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Evenement ligneToEvenement(ResultSet rs) throws SQLException {
        return new Evenement(
                rs.getInt("id"),
                rs.getTimestamp("date").toLocalDateTime(),
                rs.getString("nom"),
                rs.getString("lieu"),
                rs.getString("description"),
                rs.getString("type"),
                rs.getString("createur")
        );
    }
}
