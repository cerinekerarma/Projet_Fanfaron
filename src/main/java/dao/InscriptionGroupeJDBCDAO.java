package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InscriptionGroupeJDBCDAO implements InscriptionGroupeDAO {

    private final DbConnectionManager dbManager;

    public InscriptionGroupeJDBCDAO(DbConnectionManager dbManager) {
        this.dbManager = dbManager;
    }

    @Override
    public boolean insert(InscriptionGroupe inscriptionGroupe) {
        String query = "INSERT INTO inscription_groupe (id_fanfaron, id_groupe) VALUES (?, ?) RETURNING id_fanfaron";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, inscriptionGroupe.getIdFanfaron());
            stmt.setInt(2, inscriptionGroupe.getIdGroupe());

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(String login, int groupeId) {
        String query = "DELETE FROM inscription_groupe WHERE id_fanfaron = ? and id_groupe = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, login);
            stmt.setInt(2, groupeId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public InscriptionGroupe find(String idFanfaron) {
        String query = "SELECT id_fanfaron, id_groupe FROM inscription_groupe WHERE id_fanfaron = ?";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, idFanfaron);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new InscriptionGroupe(rs.getString("id_fanfaron"), rs.getInt("id_groupe"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<InscriptionGroupe> findAllByFanfaron(String idFanfaron) {
        List<InscriptionGroupe> inscriptions = new ArrayList<>();
        String query = "SELECT id_fanfaron, id_groupe FROM inscription_groupe WHERE id_fanfaron = ?";

        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, idFanfaron);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    inscriptions.add(new InscriptionGroupe(
                            rs.getString("id_fanfaron"),
                            rs.getInt("id_groupe")
                    ));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // en prod, mieux vaut logger proprement
        }

        return inscriptions;
    }


    @Override
    public List<InscriptionGroupe> findAll() {
        List<InscriptionGroupe> inscriptions = new ArrayList<>();
        String query = "SELECT id_fanfaron, id_groupe FROM inscription_groupe";
        try (Connection conn = dbManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                inscriptions.add(new InscriptionGroupe(
                        rs.getString("id_fanfaron"),
                        rs.getInt("id_groupe")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inscriptions;
    }
}
