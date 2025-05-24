package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InscriptionPupitreJDBCDAO implements InscriptionPupitreDAO {

    private final DbConnectionManager dbManager;

    public InscriptionPupitreJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public boolean insert(InscriptionPupitre inscriptionPupitre) {
        String query = "INSERT INTO inscription_pupitre (id_fanfaron, id_pupitre) VALUES (?, ?) RETURNING id_fanfaron";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, inscriptionPupitre.getIdFanfaron());
            stmt.setInt(2, inscriptionPupitre.getIdPupitre());

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(String login, int pupitreId) {
        String query = "DELETE FROM inscription_pupitre WHERE id_fanfaron = ? AND id_pupitre = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, login);
            stmt.setInt(2, pupitreId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public InscriptionPupitre find(String idFanfaron) {
        String query = "SELECT id_fanfaron, id_pupitre FROM inscription_pupitre WHERE id_fanfaron = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, idFanfaron);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new InscriptionPupitre(
                            rs.getString("id_fanfaron"),
                            rs.getInt("id_pupitre")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<InscriptionPupitre> findAllByFanfaron(String idFanfaron) {
        List<InscriptionPupitre> inscriptions = new ArrayList<>();
        String query = "SELECT id_fanfaron, id_pupitre FROM inscription_pupitre WHERE id_fanfaron = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, idFanfaron);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    inscriptions.add(new InscriptionPupitre(
                            rs.getString("id_fanfaron"),
                            rs.getInt("id_pupitre")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inscriptions;
    }

    @Override
    public List<InscriptionPupitre> findAll() {
        List<InscriptionPupitre> inscriptions = new ArrayList<>();
        String query = "SELECT id_fanfaron, id_pupitre FROM inscription_pupitre";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                inscriptions.add(new InscriptionPupitre(
                        rs.getString("id_fanfaron"),
                        rs.getInt("id_pupitre")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inscriptions;
    }
}
