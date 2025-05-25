package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InscriptionEvenementJDBCDAO implements InscriptionEvenementDAO {

    private final DbConnectionManager dbManager;

    public InscriptionEvenementJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public boolean insert(InscriptionEvenement inscription) {
        String query = "INSERT INTO inscription_evenement (id_fanfaron, id_pupitre, id_evenement, status) " +
                "VALUES (?, ?, ?, ?) RETURNING id_fanfaron";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, inscription.getIdFanfaron());
            stmt.setInt(2, inscription.getIdPupitre());
            stmt.setInt(3, inscription.getIdEvenement());
            stmt.setString(4, inscription.getStatus());

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(String idFanfaron, int idEvenement) {
        String query = "DELETE FROM inscription_evenement WHERE id_fanfaron = ? AND id_evenement = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, idFanfaron);
            stmt.setInt(2, idEvenement);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public InscriptionEvenement find(String idFanfaron, int idEvenement) {
        String query = "SELECT * FROM inscription_evenement WHERE id_fanfaron = ? AND id_evenement = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, idFanfaron);
            stmt.setInt(2, idEvenement);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new InscriptionEvenement(
                            rs.getString("id_fanfaron"),
                            rs.getInt("id_pupitre"),
                            rs.getInt("id_evenement"),
                            rs.getString("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<InscriptionEvenement> findAllByFanfaron(String idFanfaron) {
        List<InscriptionEvenement> inscriptions = new ArrayList<>();
        String query = "SELECT * FROM inscription_evenement WHERE id_fanfaron = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, idFanfaron);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    inscriptions.add(new InscriptionEvenement(
                            rs.getString("id_fanfaron"),
                            rs.getInt("id_pupitre"),
                            rs.getInt("id_evenement"),
                            rs.getString("status")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inscriptions;
    }

    @Override
    public List<InscriptionEvenement> findAll() {
        List<InscriptionEvenement> inscriptions = new ArrayList<>();
        String query = "SELECT * FROM inscription_evenement";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                inscriptions.add(new InscriptionEvenement(
                        rs.getString("id_fanfaron"),
                        rs.getInt("id_pupitre"),
                        rs.getInt("id_evenement"),
                        rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inscriptions;
    }

    @Override
    public boolean update(InscriptionEvenement inscription) {
        String query = "UPDATE inscription_evenement " +
                "SET status = ? " +
                "WHERE id_fanfaron = ? AND id_pupitre = ? AND id_evenement = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, inscription.getStatus());
            stmt.setString(2, inscription.getIdFanfaron());
            stmt.setInt(3, inscription.getIdPupitre());
            stmt.setInt(4, inscription.getIdEvenement());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


}
